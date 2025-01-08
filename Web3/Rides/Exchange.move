




module ride_1::Peptyde_01_Exchange {
	
	use std::string::{ String };
	
	use ride_1::Rules_09;
	
	#[view]
	public fun Volitions () : String {
		Rules_09::Volitions_01 ()
	}
	
	struct Peptyde_Exchange has key, drop {
		// escrow: 
	}
	

}