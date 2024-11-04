





module ride::Bothy_Thermoplastic {
	use std::string::{ String };
	use std::signer;
	
	use ride::Loft;

	#[view]
	public fun togetherness () : String {
		let togetherness = Loft::togetherness ();
		togetherness
	}

	struct Thermoplastic has key, drop {
        sheets: u64,
		harvest: address
    }
	
	
	public fun polymerize_thermoplastic (harvest: &signer, amount: u64) {
		let harvest_address = signer::address_of (harvest);
        let le_thermoplastics = Thermoplastic { sheets: amount, harvest: harvest_address };
		
		move_to (harvest, le_thermoplastics);
	}
	
	

	
	
	
	
	
	
	
	
}







