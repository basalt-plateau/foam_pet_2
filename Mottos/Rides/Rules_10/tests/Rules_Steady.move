









module Ride_01::Rules_10_Steady {

	
	
	#[test]
    public fun steady_1 () {
		use std::debug;
		use std::string_utils;
		use std::string::{ Self, String };
		
		use Ride_01::Rules_10;
		let rules : String = Rules_10::Volitions_01 ();
		
		debug::print (& string_utils::format1 (
			& b"Rules: {}", 
			rules
		));
		
		debug::print (& string_utils::format1 (
			& b"Rules Length: {}", 
			string::length (& rules)
		));
		
		assert! (string::length (& rules) == 377, 0);
    }
}