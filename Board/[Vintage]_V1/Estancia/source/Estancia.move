


module ride::Estancia {
	
	
	
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
	
	
	public fun u8_to_hexadecimal_string (byte: u8) : String {
		
		let vectors : vector<u8> = vector::empty<u8> ();
		let vector_01 : vector<u8> = b"";
		vector::append (&mut vectors, vector_01);
		
		let hexadecimal_string_vector : vector<u8> = vector::empty<u8>();

		if (byte == 0) {
			let vector_01 : vector<u8> = b"0";
			vector::append (&mut hexadecimal_string_vector, vector_01);
		}
		else if (byte == 1) {
			let vector_01 : vector<u8> = b"1";
			vector::append (&mut hexadecimal_string_vector, vector_01);
		}
		else if (byte == 2) {
			let vector_01 : vector<u8> = b"2";
			vector::append (&mut hexadecimal_string_vector, vector_01);
		};
		
		
		/*if (byte == 1) {
			vector::push_back (&mut hexadecimal_string, b'1');
		}
		if (byte == 2) {
			vector::push_back (&mut hexadecimal_string, b'2');
		}
		if (byte == 3) {
			vector::push_back (&mut hexadecimal_string, b'3');
		}
		if (byte == 4) {
			vector::push_back (&mut hexadecimal_string, b'4');
		}
		if (byte == 5) {
			vector::push_back (&mut hexadecimal_string, b'5');
		}
		if (byte == 6) {
			vector::push_back (&mut hexadecimal_string, b'6');
		}
		if (byte == 7) {
			vector::push_back (&mut hexadecimal_string, b'7');
		}
		if (byte == 8) {
			vector::push_back (&mut hexadecimal_string, b'8');
		}
		if (byte == 9) {
			vector::push_back (&mut hexadecimal_string, b'9');
		}
		if (byte == 10) {
			vector::push_back (&mut hexadecimal_string, b'A');
		}
		if (byte == 11) {
			vector::push_back (&mut hexadecimal_string, b'B');
		}
		if (byte == 12) {
			vector::push_back (&mut hexadecimal_string, b'C');
		}
		if (byte == 13) {
			vector::push_back (&mut hexadecimal_string, b'D');
		}
		if (byte == 14) {
			vector::push_back (&mut hexadecimal_string, b'E');
		}
		if (byte == 15) {
			vector::push_back (&mut hexadecimal_string, b'F');
		}*/
		
		let proceeds : String = utf8 (hexadecimal_string_vector);
		proceeds
	}
	
	
}