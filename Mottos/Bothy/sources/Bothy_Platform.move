





module ride::Bothy_Platform {
	
	use std::debug;
	use std::signer;
	use std::string::{ String };
	
	use ride::Loft;

	#[view]
	public fun togetherness () : String {
		let togetherness = Loft::togetherness ();
		togetherness
	}
	
	
	public entry fun address_of_signer (
		estate_1: & signer
	) {
		let estate_1_address = signer::address_of (estate_1);
		debug::print (& estate_1_address);
	}
}




