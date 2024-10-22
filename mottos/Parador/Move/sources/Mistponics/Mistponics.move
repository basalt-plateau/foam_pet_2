


module ride::Mistponics {
	use std::string::{ Self, String };
	use std::signer;
	
	use ride::Loft;
	use ride::Quary_u64;

	#[view]
	public fun togetherness () : String {
		let togetherness = Loft::togetherness ();
		togetherness
	}
	
	
	
}




