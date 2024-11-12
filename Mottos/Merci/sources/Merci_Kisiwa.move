
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
	
	const Origin_kisiwa_does_not_have_enough_mercy : u64 = 1;
	
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
	
	public fun send_mercy (
		origin_kisiwa : & Kisiwa,
		to_kisiwa : & Kisiwa,
		amount : u256
	) {
		let origin_kisiwa_mercy : u256 = origin_kisiwa.mercy;
		let to_kisiwa_mercy : u256 = origin_kisiwa.mercy;
		
		if (amount > origin_kisiwa_mercy) {
			abort Origin_kisiwa_does_not_have_enough_mercy
		}
		
		
		// le_kisiwa.mercy		
	}

	
}


