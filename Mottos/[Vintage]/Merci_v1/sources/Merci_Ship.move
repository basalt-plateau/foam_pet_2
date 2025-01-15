

/*
	This is the Ship that is added to the harvest.
	
	
*/
/*
	Establish
	Change Mercy amount
	
	add mercy
	sub mercy
*/
module ride_1::Merci_Ship {
	
	use std::string::{ String };
	use std::vector;
	
	use ride_1::Merci_Bayanihan;
	
	const Origin_kisiwa_does_not_have_enough_mercy : u64 = 1;
	const Ship_does_not_have_enough_mercy : u64 = 2;
	
	friend ride_1::Merci_Harvest;
	friend ride_1::Merci_Tienda;
	
	#[view]
	public fun Bayanihan () : String {
		Merci_Bayanihan::Bayanihan ()
	}	
	
	/*
		Ship:
		
			mercy:
			
			
			steadies:
				These are the Ships that are allowed
				to direct send mercy to this Ship.
	*/
	struct Ship has store, drop {
		mercy : u256,
		steadies : vector<address>
	}
	
	public fun Establish_a_Ship (
		mercy : u256
	) : Ship {
		Ship {
			mercy : mercy,
			steadies : vector::empty<address>()
		}		
	}
	
	
	public (friend) fun mercy_amount_from_kisiwa (le_kisiwa : & Ship) : u256 {
		le_kisiwa.mercy		
	}
	
	/*
		
	*/
	public (friend) fun sub_mercy (
		kisiwa : &mut Ship,
		amount : u256
	) {
		let kisiwa_mercy : u256 = kisiwa.mercy;
		if (amount > kisiwa_mercy) {
			abort Ship_does_not_have_enough_mercy
		};
		
		kisiwa.mercy = kisiwa.mercy - amount;
	}
	
	public (friend) fun add_mercy (
		kisiwa : &mut Ship,
		amount : u256
	) {
		kisiwa.mercy = kisiwa.mercy + amount;
	}
	
	
	/*
		This might not work.
			Ship::send_mercy ()
	*/
	public (friend) fun send_mercy (
		origin_kisiwa : &mut Ship,
		to_kisiwa : &mut Ship,
		amount : u256
	) {
		sub_mercy (origin_kisiwa, amount);
		add_mercy (to_kisiwa, amount);
	}

	
}


