
/*
	harbor: [
		Shipment {
			origin_address : address,
			mercy : u256
		},
		Shipment {
			origin_address : address,
			mercy : u256
		},
		Shipment {
			origin_address : address,
			mercy : u256
		}
		...
		Shipment {
			origin_address : address,
			mercy : u256
		}		
	]
*/

/*

*/

/*
	perhaps:
		//
		//  the turn (block) that the shipment 
		// 	was added to the harbor
		//
		Shipment.at_turn
*/
module ride_1::Merci_Harbor {
	
	
	use std::vector;
	
	
	/*
		let shipment = Merci_Harbor::organize_shipment (
			origin_address,
			mercy_volume
		);	
	*/
	struct Shipment has store {
		origin_address : address,
		mercy : u256
	}
	
	struct Harbor has store {
		shipments: vector<Shipment>
	}
	
	public fun organize_harbor () : Harbor {
		Harbor {
			shipments: vector::empty<Shipment>()
		}
	}
	
	public fun organize_shipment (origin_address : address, mercy_volume : u256) : Shipment {
		Shipment {
			origin_address : origin_address,
			mercy : mercy_volume
		}
	}	
	
	/*
	public fun retrieve_shipments (
		harbor : Harbor
	) {
		// let harbor = borrow_global_mut<Harbor>(mall_spot);
		let shipments_length = vector::length (& harbor.shipments);
		
		for (index_1 in 0..shipments_length) {
			
			
		}
	}
	*/
	
	
	public entry fun return_shipments () {
		
	}
}