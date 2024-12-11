
/*
	presents

	presents: [
		present {
			origin_address : address,
			mercy : u256
		},
		...
		present {
			origin_address : address,
			mercy : u256
		}		
	]
*/

/*
	parties: vector::empty<Tote>()
	parties: vector<Merci_Harbor::Tote>
*/

/*

*/

/*
	perhaps:
		//
		//  the turn (block) that the Tote 
		// 	was added to the harbor
		//
		Tote.at_turn
*/
module ride_1::Merci_Presents {
	
	
	use std::vector;
	
	
	/*
		let Tote = Merci_Harbor::organize_Tote (
			origin_address,
			mercy_volume
		);	
	*/
	struct Present has store, drop {
		origin_address : address,
		mercy : u256
	}
	
	
	public fun organize_presents () : vector<Present> {
		vector::empty<Present>()
	}
	
	public fun organize_present (origin_address : address, mercy_volume : u256) : Present {
		Present {
			origin_address : origin_address,
			mercy : mercy_volume
		}
	}	

	public fun add_present (
		presents : &mut vector<Present>,
		present : Present
	) {
		vector::push_back (presents, present);
	}
}