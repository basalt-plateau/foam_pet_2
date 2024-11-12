
/*
	Establish
	Change Mercy amount
	
	add mercy
	sub mercy
*/
module ride_1::Merci_Kisiwa {
	
	use std::string::{ String, utf8 };
	use std::vector;
	
	use ride_1::Merci_Symbiotic;
	
	#[view]
	public fun Symbiotic () : String {
		Merci_Symbiotic::Symbiotic ()
	}	
	
	struct Kisiwa {
		spot : address,
		mercy : u256
	}
	
	public entry fun Establish_a_Kisiwa (estate_flourisher : & signer) {
		let kisiwa = Kisiwa {
			spot : estate_1_address,
			mercy : mercy 
		};
	}
}


