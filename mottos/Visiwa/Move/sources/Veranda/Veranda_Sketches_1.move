


/*
	Anyone is allowed to ditto this.
		~ Visiwa
*/

module ride::Veranda_Sketches_1 {
	
	use std::string::{ String, utf8};
	
	use aptos_framework::coin;
	use aptos_framework::account;
	use aptos_framework::aptos_account;
	
	
	public entry fun build_estate (address_1: address) {
		assert! (account::exists_at (address_1) == false, 0);
		aptos_account::create_account (address_1);
	}
	
	public entry fun ship <CoinType> (
		sender: &signer, 
		recipient: address, 
		amount: u64
	) {
		let coins = coin::withdraw<CoinType>(sender, amount);
		coin::deposit (recipient, coins);
	}
	
	
	//
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
    
	
	
	#[view]
    public fun return_glyphs (): vector<u8> {
		let estate_built: vector<u8> = b"These are glyphs.";
		estate_built
	}
	
	#[view]
    public fun return_string (): String {
		let string_1: String = utf8(b"This is a string");
		string_1
	}

	
	
	//
	//
	//	Garbage 
	//
	//
	#[view]
    public fun scout_an_estate (address_1: address): String {
		if (!account::exists_at (address_1)) {			
			let estate_built: String = utf8 (b"There is an estate at that address.");
			estate_built
		}
		else {
			let estate_built: String = utf8 (b"There is not an estate at that address.");
			estate_built
		}		
	}
	
	#[view]
    public fun scout_estate (address_1: address): vector<u8> {
		if (!account::exists_at (address_1)) {
			let estate_built: vector<u8> = b"There is an estate at that address.";
			estate_built
		}
		else {
			let estate_built: vector<u8> = b"There is not an estate at that address.";
			estate_built
		}		
	}
	
	#[test]
    public fun estate_scout_is_established () {
        // let estate_built = estate_scout ();
        // debug::print (& estate_built);
    }
}
