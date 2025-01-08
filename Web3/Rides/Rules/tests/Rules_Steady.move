









module ride::Rules_09_Steady {

	use std::string::{ Self, String };
	
	#[test]
    public fun steady_1 () {
		use std::debug;
		use std::string_utils;
		
		use ride::Rules_09;
		let rules : String = Rules_09::Volitions_01 ();
		
		debug::print (& string_utils::format1 (
			& b"Rules: {}", 
			rules
		));
		
		debug::print (& string_utils::format1 (
			& b"Rules Length: {}", 
			string::length (& rules)
		));
		
		assert (string::length (& rules) == 287, 0);
    }
}