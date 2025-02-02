
/*
	obligatory:
		ask_obtain_mistponics_Sheds
		ask_prepare_maharagwe
*/

module ride::Mistponics_Maharagwe {
	use std::string::{ Self, String };
	use std::signer;
	
	use ride::Loft;
	use ride::Quarry_u64;

	use ride::Mistponics_Shed;

	const GROW_AMOUNT_IS_GREATER_THAN_UPPER_LIMIT : u64 = 0;
	const GROW_AMOUNT_IS_LESS_THAN_LOWER_LIMIT : u64 = 0;

	struct Maharagwe has key, drop {
        packs: u64
    }

	#[view]
	public fun togetherness () : String {
		let togetherness = Loft::togetherness ();
		togetherness
	}
	
	#[view]
	public fun check_maharagwe_amount (
		estate_address: address
	) : u64 acquires Maharagwe  {
		Mistponics_Shed::proceed_if_has_Shed (estate_address);
		
		let maharagwe = borrow_global<Maharagwe>(estate_address);
		maharagwe.packs
	}
	
	
	public entry fun ask_prepare_maharagwe (estate: & signer) {
		Mistponics_Shed::proceed_if_has_Shed (signer::address_of (estate));
		
		let packs : u64 = 0;
		let maharagwe = Maharagwe { packs };
        move_to (estate, maharagwe);
    }
	
	
	public entry fun grow_maharagwe (
		estate: & signer, 
		amount: u64
	) acquires Maharagwe {
		Mistponics_Shed::proceed_if_has_Shed (signer::address_of (estate));
		
		let maharagwe = borrow_global_mut<Maharagwe>(signer::address_of (estate));
		let packs = maharagwe.packs;
		
		//
		//
		//
		//
		//
		let proceeds : String = Quarry_u64::can_increase (packs, amount);
		if (proceeds != string::utf8 (b"yes")) {
			abort GROW_AMOUNT_IS_GREATER_THAN_UPPER_LIMIT
		};
		
		maharagwe.packs = packs + amount;		
	}
	
	
	public fun deplete_maharagwe (
		estate : & signer, 
		amount : u64
	) acquires Maharagwe {
		let maharagwe = borrow_global_mut<Maharagwe>(signer::address_of (estate));
		if (maharagwe.packs < amount) {
			abort GROW_AMOUNT_IS_LESS_THAN_LOWER_LIMIT
		};
		
		maharagwe.packs = maharagwe.packs - amount;		
	}
}
