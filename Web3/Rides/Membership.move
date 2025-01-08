


module ride_1::Peptyde_01_Membership {
	
	use std::string::{ String };
	
	use ride_1::Rules_09;
	
	#[view]
	public fun Volitions () : String {
		Rules_09::Volitions_01 ()
	}
	
	struct Peptyde_Membership has key, drop {
		// escrow: 
	}
	
	public entry fun Annex_1_Membership_Pass (consenter : & signer) acquires Peptyde_Membership {
		
	}
}