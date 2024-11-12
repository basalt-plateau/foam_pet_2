


/*
	entry:
		Establish_the_Mercy_Harvest
	
	
	scouting:
		has_estate : String
			returns "yup" if has estate
		
		ask_estate_mercy_amount : u64
		
		
*/
module ride_1::Merci_Harvest {
	
	use std::string::{ String, utf8 };
	use std::vector;
	use std::signer;
	
	use aptos_std::simple_map::{Self, SimpleMap};
	
	use ride_1::Merci_Bayanihan;
	use ride_1::Merci_Kisiwa;
	use ride_1::Merci_Kisiwa::{ Kisiwa };
	
	const Novelist_spot : address = @0x4b1082b9c8f6250e01acb41aa4d2efce56a1278ee2309fefdbf0d5c59e5ac5e3;
	
	#[view]
	public fun Bayanihan () : String {
		Merci_Bayanihan::Bayanihan ()
	}	
	
	
	struct Mercy_Harvest has key {
		visiwa: SimpleMap<address, Kisiwa>
	}
	
	
	public entry fun Establish_the_Mercy_Harvest (estate_flourisher : & signer) {
		let estate_1_spot = signer::address_of (estate_flourisher);
		if (estate_1_spot != Novelist_spot) { abort 9502 };
		
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
		let kisiwa = Merci_Kisiwa::Establish_a_Kisiwa (estate_1_spot, mercy);

		let visiwa = simple_map::create<address, Kisiwa>();
        simple_map::add (&mut visiwa, estate_1_spot, kisiwa);
		
		let le_mercy_harvest = Mercy_Harvest { 
			visiwa : visiwa
		};
		
		move_to<Mercy_Harvest>(estate_flourisher, le_mercy_harvest)
	}

	#[view]
	public fun has_estate (estate_spot : address) : String acquires Mercy_Harvest {
		let le_mercy_harvest = borrow_global<Mercy_Harvest>(Novelist_spot);
		let visiwa = & le_mercy_harvest.visiwa;
		
		let has_estate = simple_map::contains_key (visiwa, & estate_spot);
		if (has_estate) {
			return utf8 (b"yup")
		};
		
		utf8 (b"no")
	}
	
	#[view]
	public fun ask_estate_mercy_amount (estate_spot : address) : u256 acquires Mercy_Harvest {
		let le_mercy_harvest = borrow_global<Mercy_Harvest>(Novelist_spot);
		let visiwa = & le_mercy_harvest.visiwa;
		
		let kisiwa = simple_map::borrow (visiwa, & estate_spot);

		Merci_Kisiwa::mercy_amount_from_kisiwa (kisiwa)
	}
	

	
	public entry fun Join_the_Mercy_Harvest (estate_flourisher : & signer) acquires Mercy_Harvest {
		let estate_spot = signer::address_of (estate_flourisher);
		if (has_estate (estate_spot) == utf8 (b"yup")) { abort 89319 };
		
		let mercy : u256 = 0;
		let le_kisiwa = Merci_Kisiwa::Establish_a_Kisiwa (estate_spot, mercy);
		let le_mercy_harvest = borrow_global_mut<Mercy_Harvest>(Novelist_spot);
		
		let visiwa = &mut le_mercy_harvest.visiwa;
		
		simple_map::add (visiwa, estate_spot, le_kisiwa);
	}
	
	public entry fun Leave_the_Mercy_Harvest ()  {
		
	}

	
	
}


