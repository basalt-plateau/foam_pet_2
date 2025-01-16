


module Ride_01::Motions_01_String_Guarantee_Equality {
	
	use std::string::{ String, utf8 };
	use std::string_utils;
	use std::debug;
	
	public fun promptly (
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

			abort 947312;
		}
	}

	
	#[test]
    public fun steady_01 () {
		promptly (& utf8 (b""), & utf8 (b""));
		promptly (& utf8 (b"9483"), & utf8 (b"9483"));
		promptly (& utf8 (b" "), & utf8 (b" "));
	}
	
	#[test]
	#[expected_failure (abort_code = 947312, location = Self)]
    public fun steady_02 () {
		promptly (& utf8 (b"1"), & utf8 (b""));
	}
	
	#[test]
	#[expected_failure (abort_code = 947312, location = Self)]
    public fun steady_03 () {
		promptly (& utf8 (b" "), & utf8 (b""));
	}
	
	#[test]
	#[expected_failure (abort_code = 947312, location = Self)]
    public fun steady_04 () {
		promptly (& utf8 (b" "), & utf8 (b"."));
	}
}