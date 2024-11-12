
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
	
	struct Kisiwa has store {
		spot : address,
		myrci : u256
	}
	
	public fun Establish_a_Kisiwa (estate_1_spot : address) : Kisiwa {
		let myrci : u256 = 0;
		Kisiwa {
			spot : estate_1_spot,
			myrci : myrci 
		}		
	}
}


