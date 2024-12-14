


/*
	parties: vector::empty<Party>()
	parties: vector<Merci_Parties::Party>
*/


/*
	perhaps:
		allow_direct_mercy_from: vector::empty<Party>(),
		reject_gifts_from: vector::empty<Party>()
*/

module ride_1::Merci_Parties {
	
	
	use std::vector;
	
	use ride_1::Merci_Gifts;
	
	/*
		let Tote = Merci_Harbor::organize_Tote (
			origin_address,
			mercy_volume
		);	
	*/
	struct Party has store, drop {
		spot : address,
		mercy : u256
	}

	/*
		Merci_Parties::organize_parties ();
	*/
	public fun organize_parties () : vector<Party> {
		vector::empty<Party>()
	}


	/*
		le_party = Merci_Parties::organize_party (address, mercy);
	*/
	public fun organize_party (spot : address, mercy : u256) : Party {
		Party {
			spot: spot,
			mercy: mercy
		}
	}	

    public fun retrieve_spot (party: &Party) : address {
        party.spot
    }
	
	/*
		let mercy_amount : u256 = Merci_Parties::retrieve_mercy (& party);
	*/
	public fun retrieve_mercy (party: & Party) : u256 {
        party.mercy
    }


	/*
		Merci_Parties::add_a_party (parties, party);
	*/
	public fun add_a_party (
		parties : &mut vector<Party>,
		party : Party
	) {
		vector::push_back (parties, party);
	}
	
	public fun parties_turnout (parties : &mut vector<Party>) : u64 {
		let parties_turnout = vector::length (parties);
		parties_turnout
	}
	
	public fun attempt_deduct_mercy (
		parties : &mut vector<Party>,
		party_spot : address,
		mercy_to_deduct : u256
	) {
		let le_party : &mut Party = search_for_flexible_party (parties, party_spot);
		if (le_party.mercy < mercy_to_deduct) {
			abort 2;
		};
		
		le_party.mercy = le_party.mercy - mercy_to_deduct;
	}
	
	/*
		let le_party : &mut Merci_Parties::Party = Merci_Parties::search_for_flexible_party (parties, party_spot);
	*/
	public fun search_for_flexible_party (
		parties : &mut vector<Party>,
		party_spot : address
	) : &mut Party {
		let number_of_parties = vector::length (parties);
		
		for (index_1 in 0..number_of_parties) {
			let le_party = vector::borrow_mut (parties, index_1);
			
			if (retrieve_spot (le_party) == party_spot) {
				return le_party
			}
		};	
		
		abort 1
	}



	/*
		Merci_Parties::ask_for_party (parties, party);
	*/
	public fun ask_for_party_mercy_volume (
		parties : & vector<Party>,
		party : Party
	) : u256 {
		// let parties_turnout = vector::length (& parties);
		let parties_turnout = vector::length (parties);
		
		// for (index_1 in 0..parties_turnout) {};
		
		
		let party_ref = vector::borrow (parties, 0);
		party_ref.mercy

	}
	
	
	/*
		Merci_Parties::send_a_gift (parties, from_spot, to_party);
	*/
	public fun send_a_gift (
		parties : & vector<Party>,
		from_spot : address,
		to_party : &mut Party
	) : u256 {
		let return_this : u256 = 0;
		
		return_this
	}
}