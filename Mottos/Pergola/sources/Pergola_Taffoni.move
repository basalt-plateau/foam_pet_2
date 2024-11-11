




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
	}
	
	#[view]
	public fun has_Taffoni (spot: address) : String {
		if (exists<Taffoni>(spot)) {
            return utf8 (b"yep")
        };
		
		utf8 (b"no")
	}
	
	public fun retrieve_Taffoni_AptosCoin_amount (
		estate_1_address : address
	) : u64 acquires Taffoni {
		let le_taffoni = borrow_global<Taffoni>(estate_1_address);
		let coin_amount : u64 = coin::value (& le_taffoni.aptos_coins);
		coin_amount
	}
	
	
	public entry fun add_AptosCoin_to_Taffoni (
		estate_1_signer: & signer,
		taffoni_address : address,
		amount : u64
	) acquires Taffoni {
		let estate_1_address = signer::address_of (estate_1_signer);
		let le_taffoni = borrow_global_mut<Taffoni>(taffoni_address);
		
		
		/*
			Todo:
				* Make sure there is enough in estate_1 to take.	
				* If gas fees are over.. that's probably a different problem.
		*/
		
		
		
		//
		//	Amounts
		//
		//
		let taffoni_coin_amount : u64 = coin::value (& le_taffoni.aptos_coins);
		let estate_1_coins : u64 = coin::balance<AptosCoin>(estate_1_address);
		if (estate_1_coins < amount) {
			abort 237584;
		};

		
		//
		//	Withdraw from estate 1, then merge the withdrawn 
		//	coins into the taffoni.
		//
		let withdrawn_coins = coin::withdraw<AptosCoin>(estate_1_signer, amount);
		coin::merge (&mut le_taffoni.aptos_coins, withdrawn_coins);
		
		//
		//
		//
		//
		let taffoni_coin_amount_2 : u64 = coin::value (& le_taffoni.aptos_coins);
		let estate_1_coins_2 : u64 = coin::balance<AptosCoin>(estate_1_address);
	}
	
	public entry fun ship_AptosCoin_from_Taffoni (
		estate_1_signer: & signer,
		taffoni_address : address,
		amount : u64
	) acquires Taffoni {
		let estate_1_address = signer::address_of (estate_1_signer);
		let le_taffoni = borrow_global_mut<Taffoni>(taffoni_address);
		
		//
		//	Amounts
		//
		//
		let taffoni_coin_amount : u64 = coin::value (& le_taffoni.aptos_coins);
		let estate_1_coins : u64 = coin::balance<AptosCoin>(estate_1_address);
		if (taffoni_coin_amount < amount) {
			abort 237584;
		};
		debug::print (& string_utils::format1 (& b"taffoni_coin_amount: {}", taffoni_coin_amount));
		debug::print (& string_utils::format1 (& b"estate_1_coins: {}", estate_1_coins));
		
		
		// let amount = coin::value (& le_taffoni.aptos_coins);
		// coin::deposit (estate_1_address, coins);
		
		
		let Taffoni { aptos_coins } = le_taffoni;
		let extracted_coins = coin::extract<AptosCoin>(&mut le_taffoni.aptos_coins, amount);
		let amount_extracted = coin::value (& extracted_coins);
		debug::print (& string_utils::format1 (& b"amount_extracted: {}", amount_extracted));
		
		
		// coin::merge (&mut le_taffoni.aptos_coins, amount_extracted);
		coin::deposit (estate_1_address, extracted_coins);
		debug::print (& string_utils::format1 (& b"taffoni_coin_amount: {}", coin::value (& le_taffoni.aptos_coins)));
		debug::print (& string_utils::format1 (& b"estate_1_coins: {}", coin::balance<AptosCoin>(estate_1_address)));
		
		
		
		
		// let amount = coin::value (&aptos_coins);
		// let withdrawn_coins = coin::withdraw<AptosCoin>(& le_taffoni.aptos_coins, amount);
		//
		//	Withdraw from taffoni, then merge the withdrawn 
		//	coins into the taffoni.
		//
		// coin::extract<AptosCoin>(&mut le_taffoni.aptos_coins, amount);
	}
	
}


