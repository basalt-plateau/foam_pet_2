
/*
	Structure:
	
		Harvest {
			parties: [],
			
			//
			// 	This is for send protection
			//	so that a person can send directly.
			//
			attempts: []
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
	use ride_1::Merci_Presents;
	use ride_1::Merci_Parties;
	
	const Novelist_spot : address = @0x150755A53B2FD604F5072BDF22C2F1DCA1D9D730D1AFAF460A3D8C8E16528C5F;
	
	#[view]
	public fun Bayanihan () : String {
		Merci_Bayanihan::Bayanihan ()
	}	

	struct Harvest has key {
		parties: vector<Merci_Parties::Party>,
		presents: vector<Merci_Presents::Present>
	}
	
	public fun search_novelist_spot () : address {
		Novelist_spot
	}
	
	public entry fun establish_harvest (
		estate_flourisher : & signer,
		mercyverse : u256
	) {
		let estate_1_spot = signer::address_of (estate_flourisher);
		if (estate_1_spot != Novelist_spot) { abort 9502 };

		let parties = Merci_Parties::organize_parties ();
		let le_party = Merci_Parties::organize_party (estate_1_spot, mercyverse);
		Merci_Parties::add_a_party (&mut parties, le_party);
		
		let presents = Merci_Presents::organize_presents ();
		
		let le_mercy_harvest = Harvest { 
			parties: parties,
			presents: presents
		};
		
		move_to<Harvest>(estate_flourisher, le_mercy_harvest)
	}

	
	public entry fun join_harvest (estate_flourisher : & signer) acquires Harvest {
		let le_harvest = borrow_global_mut<Harvest>(Novelist_spot);
		let parties = &mut le_harvest.parties;
		
		let estate_spot = signer::address_of (estate_flourisher);
		
		let mercy : u256 = 0;
		let le_party = Merci_Parties::organize_party (estate_spot, mercy);
		Merci_Parties::add_a_party (parties, le_party);
	}
	
	
	public entry fun leave_harvest () {}
	
	
	
	
	/*
		party 1 mercy -> party 2 presents
	*/
	public entry fun present_mercy (
		estate_1_flourisher : & signer,
		estate_spot : address
	) acquires Harvest {
		let estate_1_spot = signer::address_of (estate_1_flourisher);	
		let party_1_mercy_volume : u256 = ask_for_party_mercy_volume (estate_1_spot);
		
		
		
	}
	
	

	
	
	#[view]
	public fun is_party_at_harvest (estate_spot : address) : String acquires Harvest {
		let le_harvest = borrow_global<Harvest>(Novelist_spot);
		let parties = & le_harvest.parties;
		let parties_turnout = vector::length (parties);
		
		for (index_1 in 0..parties_turnout) {
			let party = vector::borrow (parties, index_1);
			
			if (Merci_Parties::retrieve_spot (party) == estate_spot) {
				return utf8 (b"yup")
			}
		};
		
		utf8 (b"no")
	}
	
	#[view]
	public fun ask_for_party_mercy_volume (estate_spot : address) : u256 acquires Harvest {
		let le_harvest = borrow_global<Harvest>(Novelist_spot);
		let parties = & le_harvest.parties;
		let parties_turnout = vector::length (parties);
		
		for (index_1 in 0..parties_turnout) {
			let party = vector::borrow (parties, index_1);
			
			if (Merci_Parties::retrieve_spot (party) == estate_spot) {
				return Merci_Parties::retrieve_mercy (party)
			}
		};
		
		abort 1
	}
	
	
	

	
	
	
}


