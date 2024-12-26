


/*
	parties: vector::empty<Party>()
	parties: vector<Merci_Parties::Party>
*/

module ride_1::Merci_Parties {
	
	
	use std::vector;
	
	
	/*
		let shipment = Merci_Harbor::organize_shipment (
			origin_address,
			mercy_volume
		);	
	*/
	struct Party has store {
		address : address,
		mercy : u256
	}
	
	struct Venue has store {
		parties: vector<Party>
	}
	
	/*
		Merci_Venue::organize_parties ();
	*/
	public fun organize_parties () : vector<Party> {
		vector::empty<Party>()
	}

	public fun organize_party (
		address : address, 
		mercy : u256
	) : Party {
		Party {
			address : address,
			mercy : mercy
		}
	}	
	
	public fun add_a_party (
		
	) {
		
	}

}