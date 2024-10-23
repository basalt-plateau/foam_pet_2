


module ride::Mistponics {
	use std::string::{ Self, String };
	use std::signer;
	
	use ride::Loft;
	use ride::Quarry_u64;

	#[view]
	public fun togetherness () : String {
		let togetherness = Loft::togetherness ();
		togetherness
	}
	
	
	
}




