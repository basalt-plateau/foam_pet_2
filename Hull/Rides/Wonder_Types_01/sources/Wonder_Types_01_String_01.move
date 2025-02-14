


module Ride_01::Wonder_Types_01_String_01 {
	
	use std::string::{ String, utf8 };
	use std::string_utils;
	use std::debug;
	
	public fun guarantee_string_equality (
		parameter_1: & String, 
		parameter_2: & String
	) {
		if (parameter_1 != parameter_2) {
			debug::print (
				& string_utils::format2 (
					&b"{} != {}", 
					* parameter_1, 
					* parameter_2
				)
			);

			abort 1;
		}
	}
	
	#[view]
	public fun remove_leading_zeroes (sequence : String) : String {
		let result = utf8 (b"");
		
		let searching_leading = true;
		
		// let index = 0;
		let index_end = string::length (& sequence);
		for (index in 0..index_end) {
			let glyph = string::sub_string (& sequence, index, index + 1);
			
			if (searching_leading == true) {
				if (glyph == utf8 (b"0")) {
					continue;
				}
				else {
					searching_leading = false;
				};
			};
			
			string::append (&mut result, glyph);
		};
		
		result
	}
}