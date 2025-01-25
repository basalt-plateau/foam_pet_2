


module Publisher_01::Allowed_Wallets_01 {
	#[view] public fun Volitions () : String { use Publisher_01::Rules_10; Rules_10::Volitions_01 () }
	
	// use std::vector;
	use std::string::{ String };
	use std::signer;
	
	use Publisher_01::Allowed_Wallets_01_Producer;
	
	struct Wallets has key, drop {
		allowed : vector <String> 
	}
	
	public entry fun establish (consenter : & signer, allowed_wallets : vector <String>) {
		Allowed_Wallets_01_Producer::ensure_consenter_is_producer (consenter);
		
		let wallets = Wallets {
			allowed : allowed_wallets
		};
		
		move_to<Wallets>(consenter, wallets)
	}
	
	public entry fun change (consenter : & signer, allowed_wallets : vector <String>) acquires Wallets {
		Allowed_Wallets_01_Producer::ensure_consenter_is_producer (consenter);
		
		let consenter_address = signer::address_of (consenter);
		let wallets = borrow_global_mut<Wallets>(consenter_address);
		wallets.allowed = allowed_wallets;
	}
	
	#[view] public fun retrieve () : vector <String> acquires Wallets {
		let producer_address = Allowed_Wallets_01_Producer::ask_for_address ();
		
		let wallets = borrow_global<Wallets>(producer_address);
		wallets.allowed
	}
}