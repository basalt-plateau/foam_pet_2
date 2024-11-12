




module ride_1::Merci_Harvest {
	
	use std::string::{ String, utf8 };
	use std::vector;
	use std::signer;
	
	use ride_1::Merci_Bayanihan;
	use ride_1::Merci_Kisiwa;
	use ride_1::Merci_Kisiwa::{ Kisiwa };
	
	#[view]
	public fun Bayanihan () : String {
		Merci_Bayanihan::Bayanihan ()
	}	
	
	
	struct Mercy_Harvest has key {
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
		let kisiwa = Merci_Kisiwa::Establish_a_Kisiwa (estate_1_address);
		
		let visiwa : vector<Kisiwa> = vector::empty<Kisiwa>();
		vector::push_back (&mut visiwa, kisiwa);
		
		let le_mercy_harvest = Mercy_Harvest { 
			visiwa : visiwa
		};
		
		move_to<Mercy_Harvest>(estate_flourisher, le_mercy_harvest)
	}

	public entry fun Join_the_Mercy_Harvest (
		harvest_spot : address,
		estate : & signer
	) {
		
		
	}
	
	public entry fun Leave_the_Mercy_Harvest ()  {
		
	}

	
	
}


