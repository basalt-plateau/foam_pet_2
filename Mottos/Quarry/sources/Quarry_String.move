





/*

*/
module ride::Quarry_String {
	
	use std::string::{ String  };
	use std::string_utils;	
	use std::debug;
	
	use ride::Loft;

	#[view]
	public fun togetherness () : String {
		Loft::togetherness ()
	}
	
	
	/*
		Quarry_String::announce_string_with_f8 (string_1, f8_1)
		
		announce, say
	*/
	public fun announce_string_with_f8 (
		string_1 : String,
		f8_1 : u8
	) {
		let string_2 : String = string_utils::format2 (& b"{}, {}", string_1, f8_1);
		debug::print (& string_2)
	}

	
}