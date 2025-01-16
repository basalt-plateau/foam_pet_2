


module Ride_01::Motions_01_String_Guarantee_Equality {
	
	use std::string::{ String, utf8 };
	use std::string_utils;
	use std::debug;
	
	
	
	#[view]
	public fun Volitions () : String { use Ride_01::Rules_10; Rules_10::Volitions_01 () }
	
	
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

			abort 947312;
		}
	}

	
	#[test]
    public fun steady_01 () {
		guarantee_string_equality (& utf8 (b""), & utf8 (b""));
		guarantee_string_equality (& utf8 (b"9483"), & utf8 (b"9483"));
		guarantee_string_equality (& utf8 (b" "), & utf8 (b" "));
	}
	
	#[test]
	#[expected_failure (abort_code = 947312, location = Self)]
    public fun steady_02 () {
		guarantee_string_equality (& utf8 (b"1"), & utf8 (b""));
	}
	
	#[test]
	#[expected_failure (abort_code = 947312, location = Self)]
    public fun steady_03 () {
		guarantee_string_equality (& utf8 (b" "), & utf8 (b""));
	}
	
	#[test]
	#[expected_failure (abort_code = 947312, location = Self)]
    public fun steady_04 () {
		guarantee_string_equality (& utf8 (b" "), & utf8 (b"."));
	}
}