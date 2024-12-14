
/*
	Structure:
	
		Harvest {
			parties: [],
			
			//
			// 	This is for send protection
			//	so that a person can send directly.
			//
			gifts: []
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
	
	use std::string::{ Self, String, utf8 };
	use std::signer;
	use std::vector;
	
	use aptos_std::simple_map::{Self, SimpleMap};
	
	use ride_1::Merci_Bayanihan;
	use ride_1::Merci_Ship;
	use ride_1::Merci_Ship::{ Ship };
	use ride_1::Merci_Gifts;
	use ride_1::Merci_Parties;
	
	
	
	#[view]
	public fun Bayanihan () : String {
		Merci_Bayanihan::Bayanihan ()
	}	


	struct Harvest has key {
		parties: vector<Merci_Parties::Party>,
		gifts: vector<Merci_Gifts::Gift>		
	}
	
	public fun is_novestlist (estate_flourisher : & signer) : String {
		let estate_spot = signer::address_of (estate_flourisher);
		let novelist_spot : address = @0x2f75da076414103c721d195b0376c66897593b1f4e961671099a2dc9a24adcfd;
		if (estate_spot == novelist_spot) {
			return utf8 (b"yeah")
		};
		
		utf8 (b"no")
	}
	
	#[view]
	public fun search_novelist_spot () : address {
		// const Novelist_Spot : address = @0x150755A53B2FD604F5072BDF22C2F1DCA1D9D730D1AFAF460A3D8C8E16528C5F;
		let novelist_spot : address = @0x2f75da076414103c721d195b0376c66897593b1f4e961671099a2dc9a24adcfd;
		novelist_spot
	}
	
	
	public entry fun establish_harvest (
		estate_flourisher : & signer,
		mercyverse : u256
	) {
		let estate_1_spot = signer::address_of (estate_flourisher);
		if (estate_1_spot != search_novelist_spot ()) { abort 9502 };

		let parties = Merci_Parties::organize_parties ();
		let le_party = Merci_Parties::organize_party (estate_1_spot, mercyverse);
		Merci_Parties::add_a_party (&mut parties, le_party);
		
		let gifts = Merci_Gifts::organize_gifts ();
		
		let le_mercy_harvest = Harvest { 
			parties: parties,
			gifts: gifts
		};
		
		move_to<Harvest>(estate_flourisher, le_mercy_harvest)
	}

	
	/*
		let le_harvest : & Harvest = retrieve_inflexible_harvest ();
		let le_harvest : & Merci_Harvest::Harvest = Merci_Harvest::retrieve_inflexible_harvest ();
	public fun retrieve_inflexible_harvest () : & Harvest acquires Harvest {
		let le_harvest = borrow_global<Harvest>(search_novelist_spot ());
		le_harvest
	}
	*/
	
	
	
	public fun gifts_count () : u64 acquires Harvest {
		let le_harvest = borrow_global<Harvest>(search_novelist_spot ());
		vector::length (& le_harvest.gifts)
	}
	
	
	#[view]
	public fun gifts_of_party () : vector<Merci_Gifts::Gift> acquires Harvest {
		let le_harvest = borrow_global<Harvest>(search_novelist_spot ());
        let gifts_bracket = vector::empty<Merci_Gifts::Gift>();

        let gifts_count = vector::length (& le_harvest.gifts);
        for (index_1 in 0..gifts_count) {
            let gift = vector::borrow (& le_harvest.gifts, index_1);
			
			let output_gift = Merci_Gifts::clone_gift (gift);
			
            vector::push_back (&mut gifts_bracket, output_gift);
        };

        gifts_bracket
	}
	
	public entry fun join_harvest (estate_flourisher : & signer) acquires Harvest {
		let le_harvest = borrow_global_mut<Harvest>(search_novelist_spot ());
		let parties = &mut le_harvest.parties;
		
		let estate_spot = signer::address_of (estate_flourisher);
		
		let mercy : u256 = 0;
		let le_party = Merci_Parties::organize_party (estate_spot, mercy);
		Merci_Parties::add_a_party (parties, le_party);
	}
	
	
	public entry fun leave_harvest () {}
	

	
	
	/*
		Merci_Harvest::gift_mercy ()
	
		party 1 mercy -> party 2 gifts
	*/
	public entry fun gift_mercy (
		party_1_flourisher : & signer,
		party_2_spot : address,
		mercy_to_send: u256
	) acquires Harvest {
		let le_harvest = borrow_global_mut<Harvest>(search_novelist_spot ());
		let parties = &mut le_harvest.parties;
		let gifts = &mut le_harvest.gifts;
		
		let party_1_spot = signer::address_of (party_1_flourisher);	
		
		/*
		let party_1_mercy_volume : u256 = ask_for_party_mercy_volume (party_1_spot);
		if (party_1_mercy_volume < mercy_to_send) {
			abort 2;
		};
		*/
		
		
		/*
			This checks if party_2 has joined the harvest.
			
		*/
		let party_2 : &mut Merci_Parties::Party = Merci_Parties::search_for_flexible_party (parties, party_2_spot);
		
		/*
			attempt deduct from party_1
		*/
		Merci_Parties::attempt_deduct_mercy (parties, party_1_spot, mercy_to_send);
		
		/*
			attempt add mercy to gifts
		*/
		Merci_Gifts::add_a_gift (gifts, party_1_spot, party_2_spot, mercy_to_send);
	}
	

	
	
	#[view]
	public fun is_party_at_harvest (estate_spot : address) : String acquires Harvest {
		let le_harvest = borrow_global<Harvest>(search_novelist_spot ());
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
		let le_harvest = borrow_global<Harvest>(search_novelist_spot ());
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


