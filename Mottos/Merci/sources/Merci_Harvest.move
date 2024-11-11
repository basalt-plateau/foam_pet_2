




module ride::Merci_Harvest {
	
	use std::string::{ String, utf8 };
	use std::vector;
	
	#[view]
	public fun symbiotic () : String {
		Merci_Symbiotic::symbiotic ()
	}	
	
	struct Mercy_Harvest {
		estates: vector<address>
	}
	

	public entry fun Join_the_Mercy_Harvest () {
		Mercy { planets: 0 }
	}

	
	
}


