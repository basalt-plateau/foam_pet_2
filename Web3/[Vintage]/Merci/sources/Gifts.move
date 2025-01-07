
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

module ride_1::Merci_Gifts {
	
	use std::debug;
	use std::string::{ String, utf8 };
	use std::string_utils;	
	use std::signer;
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
		Fonctions:
			ask_for_les_gifts_count
				Merci_Gifts::ask_for_les_gifts_count (& gifts);
			
			organize_gift
				Merci_Gifts::organize_gift (origin_address, to_address mercy_volume);
				
			clone_gift
				Merci_Gifts::clone_gift (& gift);
				
			ask_to_add_a_gift_to_gifts
				Merci_Gifts::ask_to_add_a_gift_to_gifts (gifts, origin_address, to_address, mercy_volume);
				
			show gifts:
			
			ask_if_is_equivalent:
			
			ask_to_remove_gift:
			
			ask_for_amount_of_mercy_of_gift
	*/	
	public fun ask_for_les_gifts_count (gifts : & vector<Gift>) : u64 {
		vector::length (gifts)
	}
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
	public fun clone_gift (gift : & Gift) : Gift {
		Gift {
			origin_address : gift.origin_address,
			to_address: gift.to_address,
			mercy : gift.mercy
		}
	}
	public fun ask_to_add_a_gift_to_gifts (
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
	
	public fun ask_to_show_gift (
		le_gift : & Gift
	) {
		let string_2 : String = string_utils::format3 (
			& b"\n  mercy: {} \n  origin address: {} \n  to address: {} \n", 
			le_gift.mercy, 
			le_gift.origin_address,
			le_gift.to_address
		);
		debug::print (& string_2)
	}
	
	public fun ask_if_is_equivalent (
		le_gift : & Gift,
		
		origin_address : address, 
		to_address : address, 
		mercy_volume : u256
	) : bool {
		if (
			le_gift.origin_address == origin_address &&
			le_gift.to_address == to_address &&
			le_gift.mercy == mercy_volume			
		) {
			return true
		};
		
		false
	}
	public fun ask_to_remove_gift_by_index () {
		// vector::remove (parties, index_of_le_party);
	}
	public fun ask_for_amount_of_mercy_of_gift (le_gift : & Gift) : u256 {
		le_gift.mercy
	}
}