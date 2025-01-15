
/*
	Structure:
	
		Harvest {
			parties: [],
			
			//
			// 	This is for send protection
			//	so that a person can send directly.
			//
			harbor: []
		}

*/
/*
	entry:
		Establish_the_Mercy_Harvest
		
		Join_the_Mercy_Harvest
		Leave_the_Mercy_Harvest
	
		Send_Mercy
		Receive_Mercy
			(Obtain)
			
	scouting:
		has_estate : String
			returns "yup" if has estate
		
		ask_estate_mercy_amount : u64
*/
module ride_1::Merci_Harvest {
	
	use std::string::{ String, utf8 };
	use std::signer;
	use std::vector;
	
	use aptos_std::simple_map::{Self, SimpleMap};
	
	use ride_1::Merci_Bayanihan;
	use ride_1::Merci_Ship;
	use ride_1::Merci_Ship::{ Ship };
	use ride_1::Merci_Harbor;
	use ride_1::Merci_Parties;
	
	const Novelist_spot : address = @0x150755A53B2FD604F5072BDF22C2F1DCA1D9D730D1AFAF460A3D8C8E16528C5F;
	
	const Origin_kisiwa_does_not_have_enough_mercy : u64 = 1;
	
	#[view]
	public fun Bayanihan () : String {
		Merci_Bayanihan::Bayanihan ()
	}	

	struct Mercy_Harvest has key {
		parties: vector<Merci_Parties::Party>,
		harbor: SimpleMap<address, Merci_Harbor::Tote>,
	}
	
	public fun search_novelist_spot () : address {
		Novelist_spot
	}
	
	public entry fun Establish_the_Mercy_Harvest (
		estate_flourisher : & signer,
		mercyverse : u256
	) {
		let estate_1_spot = signer::address_of (estate_flourisher);
		if (estate_1_spot != Novelist_spot) { abort 9502 };
		
		let kisiwa = Merci_Ship::Establish_a_Ship (mercyverse);

		// let parties = simple_map::create<address, Ship>();
        // simple_map::add (&mut parties, estate_1_spot, kisiwa);
		
		let parties = Merci_Parties::organize_parties ();
		
		let le_mercy_harvest = Mercy_Harvest { 
			parties : parties,
			harbor : simple_map::create<address, Merci_Harbor::Tote>()
		};
		
		move_to<Mercy_Harvest>(estate_flourisher, le_mercy_harvest)
	}

	#[view]
	public fun has_estate (estate_spot : address) : String acquires Mercy_Harvest {
		let le_mercy_harvest = borrow_global<Mercy_Harvest>(Novelist_spot);
		let parties = & le_mercy_harvest.parties;
		
		let has_estate = simple_map::contains_key (parties, & estate_spot);
		if (has_estate) {
			return utf8 (b"yup")
		};
		
		utf8 (b"no")
	}
	
	#[view]
	public fun ask_estate_mercy_amount (estate_spot : address) : u256 acquires Mercy_Harvest {
		let le_mercy_harvest = borrow_global<Mercy_Harvest>(Novelist_spot);
		let parties = & le_mercy_harvest.parties;
		
		let kisiwa = simple_map::borrow (parties, & estate_spot);

		Merci_Ship::mercy_amount_from_kisiwa (kisiwa)
	}
	

	/*
			
	*/
	public entry fun Join_the_Mercy_Harvest (estate_flourisher : & signer) acquires Mercy_Harvest {
		let estate_spot = signer::address_of (estate_flourisher);
		if (has_estate (estate_spot) == utf8 (b"yup")) { abort 89319 };
		
		let mercy : u256 = 0;
		let le_kisiwa = Merci_Ship::Establish_a_Ship (mercy);
		let le_mercy_harvest = borrow_global_mut<Mercy_Harvest>(Novelist_spot);
		
		let parties = &mut le_mercy_harvest.parties;
		
		simple_map::add (parties, estate_spot, le_kisiwa);
	}
	
