


/*
	Vintage.  
		Butte -> Taffoni
*/

module ride::Pergola_Butte {
	
	use std::string::{ String };
	
	use ride::Loft;
	
	#[view]
    public fun togetherness () : String {
		let togetherness = Loft::togetherness ();
		togetherness
    }
	
	struct Butte {}
	

	
	
	
}
