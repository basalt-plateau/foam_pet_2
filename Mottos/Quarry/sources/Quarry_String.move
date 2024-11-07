





/*

*/
module ride::Quarry_String {
	
	use std::string::{ String, utf8 };
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
		// debug::print (b"")
	}

	
}