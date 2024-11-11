





/*
	This .move is everyone's kisiwa to
	affect however they so please.

	Making kisiwas that are the
	same or different as this kisiwa is allowed.
	
	Endorsed by Loyal Foam Pet Friends
*/


module ride_1::Merci_Symbiotic {
	
	use std::string::{ String, utf8 };
	use std::vector;
	
	#[view]
    public fun Symbiotic () : String {
		let vector_01 : vector<u8> = b"This .move is everyone's kisiwa to\n";
		let vector_02 : vector<u8> = b"affect however they so please.\n";
		let vector_03 : vector<u8> = b"\n";		
		let vector_04 : vector<u8> = b"Making kisiwas that are the\n";		
		let vector_05 : vector<u8> = b"same or different as this kisiwa is allowed.\n";		
		let vector_06 : vector<u8> = b"\n";				
        let vector_07 : vector<u8> = b"Endorsed by Loyal Foam Pet Friends";
		
		let vectors : vector<u8> = vector::empty<u8> ();
		vector::append (&mut vectors, vector_01);
		vector::append (&mut vectors, vector_02);
		vector::append (&mut vectors, vector_03);
		vector::append (&mut vectors, vector_04);
		vector::append (&mut vectors, vector_05);
		vector::append (&mut vectors, vector_06);
		vector::append (&mut vectors, vector_07);

		utf8 (vectors)
	}
}


