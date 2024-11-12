
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
	
	struct Kisiwa has store, drop {
		mercy : u256
	}
	
	public fun Establish_a_Kisiwa (
		estate_1_spot : address,
		mercy : u256
	) : Kisiwa {
		Kisiwa {
			mercy : mercy 
		}		
	}
	
	
	public fun mercy_amount_from_kisiwa (le_kisiwa : & Kisiwa) : u256 {
		le_kisiwa.mercy		
	}
	
	
	/*
	public fun mercy_amount (estate_1_spot : address) : Kisiwa {
		let le_kisiwa : Kisiwa = borrow_global<Kisiwa>(estate_1_spot);
		le_kisiwa.mercy		
	}
	*/
}


