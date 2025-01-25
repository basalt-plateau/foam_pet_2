


module Publisher_01::Allowed_Wallets_01 {
	#[view] public fun Volitions () : String { use Publisher_01::Rules_10; Rules_10::Volitions_01 () }
	
	// use std::vector;
	use std::string::{ String, utf8 };
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
		let producer_address = signer::address_of (consenter);
		
		let wallets = borrow_global_mut<Wallets>(producer_address);
		wallets.allowed = allowed_wallets;
	}
	public entry fun shred (consenter : & signer) acquires Wallets {
		Allowed_Wallets_01_Producer::ensure_consenter_is_producer (consenter);
		let producer_address = signer::address_of (consenter);
		
		move_from<Wallets>(producer_address);
	}
	
	#[view] public fun is_established () : String {
		if (exists<Wallets>(Allowed_Wallets_01_Producer::ask_for_address ())) {
			return utf8 (b"yup")
		};
		
		utf8 (b"no")
	}
	
	#[view] public fun retrieve () : vector <String> acquires Wallets {
		let producer_address = Allowed_Wallets_01_Producer::ask_for_address ();
		
		let wallets = borrow_global<Wallets>(producer_address);
		wallets.allowed
	}
}