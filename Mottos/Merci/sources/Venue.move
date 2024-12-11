


/*
	parties: []
*/

module ride_1::Merci_Venue {
	
	
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
	
	public fun organize_parties () : Harbor {
		Venue {
			parties: vector::empty<Party>()
		}
	}
	
	public fun organize_party (
		address : address, 
		mercy : u256
	) : Tote {
		Party {
			address : address,
			mercy : mercy
		}
	}	

}