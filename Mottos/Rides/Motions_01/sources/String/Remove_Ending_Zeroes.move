
module Ride_01::Motions_01_String_Remove_Ending_Zeroes {

	#[view]
	public fun promptly (sequence : String) : String {		
		//
		//	This guarantees that has .# in the string
		//
		//
		let has_decimal_and_glyph_after = false;
		let index_1 = 0;
		let sequence_length = string::length (& sequence);
		for (index_1 in 0..sequence_length) {
			let glyph = string::sub_string (& sequence, index_1, index_1 + 1);
			if (glyph == utf8 (b".")) {
				if (index_1 < sequence_length) {
					has_decimal_and_glyph_after = true;
				}
			}
		};
		if (has_decimal_and_glyph_after != true) {
			return sequence;
		};
		
		
		//
		//	run through string from end to find the index of the last zero.
		//
		//
		let last_zero_index = 0;
		let last_zero_index_sensed = false;
		let last_zero_is_next_to_dot = false;
		//
		let index_end_2 = 0;
		let index_2 = sequence_length - 1;
		while (index_2 >= index_end_2) {
			let glyph = string::sub_string (& sequence, index_2, index_2 + 1);
			
			debug::print (
				& string_utils::format3 (
					& b"while: [{}] [{}] [{}]", 
					sequence,
					index_2,
					glyph
				)
			);
			
			if (glyph == utf8 (b"0")) {
				if (string::sub_string (& sequence, index_2 - 1, index_2) == utf8 (b".")) {
					debug::print (
						& string_utils::format1 (
							& b"is next to .: [{}]", 
							sequence
						)
					);
						
					return sequence;
				};
				
				//
				//	modify the last_zero_index sensor	
				//
				//
				last_zero_index = index_2;
				last_zero_index_sensed = true;
			}
			else {
				break;
			};
			
			index_2 = index_2 - 1;
		};

		debug::print (
			& string_utils::format3 (
				& b"last_zero_index: {} {} {}", 
				last_zero_index,
				last_zero_index_sensed,
				last_zero_is_next_to_dot
			)
		);

		if (last_zero_index_sensed == false) {			
			return sequence;
		};
		
		if (last_zero_is_next_to_dot == true) {			
			return sequence;
		};
		
		
		//
		//	if last_zero_index_sensed, then remove zeroes from the end.
		//
		//
		let result = utf8 (b"");
		let index_3 = 0;
		while (index_3 <= last_zero_index - 1) {
			let glyph = string::sub_string (& sequence, index_3, index_3 + 1);
			
			debug::print (
				& string_utils::format1 (
					& b"appending: {}", 
					glyph
				)
			);
			
			string::append (&mut result, glyph);
			
			index_3 = index_3 + 1;
		};
		
		result
	}
	
	
}