
module Ride_01::Motions_01_String_Remove_Ending_Zeroes {

	use std::string::{ Self, String, utf8 };
	use std::string_utils;
	use std::debug;
	
	#[view]
	public fun establish_if_string_has_a_dot_then_glyph (sequence : String) : bool {	
		let last_index = string::length (& sequence) - 1;
		for (index_1 in 0..last_index) {
			let glyph = string::sub_string (& sequence, index_1, index_1 + 1);
			if (glyph == utf8 (b".")) {
				if (index_1 < last_index) {
					return true
				}
			}
		};
		
		return false	
	}
	#[test]
    public fun steady_establish_if_string_has_a_dot_then_glyph_01 () {
		use Ride_01::Motions_01_String_Guarantee_Equality::{ guarantee_string_equality };

		assert! (string::length (& utf8 (b"1")) == 1, 1);

		assert! (establish_if_string_has_a_dot_then_glyph (utf8 (b"0.01009000")), 1);
		assert! (establish_if_string_has_a_dot_then_glyph (utf8 (b".0")), 1);
		assert! (establish_if_string_has_a_dot_then_glyph (utf8 (b"..")), 1);
		
		assert! (establish_if_string_has_a_dot_then_glyph (utf8 (b".")) == false, 1);
		assert! (establish_if_string_has_a_dot_then_glyph (utf8 (b"0.")) == false, 1);
	}

	
	
	#[view]
	public fun establish_has_zero_at_end_of_string (sequence : String) : (u64, bool) {	
		let sequence_length = string::length (& sequence);
		
		//
		//	run through string from end to find the index of the last zero.
		//
		//
		let last_zero_index = 0;
		let last_zero_index_sensed = false;
		//
		let index_end_2 = 0;
		let index_2 = sequence_length - 1;
		while (index_2 >= index_end_2) {
			if (utf8 (b"0") == string::sub_string (& sequence, index_2, index_2 + 1)) {				
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
		
		return (last_zero_index, last_zero_index_sensed)
	}
	#[test]
    public fun steady_establish_last_zero_of_string_01 () {
		use Ride_01::Motions_01_String_Guarantee_Equality::{ guarantee_string_equality };

		let (last_zero_index, last_zero_index_sensed) = establish_has_zero_at_end_of_string (utf8 (b"0.01009000"));
		assert! (last_zero_index_sensed == true, 1);
		assert! (last_zero_index == 7, 1);
	}
	#[test]
    public fun steady_establish_last_zero_of_string_03 () {
		use Ride_01::Motions_01_String_Guarantee_Equality::{ guarantee_string_equality };

		let (last_zero_index, last_zero_index_sensed) = establish_has_zero_at_end_of_string (utf8 (b"0.1"));
		assert! (last_zero_index_sensed == false, 1);
	}
	
	
	#[view]
	public fun remove_ending_zeroes (sequence : String) : String {	
		let sequence_length = string::length (& sequence);
		
		//
		//	Establishing if there's a "._" in the string
		//
		//
		if (establish_if_string_has_a_dot_then_glyph (sequence) != true) {
			return sequence
		};
		
		//
		//	Establish if there's a zero at the end.
		//
		//
		let (last_zero_index, last_zero_index_sensed) = establish_has_zero_at_end_of_string (sequence);
		if (last_zero_index_sensed == false) {			
			return sequence;
		};
		
		
		//
		//	Return original if is "____.0"
		//
		//
		if (string::sub_string (& sequence, last_zero_index - 1, last_zero_index) == utf8 (b".")) {
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
	
	#[test]
    public fun steady_remove_ending_zeroes () {
		use std::string::{ String, utf8 };
		use std::string_utils;
		use std::signer;
		use std::debug;

		use Ride_01::Motions_01_String_Guarantee_Equality::{ guarantee_string_equality };

		// modifications
		guarantee_string_equality (& remove_ending_zeroes (utf8 (b"0.01009000")), & utf8 (b"0.01009"));
		guarantee_string_equality (& remove_ending_zeroes (utf8 (b"0.0102000")), & utf8 (b"0.0102"));
		guarantee_string_equality (& remove_ending_zeroes (utf8 (b"0.01000000")), & utf8(b"0.01"));
		guarantee_string_equality (& remove_ending_zeroes (utf8 (b"0.10010")), & utf8(b"0.1001"));

		// no modifications
		guarantee_string_equality (& remove_ending_zeroes (utf8 (b"1.")), & utf8 (b"1."));
		guarantee_string_equality (& remove_ending_zeroes (utf8 (b"0.10001")), & utf8(b"0.10001"));
		
		// no modifications zero next to dot
		guarantee_string_equality (& remove_ending_zeroes (utf8 (b"21.0")), & utf8 (b"21.0"));
		guarantee_string_equality (& remove_ending_zeroes (utf8 (b"1.0")), & utf8 (b"1.0"));
	}
	
	
}