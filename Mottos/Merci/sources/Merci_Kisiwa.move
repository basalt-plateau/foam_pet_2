
/*
	Establish
	Change Mercy amount
	
	add mercy
	sub mercy
*/
module ride_1::Merci_Kisiwa {
	
	use std::string::{ String };
	
	use ride_1::Merci_Bayanihan;
	
	const Origin_kisiwa_does_not_have_enough_mercy : u64 = 1;
	const Kisiwa_does_not_have_enough_mercy : u64 = 2;
	
	friend ride_1::Merci_Harvest;
	
	#[view]
	public fun Bayanihan () : String {
		Merci_Bayanihan::Bayanihan ()
	}	
	
	struct Kisiwa has store, drop {
		mercy : u256
	}
	
	public fun Establish_a_Kisiwa (
		mercy : u256
	) : Kisiwa {
		Kisiwa {
			mercy : mercy 
		}		
	}
	
	
	public (friend) fun mercy_amount_from_kisiwa (le_kisiwa : & Kisiwa) : u256 {
		le_kisiwa.mercy		
	}
	
	/*
		
	*/
	public (friend) fun sub_mercy (
		kisiwa : &mut Kisiwa,
		amount : u256
	) {
		let kisiwa_mercy : u256 = kisiwa.mercy;
		if (amount > kisiwa_mercy) {
			abort Kisiwa_does_not_have_enough_mercy
		};
		
		kisiwa.mercy = kisiwa.mercy - amount;
	}
	
	public (friend) fun add_mercy (
		kisiwa : &mut Kisiwa,
		amount : u256
	) {
		kisiwa.mercy = kisiwa.mercy + amount;
	}
	
	public (friend) fun send_mercy (
		origin_kisiwa : &mut Kisiwa,
		to_kisiwa : &mut Kisiwa,
		amount : u256
	) {
		let origin_kisiwa_mercy : u256 = origin_kisiwa.mercy;
		if (amount > origin_kisiwa_mercy) {
			abort Origin_kisiwa_does_not_have_enough_mercy
		};
		
		to_kisiwa.mercy = to_kisiwa.mercy + origin_kisiwa_mercy;
	}

	
}


