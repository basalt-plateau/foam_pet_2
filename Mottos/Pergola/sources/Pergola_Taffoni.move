


/*
	Taffoni:
		This is like an escrow wallet.

	fonctions:
		entry: 
			establish_Taffoni
			
			add_AptosCoin_to_Taffoni
			
			ship_AptosCoin_from_Taffoni
			
			
		view:
			has_Taffoni
		
		public:
			retrieve_Taffoni_AptosCoin_amount
			
		private:
*/

/*
	todo:
		should be 
*/

module ride::Pergola_Taffoni {
	
	// use std::debug;
	use std::string::{ String, utf8 };
	use std::signer;
	// use std::string_utils;
	use aptos_std::table::{ Self, Table};
	
	// use aptos_framework::coin::{ Self, Coin, CoinStore };	
	use aptos_framework::coin::{ Self, Coin };
	use aptos_framework::aptos_coin::{ AptosCoin };
	
	use ride::Loft;
	use ride::Quarry_u64;
	
	#[view]
    public fun togetherness () : String {
		let togetherness = Loft::togetherness ();
		togetherness
    }

	struct Taffoni has key {
		aptos_coins : Coin<AptosCoin>
	}

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
		amount_to_ship : u64
	) acquires Taffoni {
		let estate_1_address = signer::address_of (estate_1_signer);
		let le_taffoni = borrow_global_mut<Taffoni>(taffoni_address);
		
		
		
		
		
		//
		//	Amounts
		//
		//
		let taffoni_coin_amount : u64 = coin::value (& le_taffoni.aptos_coins);
		let estate_1_coins : u64 = coin::balance<AptosCoin>(estate_1_address);

		
		/*
			Todo:
				* If gas fees are over.. that's probably a different problem.
		*/
		/* 
			
			Verifications
				* Verification: There is enough coins in the estate
				
		*/
		if (estate_1_coins < amount_to_ship) {
			abort 237584
		};
		

		
		//
		//	Withdraw from estate 1, then merge the withdrawn 
		//	coins into the taffoni.
		//
		let withdrawn_coins = coin::withdraw<AptosCoin>(estate_1_signer, amount_to_ship);
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
		amount_to_ship : u64
	) acquires Taffoni {
		let estate_1_spot = signer::address_of (estate_1_signer);
		let le_taffoni = borrow_global_mut<Taffoni>(taffoni_address);
		
		//
		//	Amounts
		//
		//
		let taffoni_coin_amount : u64 = coin::value (& le_taffoni.aptos_coins);
		let estate_1_coins_amount : u64 = coin::balance<AptosCoin>(estate_1_spot);
		

		
		/* 
			
			Verifications
				* Verification: There is enough coins in the Taffoni
				
				* Verification: estate_1_coins_amount + amount_to_ship isn't going to overflow
					^ This might be unecessary; this might abort with the built in u64 math.
					
		*/
		if (taffoni_coin_amount < amount_to_ship) {
			abort 237584
		};
		if (Quarry_u64::can_increase (estate_1_coins_amount, amount_to_ship) != utf8 (b"yes")) {
			abort 237585
		};
		let expected_taffoni_amount : u64 = taffoni_coin_amount - amount_to_ship;
		let expected_estate_1_amount : u64 = coin::balance<AptosCoin>(estate_1_spot) + amount_to_ship;
		
		

		//
		//	Extract from Taffoni
		//
		//
		let Taffoni { aptos_coins } = le_taffoni;
		let extracted_coins = coin::extract<AptosCoin>(&mut le_taffoni.aptos_coins, amount_to_ship);
		if (coin::value (& extracted_coins) != amount_to_ship) {
			abort 89386
		};
		
		
		
		//
		//	Deposit into estate_1
		//
		//
		coin::deposit (estate_1_spot, extracted_coins);
		if (retrieve_Taffoni_AptosCoin_amount (estate_1_spot) != expected_taffoni_amount) {
			abort 89387
		};
		if (coin::balance<AptosCoin>(estate_1_spot) != expected_estate_1_amount) {
			abort 89389
		};
	}
}


