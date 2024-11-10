




module ride::Pergola_Taffoni {
	
	use std::string::{ String };
	use std::signer;
	
	use aptos_framework::coin;
	use aptos_framework::aptos_coin::{ AptosCoin, Self };
	
	use ride::Loft;
	
	#[view]
    public fun togetherness () : String {
		let togetherness = Loft::togetherness ();
		togetherness
    }
	
	/*
		similar:
			create-resource-account
	struct Taffoni  {
		Octas : AptosCoin
	}
	*/
	
	public entry fun establish_Taffoni (
		estate_1_signer: & signer
	) {
		
	}
	
	public entry fun G1 (estate_1_flourisher: & signer) {
		let estate_1_spot = signer::address_of (estate_1_flourisher);
		
		
		/*
		if (exists<Taffoni>(estate_1_spot)) {
            abort (1001)
        };
		
		
		let le_Taffoni = Taffoni {
            Octas : AptosCoin
        };
		move_to (estate_1_flourisher, le_Taffoni);
		*/
	}
	
	public entry fun add_AptosCoin_to_Taffoni (
		estate_1_signer: & signer,
		amount : u64
	) {
		
	}
	
	
	
}


