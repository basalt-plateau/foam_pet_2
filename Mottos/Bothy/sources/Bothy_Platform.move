





module ride::Bothy_Platform {
	use std::string::{ String };
	
	use ride::Loft;

	#[view]
	public fun togetherness () : String {
		let togetherness = Loft::togetherness ();
		togetherness
	}
	
	
	
}




