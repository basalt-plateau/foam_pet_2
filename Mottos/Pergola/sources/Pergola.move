




module ride::Pergola {
	use aptos_framework::coin;
	use aptos_framework::account;
	use aptos_framework::aptos_account;
	
	use std::string::{ String };
	use std::string::utf8;
	
	use ride::Loft;
	
	#[view]
    public fun togetherness () : String {
		let togetherness = Loft::togetherness ();
		togetherness
    }
	
	
	//
	//
	//	Estates
	//
	//
	public entry fun build_estate (address_1: address) {
		assert! (account::exists_at (address_1) == false, 0);
		aptos_account::create_account (address_1);
	}
	
	
	//
	//
	//	APT
	//
	//
	public entry fun ship <CoinType> (
		sender: &signer, 
		recipient: address, 
		amount: u64
	) {
		let coins = coin::withdraw<CoinType>(sender, amount);
		coin::deposit (recipient, coins);
	}
	
	
	
	////
	//
	// 	Scouting
	//
	//
	/*
		This should show if an estate (account) is built.
	*/
	#[view]
    public fun estate_scout (address_1: address): String {
		if (account::exists_at (address_1)) {			
			let estate_built: String = utf8 (b"There is an estate at that address.");
			estate_built
		}
		else {
			let estate_built: String = utf8 (b"There is not an estate at that address.");
			estate_built
		}		
	}
	
	
	/*
		This can show the APT scoreboard for an address. 
	*/
	#[view]
    public fun APT_scoreboard <Coin> (address_1: address) : u64 {
        let score : u64 = coin::balance<Coin>(address_1);
		score
    }
	
	
	
	
	
	
}
