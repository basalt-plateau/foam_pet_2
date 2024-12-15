
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
	Entry:
		Establish_the_Mercy_Harvest
		
		Join_the_Mercy_Harvest
		Leave_the_Mercy_Harvest
	
		Send_Mercy
		Receive_Mercy
			(Obtain)
			
	Scouting:
		has_estate : String
			returns "yup" if has estate
		
		ask_estate_mercy_amount : u64
*/
module ride_1::Merci_Harvest {
	
	use std::string::{ String, utf8 };
	use std::signer;
	use std::vector;
	
	use ride_1::Merci_Bayanihan;
	use ride_1::Merci_Gifts;
	use ride_1::Merci_Parties;
	
	
	
	#[view]
	public fun Bayanihan () : String {
		Merci_Bayanihan::Bayanihan ()
	}	


	struct Harvest has key, drop {
		parties: vector<Merci_Parties::Party>,
		gifts: vector<Merci_Gifts::Gift>		
	}
	
	/*
		 _   _                      _  _       _   
		| \ | |  ___  __   __  ___ | |(_) ___ | |_ 
		|  \| | / _ \ \ \ / / / _ \| || |/ __|| __|
		| |\  || (_) | \ V / |  __/| || |\__ \| |_ 
		|_| \_| \___/   \_/   \___||_||_||___/ \__|
												   
	
		Fonctions:
			ask_if_signer_is_novelist
			ask_if_address_is_novelist
			ask_for_address_of_novelist
	*/
	public fun ask_if_signer_is_novelist (estate_flourisher : & signer) : String {
		let estate_spot = signer::address_of (estate_flourisher);
		if (estate_spot == ask_for_address_of_novelist ()) {
			return utf8 (b"yeah")
		};
		
		utf8 (b"no")
	}
	public fun ask_if_address_is_novelist (estate_address : address) : String {
		/*
			if (ask_if_address_is_novelist (estate_1_spot) != utf8 (b"yeah")) { abort 9502 };
		*/
		
		if (estate_address == ask_for_address_of_novelist ()) {
			return utf8 (b"yeah")
		};
		
		utf8 (b"no")
	}
	#[view]
	public fun ask_for_address_of_novelist () : address {
		let novelist_spot : address = @0x2f75da076414103c721d195b0376c66897593b1f4e961671099a2dc9a24adcfd;
		novelist_spot
	}
	
	
	
	/* Establish (+ Destroy) */
	/*
		 _____       _           _      _  _       _               ____              _                       
		| ____| ___ | |_   __ _ | |__  | |(_) ___ | |__      _    |  _ \   ___  ___ | |_  _ __   ___   _   _ 
		|  _|  / __|| __| / _` || '_ \ | || |/ __|| '_ \   _| |_  | | | | / _ \/ __|| __|| '__| / _ \ | | | |
		| |___ \__ \| |_ | (_| || |_) || || |\__ \| | | | |_   _| | |_| ||  __/\__ \| |_ | |   | (_) || |_| |
		|_____||___/ \__| \__,_||_.__/ |_||_||___/|_| |_|   |_|   |____/  \___||___/ \__||_|    \___/  \__, |
																									   |___/ 	
	
		Fonctions:
			ask_to_establish_harvest
			ask_to_destroy_harvest
	*/
	public entry fun ask_to_establish_harvest (
		estate_flourisher : & signer,
		mercyverse : u256
	) {
		let estate_1_spot = signer::address_of (estate_flourisher);
		if (ask_if_address_is_novelist (estate_1_spot) != utf8 (b"yeah")) { abort 9502 };

		let parties = Merci_Parties::organize_parties ();
		let le_party = Merci_Parties::organize_party (estate_1_spot, mercyverse);
		Merci_Parties::ask_to_join_les_parties (&mut parties, le_party);
		
		let gifts = Merci_Gifts::organize_gifts ();
		
		let le_mercy_harvest = Harvest { 
			parties: parties,
			gifts: gifts
		};
		
		move_to<Harvest>(estate_flourisher, le_mercy_harvest)
	}
	public entry fun ask_to_destroy_harvest (estate_flourisher : & signer) acquires Harvest {
		let estate_1_spot = signer::address_of (estate_flourisher);
		move_from<Harvest>(estate_1_spot);
	}


	
	
