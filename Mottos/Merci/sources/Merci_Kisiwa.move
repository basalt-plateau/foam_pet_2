
/*
	Establish
	Change Mercy amount
	
	add mercy
	sub mercy
*/
module ride_1::Merci_Kisiwa {
	
	use std::string::{ String, utf8 };
	use std::vector;
	
	use ride_1::Merci_Bayanihan;
	
	#[view]
	public fun Bayanihan () : String {
		Merci_Bayanihan::Bayanihan ()
	}	
	
	struct Kisiwa has store {
		spot : address,
		mercy : u256
	}
	
	public fun Establish_a_Kisiwa (estate_1_spot : address) : Kisiwa {
		let mercy : u256 = 0;
		Kisiwa {
			spot : estate_1_spot,
			mercy : mercy 
		}		
	}
	
	public fun mercy_amount (estate_1_spot : address) : Kisiwa {
		let le_kisiwa : Kisiwa = borrow_global<Kisiwa>(estate_1_spot);
		le_kisiwa.mercy		
	}
}


