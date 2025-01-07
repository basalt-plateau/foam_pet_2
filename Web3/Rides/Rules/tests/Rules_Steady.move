









module ride::Rules_02_Steady {

	use std::string::{ Self, String, utf8 };
	
	
	#[test]
    public fun steady_1 () {
		use std::debug;
		
		use std::string_utils;
		use std::vector;
		
		use ride::Rules_02;
		let rules : String = Rules_02::Volitions_01 ();
		
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