	/* Gifts */
	/*
		  ____  _   __  _        
		 / ___|(_) / _|| |_  ___ 
		| |  _ | || |_ | __|/ __|
		| |_| || ||  _|| |_ \__ \
		 \____||_||_|   \__||___/
								 
		Fonctions:
			ask_for_the_gifts_count
			ask_what_gifts_a_party_can_accept
			ask_to_add_a_gift_to_gifts
	*/
	public fun ask_for_the_gifts_count () : u64 acquires Harvest {
		let le_harvest = borrow_global<Harvest>(ask_for_address_of_novelist ());
		vector::length (& le_harvest.gifts)
	}
	#[view]
	public fun ask_what_gifts_a_party_can_accept () : vector<Merci_Gifts::Gift> acquires Harvest {
		let le_harvest = borrow_global<Harvest>(ask_for_address_of_novelist ());
        let gifts_bracket = vector::empty<Merci_Gifts::Gift>();

        let gifts_count = vector::length (& le_harvest.gifts);
        for (index_1 in 0..gifts_count) {
            let gift = vector::borrow (& le_harvest.gifts, index_1);
			
			let output_gift = Merci_Gifts::clone_gift (gift);
			
            vector::push_back (&mut gifts_bracket, output_gift);
        };

        gifts_bracket
	}	
	public entry fun ask_to_add_a_gift_to_gifts (
		party_1_flourisher : & signer,
		party_2_spot : address,
		mercy_to_send: u256
	) acquires Harvest {
		/*
			Merci_Harvest::gift_mercy ()
			party 1 mercy -> party 2 gifts
		*/
		
		let le_harvest = borrow_global_mut<Harvest>(ask_for_address_of_novelist ());
		let parties = &mut le_harvest.parties;
		let gifts = &mut le_harvest.gifts;
		
		let party_1_spot = signer::address_of (party_1_flourisher);	
		
		/*
		let party_1_mercy_volume : u256 = ask_for_le_amount_of_mercy_that_a_party_has (party_1_spot);
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
		Merci_Parties::ask_to_deduct_mercy (parties, party_1_spot, mercy_to_send);
		
		/*
			attempt add mercy to gifts
		*/
		Merci_Gifts::add_a_gift (gifts, party_1_spot, party_2_spot, mercy_to_send);
	}
	

	
	/*
		 ____                _    _            
		|  _ \   __ _  _ __ | |_ (_)  ___  ___ 
		| |_) | / _` || '__|| __|| | / _ \/ __|
		|  __/ | (_| || |   | |_ | ||  __/\__ \
		|_|     \__,_||_|    \__||_| \___||___/
	
	
		Fonctions:
			ask_to_join_harvest
			petition_to_leave_harvest
		
			ask_if_a_party_joined_the_harvest
			ask_for_party_count
			
			ask_for_le_amount_of_mercy_that_a_party_has
	*/
	public entry fun ask_to_join_harvest (estate_flourisher : & signer) acquires Harvest {
		let le_harvest = borrow_global_mut<Harvest>(ask_for_address_of_novelist ());
		let parties = &mut le_harvest.parties;
		
		let estate_spot = signer::address_of (estate_flourisher);
		
		let mercy : u256 = 0;
		let le_party = Merci_Parties::organize_party (estate_spot, mercy);
		Merci_Parties::ask_to_join_les_parties (parties, le_party);
	}
	public entry fun petition_to_leave_harvest (estate_flourisher : & signer) acquires Harvest {
		let estate_spot = signer::address_of (estate_flourisher);
		
		let le_harvest = borrow_global_mut<Harvest>(ask_for_address_of_novelist ());
		let parties = &mut le_harvest.parties;
		
		Merci_Parties::petition_to_leave_les_parties (parties, estate_spot);
	}
	#[view]
	public fun ask_if_a_party_joined_the_harvest (estate_spot : address) : String acquires Harvest {
		let le_harvest = borrow_global<Harvest>(ask_for_address_of_novelist ());
		let parties = & le_harvest.parties;
		let parties_turnout = vector::length (parties);
		
		for (index_1 in 0..parties_turnout) {
			if (Merci_Parties::retrieve_spot (vector::borrow (parties, index_1)) == estate_spot) {
				return utf8 (b"yup")
			}
		};
		
		utf8 (b"no")
	}
	#[view]
	public fun ask_for_party_count () : u64 acquires Harvest {
		/*
			let party_count : u64 = Merci_Harvest::ask_for_party_count ()
		*/
		
		vector::length (& borrow_global<Harvest>(ask_for_address_of_novelist ()).parties)
	}	
	#[view]
	public fun ask_for_le_amount_of_mercy_that_a_party_has (estate_spot : address) : u256 acquires Harvest {
		let le_harvest = borrow_global<Harvest>(ask_for_address_of_novelist ());
		let parties = & le_harvest.parties;
		let parties_turnout = vector::length (parties);
		
		for (index_1 in 0..parties_turnout) {
			let party = vector::borrow (parties, index_1);
			
			if (Merci_Parties::retrieve_spot (party) == estate_spot) {
				return Merci_Parties::ask_for_le_amount_of_mercy_that_a_party_has (party)
			}
		};
		
		abort 1
	}
	
	
	

	
	
	
}


