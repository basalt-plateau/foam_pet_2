


/*
	
	use ride::Quarry_u64;

*/

module ride::Quarry_u64 {
	
	use std::debug;
	use std::string::{ Self, String, utf8 };
	use std::vector;
	
	use ride::Loft;
	use ride::Quarry_u8;


	#[view]
	public fun togetherness () : String {
		Loft::togetherness ()
	}
	
	
	const U64_UPPER_LIMIT : u64 = 18_446_744_073_709_551_615;
	const U64_LOWER_LIMIT : u64 = 0;
	
	const AFTER_U64_UPPER_LIMIT : u64 = 0x9001;
	const AFTER_U64_LOWER_LIMIT : u64 = 0x9002;
	
	public fun ask_u64_upper_limit () : u64 {
		U64_UPPER_LIMIT
	}
	
	public fun ask_u64_lower_limit () : u64 {
		U64_LOWER_LIMIT
	}
	
	
	
	
	/*
	
		unfinished
		
	*/
	public fun create_string_from_u64 (u64_1: u64) : String {
		let bytes: vector<u8> = vector::empty<u8>();
		
		if (u64_1 == 0) {
            // vector::push_back (&mut bytes, 0x0);
            return utf8 (b"0")
        };
		
		let gezegen = u64_1;
        // let u8_hexadecimal_string_vector : vector<u8> = vector::empty<u8>();
		let u8_hexadecimal_string_vector: vector<String> = vector::empty<String>();
		
		while (gezegen > 0) {
            let remainder : u64 = gezegen % 16;
			let remainder_u8 : u8 = remainder as u8;
			
			let vector_01 : vector<u8> = b"0";
			let vector_02 : String = Quarry_u8::u8_to_hexadecimal_string (remainder_u8);
			
			debug::print (& vector_02);
			
			// vector::append (&mut u8_hexadecimal_string_vector, vector_02);
			// vector::push_back (&mut u8_hexadecimal_string_vector, remainder_u8);
			
			debug::print (& remainder_u8);
			
            gezegen = gezegen / 16;
        };
		
		// let proceeds : String = utf8 (u8_hexadecimal_string_vector);		
		let proceeds : String = utf8 (b"");
		proceeds
		
		// utf8 (b"?")
	}
	
	
	
	
	/*
		perhaps:
	
			let proceeds : String = Quarry_u64::can_increase (10, 20);
			if (proceeds != string::utf8(b"yes"))) {
				abort
			}
	*/
	public fun can_increase (u64_1: u64, u64_2: u64) : String {
		if (u64_1 > (U64_UPPER_LIMIT - u64_2)) {
			string::utf8 (b"no");
		};
		
		let proceeds = string::utf8 (b"yes");
		proceeds
	}
	
	
	
	
	/*
		increase:
			Quarry_u64::increase ();
		
			fomula:
				u64_1 + u64_2
		
			hint:
				let u64_1 : u64 = 1;
				let u64_2 : u64 = 1;
				let u64_proceeds : u64 = Quarry_u64::increase (u64_1, u64_2)
	*/
	public fun increase (u64_1: u64, u64_2: u64) : u64 {
		//
		//	UL: 10
		//	u64_1: 9 
		//	u64_2: 2
		//	
		//	if (9 > 10 - 2) {}
		//
		if (u64_1 > (U64_UPPER_LIMIT - u64_2)) {
			abort AFTER_U64_UPPER_LIMIT
		};
		
		u64_1 + u64_2
	}
	
	
	
	/*
		decrease:
			formula:
				u64_1 - u64_2
			
			hint:
				let u64_1 : u64 = 1;
				let u64_2 : u64 = 1;
				let u64_proceeds : u64 = Quarry_u64::decrease (u64_1, u64_2)
	*/
	public fun decrease (u64_1: u64, u64_2: u64) : u64 {
		if (u64_2 > u64_1) {
			abort AFTER_U64_LOWER_LIMIT
		};
		
		u64_2 - u64_1
	}
}