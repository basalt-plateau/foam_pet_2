



module ride::Quarry_u8 {
	
	use std::debug;
	use std::string::{ Self, String, utf8 };
	use std::vector;
	
	
	use ride::Loft;

	#[view]
	public fun togetherness () : String {
		Loft::togetherness ()
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