




module ride::Veranda {
	use aptos_framework::coin;
	use aptos_framework::account;
	use aptos_framework::aptos_account;
	
	use std::string::{ String };
	
	use ride::Loft;
	
	#[view]
    public fun togetherness () : String {
		let togetherness = Loft::togetherness ();
		togetherness
    }
	
	//
	//
	// 	Scouting
	//
	//
	/*
		This can show the APT scoreboard for an address. 
	*/
	#[view]
    public fun APT_scoreboard <Coin> (address_1: address): u64 {
        let score: u64 = coin::balance<Coin>(address_1);
		score
    }
	
	
	//
	//
	//
	//
	//
	public entry fun build_estate (address_1: address) {
		assert! (account::exists_at (address_1) == false, 0);
		aptos_account::create_account (address_1);
	}
}
