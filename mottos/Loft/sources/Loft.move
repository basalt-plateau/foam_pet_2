



/*
	Everyone is allowed to:
		* remix this module.
		* distribute dittos or remixes of this module.
		* interact with the module however.
	
	Endorsed by Parador
*/



module ride::Loft {
	
	use std::string::{ String, utf8 };
	use std::vector;
	
	#[view]
    public fun cordiality () : String {
		let vector_01 : vector<u8> = b"Everyone is allowed to:\n";
		let vector_02 : vector<u8> = b"\t* remix this module.\n";	
		let vector_03 : vector<u8> = b"\t* distribute dittos or remixes of this module.\n";		
		let vector_04 : vector<u8> = b"\t* interact with the module however.\n";		
		let vector_05 : vector<u8> = b"\n";						
        let vector_06 : vector<u8> = b"Endorsed by Parador";
		
		let vectors : vector<u8> = vector::empty<u8> ();
		vector::append (&mut vectors, vector_01);
		vector::append (&mut vectors, vector_02);
		vector::append (&mut vectors, vector_03);
		vector::append (&mut vectors, vector_04);
		vector::append (&mut vectors, vector_05);
		vector::append (&mut vectors, vector_06);

		let proceeds : String = utf8 (vectors);
		proceeds
	}
}


