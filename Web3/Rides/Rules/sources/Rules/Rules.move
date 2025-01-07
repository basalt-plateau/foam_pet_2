



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
		
		vector::append (&mut vectors, b"\n\nThis module is everyone's to play with however \n");
		vector::append (&mut vectors, b"they so please.\n");
		vector::append (&mut vectors, b"\n");
		vector::append (&mut vectors, b"Everyone is allowed to make modules that are \n");
		vector::append (&mut vectors, b"exactly the same or derivate of this module.\n");
		vector::append (&mut vectors, b"\n");
		vector::append (&mut vectors, b"Any module that volunteers these volitions\n");
		vector::append (&mut vectors, b"permits these volitions for that module.\n");
		vector::append (&mut vectors, b"\n");
		vector::append (&mut vectors, b"These volitions are given by the producer.\n\n");

		utf8 (vectors)
	}
}


