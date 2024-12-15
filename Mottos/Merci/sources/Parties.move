


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
	
	


	/* join + leave */
	/*
		Fonctions:
			petition_to_leave_les_parties
			ask_to_join_les_parties		
	*/
	public fun ask_to_join_les_parties (
		parties : &mut vector<Party>,
		party : Party
	) {
		/*
			Merci_Parties::add_a_party (parties, party);
		
		*/
		
		vector::push_back (parties, party);
	}
	public fun petition_to_leave_les_parties (
		parties : &mut vector<Party>,
		spot : address
	) {
		/*
			Merci_Parties::petition_to_leave_les_parties (parties, party_address);
		
		*/
		
		let le_party = search_for_flexible_party (parties, spot);
	}
	
	
	
	public fun parties_turnout (parties : &mut vector<Party>) : u64 {
		let parties_turnout = vector::length (parties);
		parties_turnout
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
		 __  __                          
		|  \/  |  ___  _ __   ___  _   _ 
		| |\/| | / _ \| '__| / __|| | | |
		| |  | ||  __/| |   | (__ | |_| |
		|_|  |_| \___||_|    \___| \__, |
								   |___/ 	
	
		Fonctions:
			ask_to_deduct_mercy
			ask_for_le_amount_of_mercy_that_a_party_has
	*/
	public fun ask_to_deduct_mercy (
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
	public fun ask_for_le_amount_of_mercy_that_a_party_has (party: & Party) : u256 {
		/*
			let mercy_amount : u256 = Merci_Parties::retrieve_mercy (& party);
		
		*/
		
        party.mercy
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