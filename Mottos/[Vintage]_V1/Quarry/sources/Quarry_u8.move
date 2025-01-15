


/*
	Naturals, Wholes, Discretes:
		0 to (2^8 - 1)
		
	Lovely Numbers:
*/
module ride::Quarry_u8 {
	
	use std::string::{ String, utf8 };
	
	use ride::Loft;

	#[view]
	public fun togetherness () : String {
		Loft::togetherness ()
	}
	
	
	// unfinished
	public fun u8_to_hexadecimal_string (f8_1 : u8) : String {
		use std::debug;
		
		debug::print (& f8_1);
		utf8 (b"The f8 could not be adapted into a hexadecimal string.")
	}
	
}