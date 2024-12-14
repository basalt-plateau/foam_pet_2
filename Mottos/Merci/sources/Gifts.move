
/*
	Structure:
		gifts: [
			gift {
				origin_address : address,
				to_address : address,
				mercy : u256
			},
			...
			gift {
				origin_address : address,
				to_address : address,
				mercy : u256
			}		
		]
*/

/*
	Asks:
		* 

*/

/*
	perhaps structure:
		//
		//  the turn (block) that the Tote 
		// 	was added to the harbor
		//
		Gift.at_turn
		
		//
		//	void after turn.
		//
		//	After this turn it's void, and is elligible for deletion
		//	by a gift void fonction.
		//
		Gift.void_after_turn
*/
module ride_1::Merci_Gifts {
	
	use std::vector;
	
	
	struct Gift has store, drop {
		origin_address : address,
		to_address : address,
		mercy : u256
	}
	
	
	public fun organize_gifts () : vector<Gift> {
		vector::empty<Gift>()
	}
	
	/*
		Merci_Gifts::gifts_count (& gifts);
	*/	
	public fun gifts_count (gifts : & vector<Gift>) : u64 {
		vector::length (gifts)
	}
	
	/*
		Merci_Gifts::organize_gift (origin_address, to_address mercy_volume);
	*/	
	public fun organize_gift (
		origin_address : address, 
		to_address : address, 
		mercy_volume : u256
	) : Gift {
		Gift {
			origin_address : origin_address,
			to_address: to_address,
			mercy : mercy_volume
		}
	}	
	
	/*
		Merci_Gifts::clone_gift (& gift);
	*/
	public fun clone_gift (gift : & Gift) : Gift {
		Gift {
			origin_address : gift.origin_address,
			to_address: gift.to_address,
			mercy : gift.mercy
		}
	}
	
	
	/*
		Merci_Gifts::add_a_gift (gifts, origin_address, to_address, mercy_volume);
	*/	
	public fun add_a_gift (
		gifts : &mut vector<Gift>,

		origin_address : address, 
		to_address: address,
		
		mercy_volume : u256
	) {
		let le_gift = Gift {
			origin_address : origin_address,
			to_address: to_address,
			//
			mercy : mercy_volume
		};
		
		vector::push_back (gifts, le_gift);
	}
	

}