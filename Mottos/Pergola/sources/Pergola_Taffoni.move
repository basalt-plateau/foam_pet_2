




module ride::Pergola_Taffoni {
	
	use std::debug;
	use std::string::{ String, utf8 };
	use std::signer;
	use std::string_utils;
	
	use aptos_framework::coin::{ Self, Coin, CoinStore };
	use aptos_framework::aptos_coin::{ AptosCoin, Self };
	
	use ride::Loft;
	
	#[view]
    public fun togetherness () : String {
		let togetherness = Loft::togetherness ();
		togetherness
    }
	
	struct Lock<phantom CoinType> has store {
        coins : Coin<CoinType>,
        unlock_time_secs: u64
    }
	
	
	// aptos_coin_store : CoinStore<AptosCoin>,
	struct Taffoni has key {
		aptos_coins : Coin<AptosCoin>
	}
	
	/*
		similar:
			create-resource-account
	struct Taffoni  {
		Octas : AptosCoin
	}
	*/

	
	public entry fun establish_Taffoni (estate_1_flourisher: & signer) {
		let estate_1_spot = signer::address_of (estate_1_flourisher);
		if (exists<Taffoni>(estate_1_spot)) {
            abort (1001)
        };
		
		let le_Taffoni = Taffoni {
            aptos_coins : coin::zero<AptosCoin>()
        };
		
		move_to (estate_1_flourisher, le_Taffoni);
	}
	
	#[view]
	public fun has_Taffoni (spot: address) : String {
		if (exists<Taffoni>(spot)) {
            return utf8 (b"yep")
        };
		
		utf8 (b"no")
	}
	
	public fun retrieve_Taffoni_AptosCoin_amount (
		estate_1_signer: & signer
	) : u64 acquires Taffoni {
		let estate_1_address = signer::address_of (estate_1_signer);
		let le_taffoni = borrow_global_mut<Taffoni>(estate_1_address);
		let coin_amount : u64 = coin::value (& le_taffoni.aptos_coins);
		coin_amount
	}
	
	
	public entry fun add_AptosCoin_to_Taffoni (
		estate_1_signer: & signer,
		amount : u64
	) acquires Taffoni {
		let estate_1_address = signer::address_of (estate_1_signer);
		let le_taffoni = borrow_global_mut<Taffoni>(estate_1_address);
		// let le_taffoni_aptos_coins : Coin<AptosCoin> = le_taffoni.aptos_coins;
		
		let coin_value : u64 = coin::value (& le_taffoni.aptos_coins);
		debug::print (& string_utils::format1 (& b"coins: {}", coin_value))
		
		// let le_taffoni_balance : u64 = coin::balance (le_taffoni.aptos_coins);
		// let coins = coin::withdraw<AptosCoin>(estate_1_signer, amount);
		// debug::print ()
	}
	
	
	
}


