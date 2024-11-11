




module ride::Pergola_Taffoni {
	
	use std::debug;
	use std::string::{ String, utf8 };
	use std::signer;
	use std::string_utils;
	use aptos_std::table::{Self, Table};
	
	use aptos_framework::coin::{ Self, Coin, CoinStore };
	use aptos_framework::aptos_coin::{ AptosCoin, Self };
	
	use ride::Loft;
	
	#[view]
    public fun togetherness () : String {
		let togetherness = Loft::togetherness ();
		togetherness
    }
	
	struct Lock<phantom CoinType> has store {
        coins: Coin<CoinType>,
        unlock_time_secs: u64,
    }

	struct Locks<phantom CoinType> has key {
        locks: Table<address, Lock<CoinType>>,
        withdrawal_address: address,
        total_locks: u64
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
		
		
		move_to (estate_1_flourisher, Locks {
            locks: table::new<address, Lock<AptosCoin>>(),
            withdrawal_address: estate_1_spot,
            total_locks: 0
        })
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
	) acquires Taffoni, Locks {
		let estate_1_address = signer::address_of (estate_1_signer);
		let le_taffoni = borrow_global_mut<Taffoni>(estate_1_address);
		
		//
		//	Amounts
		//
		//
		let taffoni_coin_amount : u64 = coin::value (& le_taffoni.aptos_coins);
		let estate_1_coins : u64 = coin::balance<AptosCoin>(estate_1_address);
		debug::print (& string_utils::format1 (& b"taffoni_coin_amount: {}", taffoni_coin_amount));
		debug::print (& string_utils::format1 (& b"estate_1_coins: {}", estate_1_coins));
	
		
			
		let withdrawn_coins = coin::withdraw<AptosCoin>(estate_1_signer, amount);
		
		// coin::deposit (le_taffoni, withdrawn_coins);
		
		// let estate_1_coins : u64 = coin::balance<Coin>(address_1)
		
		
		
		let locks = borrow_global_mut<Locks<AptosCoin>>(estate_1_address);
		table::add (
			&mut locks.locks, 
			estate_1_address, 
			Lock<AptosCoin> { 
				coins: withdrawn_coins, 
				unlock_time_secs: 10 
			}
		);
		
		
		let taffoni_coin_amount_2 : u64 = coin::value (& le_taffoni.aptos_coins);
		let estate_1_coins_2 : u64 = coin::balance<AptosCoin>(estate_1_address);
		debug::print (& string_utils::format1 (& b"taffoni_coin_amount: {}", taffoni_coin_amount_2));
		debug::print (& string_utils::format1 (& b"estate_1_coins: {}", estate_1_coins_2));
	}
	
	
	
}


