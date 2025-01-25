

/*
	* build list of wallets
	* change list of wallets
	* retrieve list of wallets
*/
module Ride_01::Allowed_Wallets {
	#[view] public fun Volitions () : String { use Ride_01::Rules_10; Rules_10::Volitions_01 () }
	
	// use std::vector;
	use std::string::{ String };
	use std::signer;
	
	struct Wallets has key, drop {
		allowed : vector <String> 
	}
	
	public entry fun establish (consenter : & signer, allowed_wallets : vector <String>) {
		let wallets = Wallets {
			allowed : allowed_wallets
		};
		
		move_to<Wallets>(consenter, wallets)
	}
	
	public entry fun change (consenter : & signer, allowed_wallets : vector <String>) acquires Wallets {
		let consenter_address = signer::address_of (consenter);
		let wallets = borrow_global_mut<Wallets>(consenter_address);
		wallets.allowed = allowed_wallets;
	}
	
	#[view] public fun retrieve (
		consenter_address : address
	) : vector <String> acquires Wallets {
		let wallets = borrow_global<Wallets>(consenter_address);
		wallets.allowed
	}
}