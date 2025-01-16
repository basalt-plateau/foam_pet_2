


module Ride_01::Motions_01_String_Remove_Leading_Zeroes {
	
	use std::string::{ Self, String, utf8 };
	use std::string_utils;
	use std::debug;
	
	#[view]
	public fun promptly (sequence : String) : String {
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
	
	#[test]
    public fun steady_01 () {
		assert! (utf8 (b"9438") == utf8 (b"9438"), 1);
		
		assert! (promptly (utf8 (b"01009438")) == utf8 (b"1009438"), 1);
		assert! (promptly (utf8 (b"0009438")) == utf8 (b"9438"), 1);
		assert! (promptly (utf8 (b"0001")) == utf8 (b"1"), 1);
		assert! (promptly (utf8 (b"0000012")) == utf8 (b"12"), 1);
		assert! (promptly (utf8 (b"0009438.934")) == utf8 (b"9438.934"), 1);
	}
}