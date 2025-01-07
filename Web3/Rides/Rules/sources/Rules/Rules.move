



module ride::Rules_02 {
	
	/*
		This module is everyone's to play with however 
		they so please.

		Everyone is allowed to make modules that are 
		exactly the same or derivate of this module.
		
		Any module that volunteers these volitions
		permits these volitions for that module.
		
		These volitions are given by the producer.
	*/
	
	use std::string::{ String, utf8 };
	use std::vector;
	
	#[view]
    public fun Volitions_01 () : String {
		let vectors : vector<u8> = vector::empty<u8> ();
		
		let vector_01 : vector<u8> = b"\n\nThis module is everyone's to play with however \n";
		vector::append (&mut vectors, vector_01);
		
		let vector_02 : vector<u8> = b"they so please.\n";
		vector::append (&mut vectors, vector_02);
		
		let vector_03 : vector<u8> = b"\n";		
		vector::append (&mut vectors, vector_03);
		
		let vector_04 : vector<u8> = b"Everyone is allowed to make modules that are \n";		
		vector::append (&mut vectors, vector_04);
		
		let vector_05 : vector<u8> = b"exactly the same or derivate of this module.\n";		
		vector::append (&mut vectors, vector_05);
		
		let vector_06 : vector<u8> = b"\n";		
		vector::append (&mut vectors, vector_06);
		
		let vector_07 : vector<u8> = b"Any module that volunteers these volitions\n";		
		vector::append (&mut vectors, vector_07);
	
		let vector_08 : vector<u8> = b"permits these volitions for that module.\n";		
		vector::append (&mut vectors, vector_08);
	
		let vector_09 : vector<u8> = b"\n";		
		vector::append (&mut vectors, vector_09);
	
		let vector_10 : vector<u8> = b"These volitions are given by the producer.\n\n";		
		vector::append (&mut vectors, vector_10);
	
		utf8 (vectors)
	}
}


