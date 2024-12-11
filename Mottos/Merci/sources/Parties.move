


/*
	parties: vector::empty<Party>()
	parties: vector<Merci_Parties::Party>
*/

module ride_1::Merci_Parties {
	
	
	use std::vector;
	
	
	/*
		let Tote = Merci_Harbor::organize_Tote (
			origin_address,
			mercy_volume
		);	
	*/
	struct Party has store, drop {
		address : address,
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
	public fun organize_party (address : address, mercy : u256) : Party {
		Party {
			address : address,
			mercy : mercy
		}
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
	

}