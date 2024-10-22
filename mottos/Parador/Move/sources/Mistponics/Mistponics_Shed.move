



module ride::Mistponics_Shed {
	use std::string::{ Self, String };
	use std::signer;
	
	use ride::Loft;	
	
	struct Shed has key, drop {}	
	
	const A_Shed_is_obligatory : u64 = 0;
	
	#[view]
	public fun togetherness () : String {
		let togetherness = Loft::togetherness ();
		togetherness
	}
	
	
	/*
		scouting
	*/
	#[view]
	public fun has_mistponics_Sheds (estate_address: address): String {
		if (exists<Shed>(estate_address)) {
			return string::utf8 (b"yes")
		};
		
		string::utf8 (b"no")
	}
	
	/*
		Mistponics_Shed::proceed_if_has_Shed (signer::address_of (estate));
	
	*/
	public fun proceed_if_has_Shed (estate_address: address) {
		if (exists<Shed>(estate_address) != true) {
			abort A_Shed_is_obligatory
		};
	}
	
	
	public entry fun ask_obtain_mistponics_Sheds (estate: & signer) {
		let shed_1 = Shed {};
        move_to (estate, shed_1);
	}
	
	public entry fun ask_relinquish_mistponics_Sheds (
		estate: & signer
	) acquires Shed {
		
		/*
		let maharagwe = borrow_global<Maharagwe>(signer::address_of (estate));
		if (maharagwe.packs != 0) {
			let apology_1 = string::utf8 (b"Maharagwe packs need to be zero to relinquish a Mistponics Sheds.");
			return apology_1
		};
		*/
		
		move_from<Shed>(signer::address_of (estate));
    }
}