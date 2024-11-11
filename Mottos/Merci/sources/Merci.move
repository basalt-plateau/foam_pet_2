


module ride::Merci {
	
	use std::string::{ String, utf8 };
	use std::vector;
	
	#[view]
	public fun symbiotic () : String {
		Merci_Symbiotic::symbiotic ()
	}	
	
	struct Mercy {
		planets: u64
	}
	
	
	
	/*
		
		Discover the amount of mercy planets.
		
	*/
	#[view]
	public fun discover_amount_of_mercy_planets (estate_1_spot : address) : u64 {}
		
	public entry fun Join_the_Mercy_Harvest () {
		Mercy { planets: 0 }
	}
	
	public entry fun Evoke_Mercy () {
		Mercy { planets: 0 }
	}
	
	
}


