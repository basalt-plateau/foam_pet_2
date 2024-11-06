







module ride::Quarry_u8_Steady {
	use std::string::{ Self, String };
	use std::debug;
	
	use ride::Quarry_u8;

	const Problem : u64 = 0;

	
	//
	//	create_string_from_u64
	//
	//
	#[test]
    public fun create_string_from_u8_0 () {
		let u8_1 : u8 = 0;
		let proceeds : String = Quarry_u8::u8_to_hexadecimal_string (u8_1);
		assert! (
			proceeds == string::utf8 (b"0"), 
			Problem
		);
    }
	
	
	#[test]
    public fun create_string_from_u8 () {
		let u8_0 : u8 = 0;
		assert! (Quarry_u8::u8_to_hexadecimal_string (u8_0) == string::utf8 (b"0"), Problem);
		
		let u8_1 : u8 = 1;
		assert! (Quarry_u8::u8_to_hexadecimal_string (u8_1) == string::utf8 (b"1"), Problem);
		
		let u8_2 : u8 = 2;
		assert! (Quarry_u8::u8_to_hexadecimal_string (u8_2) == string::utf8 (b"2"), Problem);
		
		
		
    }
}

