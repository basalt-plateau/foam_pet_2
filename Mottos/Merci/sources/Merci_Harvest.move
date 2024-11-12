




module ride_1::Merci_Harvest {
	
	use std::string::{ String, utf8 };
	use std::vector;
	
	use ride_1::Merci_Symbiotic;
	
	#[view]
	public fun Symbiotic () : String {
		Merci_Symbiotic::Symbiotic ()
	}	
	
	
	
	struct Mercy_Harvest {
		visiwa: vector<Kisiwa>
	}
	
	
	public entry fun Establish_the_Mercy_Harvest (estate_flourisher : & signer) {
		let estate_1_address = signer::address_of (estate_flourisher);
		
		/*
			1.157 * 10^76

			76: 10,00000,00000,00000,00000,00000,00000,00000,00000,00000,00000,00000,00000,00000,00000,00000
				10000000000000000000000000000000000000000000000000000000000000000000000000000

			75: 1,00000,00000,00000,00000,00000,00000,00000,00000,00000,00000,00000,00000,00000,00000,00000
		
			50: 1,00000,00000,00000,00000,00000,00000,00000,00000,00000,00000
		
			25: 1,00000,00000,00000,00000,00000		
				10000000000000000000000000	
		*/
		let mercy : u256 = 10000000000000000000000000000000000000000000000000000000000000000000000000000;
		let kisiwa = Kisiwa {
			spot : estate_1_address,
			mercy : mercy 
		};
		
		let le_mercy_harvest = Mercy_Harvest { 
			estates
		};
		
		
		
	}

	public entry fun Join_the_Mercy_Harvest () {
	}
	
	public entry fun Leave_the_Mercy_Harvest () : Mercy  {
		
	}

	
	
}