	public entry fun Leave_the_Mercy_Harvest (estate_flourisher : & signer) acquires Mercy_Harvest  {
		let estate_spot = signer::address_of (estate_flourisher);
		if (has_estate (estate_spot) != utf8 (b"yup")) { abort 89319 };
		
		let le_mercy_harvest = borrow_global_mut<Mercy_Harvest>(Novelist_spot);
		let parties = &mut le_mercy_harvest.parties;
		
		simple_map::remove (parties, & estate_spot);
	}


	/*
	public (friend) fun send_mercy_to_harbor (
		from_kisiwa : &mut Ship,
		to_harbor : &mut Ship,
		amount : u256
	) {
		//
		// Subtract mercy
		//
		//
		let from_kisiwa_mercy : u256 = from_kisiwa.mercy;
		if (amount > from_kisiwa_mercy) {
			abort 1
		};
		
		from_kisiwa.mercy = from_kisiwa.mercy - amount;
		
		let shipment = Merci_Harbor::organize_shipment (
			from_kisiwa.address,
			mercy_volume
		);
		
		//
		// Add a shipment to the harbor.
		//
		//
		to_harbor.mercy = to_harbor.mercy + amount;
	}
	*/

	/*
		Merci_Harvest::Send_Mercy (& estate_1_flourisher, estate_2_spot, mercy_to_send);
	*/
	/*
		estate_flourisher --[ mercy_to_send ]--> to_spot
		
		This requires signature of the sender.
	*/
	public entry fun Send_Mercy (
		estate_flourisher : & signer,
		to_spot : address,
		mercy_to_send : u256
	) acquires Mercy_Harvest {
		
		/*
			Check that the estates have 
			joined the mercy harvest.
		*/
		let origin_spot = signer::address_of (estate_flourisher);
		if (has_estate (origin_spot) != utf8 (b"yup")) { abort 89319 };
		if (has_estate (to_spot) != utf8 (b"yup")) { abort 89320 };
		
		
		
		/*
			Check that the "origin" estate has enough mercy
			to send to the "to" estate.		
		*/
		let origin_mercy_amount = ask_estate_mercy_amount (origin_spot);
		let to_mercy_amount = ask_estate_mercy_amount (to_spot);
		if (mercy_to_send > origin_mercy_amount) {
			abort Origin_kisiwa_does_not_have_enough_mercy
		};
		
		
		/*
			Subtract mercy from 
			the origin estate.
		*/
		let le_mercy_harvest = borrow_global_mut<Mercy_Harvest>(Novelist_spot);
		let origin_kisiwa = simple_map::borrow_mut (&mut le_mercy_harvest.parties, & origin_spot);
		Merci_Ship::sub_mercy (origin_kisiwa, mercy_to_send);
		
		
		/*
			Add mercy to 
			the "to" estate.
		*/
		let le_mercy_harvest = borrow_global_mut<Mercy_Harvest>(Novelist_spot);
		let to_kisiwa = simple_map::borrow_mut (&mut le_mercy_harvest.parties, & to_spot);
		Merci_Ship::add_mercy (to_kisiwa, mercy_to_send);
		
		
		/*
			Add mercy to 
			the "to" estate harbor.
			
			harbor: {
				address_1 : Tote {
					origin_address : address,
					mercy : u256
				}
			}
		
		let le_mercy_harvest = borrow_global_mut<Mercy_Harvest>(Novelist_spot);
		let to_harbor = simple_map::borrow_mut (&mut le_mercy_harvest.harbor, & to_spot);
		
		// send_mercy_to_harbor ();
		*/
	}
	
	
	
	/*
	public entry fun Receive_Mercy (
		estate_flourisher : & signer,
		from_spot : address,
		mercy_to_receive : u256
	) acquires Mercy_Harvest  {
		
		
		
	}
	*/
	
	
	
	
	
	
}


