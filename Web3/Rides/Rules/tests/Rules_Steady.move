









module ride::Rules_02_Steady {

	use std::string::{ String, utf8 };
	use std::vector;
	
	const Problem : u64 = 0;
	
	#[test]
    public fun steady_1 () {
		use std::string;
		use std::string::{ utf8 };
		use std::debug;
		use std::string_utils;
		
		use ride::Rules_02;
		let rules : String = Rules_02::Volitions_01 ();
		
		debug::print (& string_utils::format1 (
			& b"Rules: {}", 
			rules
		));
    }
}