
/*
	gifts

	gifts: [
		gift {
			origin_address : address,
			mercy : u256
		},
		...
		gift {
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
module ride_1::Merci_Gifts {
	
	
	use std::vector;
	
	
	/*
		let Tote = Merci_Harbor::organize_Tote (
			origin_address,
			mercy_volume
		);	
	*/
	struct Gift has store, drop {
		origin_address : address,
		mercy : u256
	}
	
	
	public fun organize_gifts () : vector<Gift> {
		vector::empty<Gift>()
	}
	
	public fun organize_gift (origin_address : address, mercy_volume : u256) : Gift {
		Gift {
			origin_address : origin_address,
			mercy : mercy_volume
		}
	}	

	public fun add_gift (
		gifts : &mut vector<Gift>,
		gift : Gift
	) {
		vector::push_back (gifts, gift);
	}
}