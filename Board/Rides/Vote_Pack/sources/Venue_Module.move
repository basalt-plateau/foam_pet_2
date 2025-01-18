


module builder_1::Venue_Module {
	
	use std::vector;
	use std::string::{ String, utf8 };
	use std::signer;

	use aptos_framework::timestamp;
	use aptos_framework::coin;
	use aptos_framework::aptos_coin::AptosCoin;

	use builder_1::Mascot_Module::{ Self, Mascot };
	use builder_1::Formulator_Module::{ formulator_position, ask_if_consenter_is_Formulator };
	use builder_1::Endings_Module;

	const Imperfection_consenter_has_not_joined : u64 = 0;
	const Imperfection_consenter_is_not_Formulator : u64 = 1;
	const Imperfection_consenter_does_not_have_enough_APT_for_purchase : u64 = 2;
	const Ending_mascot_was_not_found : u64 = 3;
	const Ending_every_vote_has_been_sold : u64 = 3;
	
	struct Vote has key, drop {}
	
	struct Venue has key, drop {
		votes_for_sale : u256,
		mascots : vector<Mascot>
	}
	
	#[view] public fun Volitions () : String { 
		use ride::Rules_10;
		Rules_10::Volitions_01 () 
	}
	
	
	#[view] public fun Votes_For_Sale_Left () : u256 acquires Venue {
		let sport = borrow_global<Venue>(formulator_position ());
		sport.votes_for_sale
	}
	
	#[view] public fun Mascot_Count () : u64 acquires Venue {
		let sport = borrow_global<Venue>(formulator_position ());
		vector::length (&sport.mascots)
	}
	
	/*
	#[view]
	public fun Mascot_Roster () acquires Venue {
		let sport = borrow_global<Venue>(formulator_position ());
		
		let bracket = vector::empty<u8>();	
		let num_mascots = vector::length(&sport.mascots);
	}
	*/
	
	
	
	public entry fun Begin (
		consenter : & signer,
		votes_for_sale : u256
	) {
		//
		//	Make sure the consenter is the Formulator.
		//
		//
		if (ask_if_consenter_is_Formulator (consenter) != utf8 (b"yup")) { 
			abort Imperfection_consenter_is_not_Formulator 
		};

		let sport = Venue {
			votes_for_sale : votes_for_sale,
			mascots : vector::empty<Mascot>()
		};
		
		move_to<Venue>(consenter, sport)
	}
	
	
	#[view]
	public fun sport_exists () : String {
		if (exists<Venue>(formulator_position ())) {
			return utf8 (b"yup")
		};
		
		utf8 (b"no")
	}
	
	#[view]
	public fun End () : String acquires Venue {
		// public entry fun End (consenter : & signer) acquires Venue {
		//
		//	Check if is after 2250 = 30 + 250 = 280
		//
		//
		// 1000 * 60 * 60 * 24 * 365.25
		let can_end_after : u64 = 31557600000 * 280;
		if (timestamp::now_microseconds () <= can_end_after) {
			abort Endings_Module::Ending_cannot_end_yet ()
		};
		
		
		move_from<Venue>(formulator_position ());
		
		sport_exists ()
	}
	
	
	public entry fun Join_the_Game (consenter : & signer) acquires Venue {
		let consenter_address = signer::address_of (consenter);
		
		let sport = borrow_global_mut<Venue>(formulator_position ());
		let mascots = &mut sport.mascots;
		let mascot = Mascot_Module::add (consenter_address);
		vector::push_back (mascots, mascot);		
	}
		
	
	public entry fun Buy_5_votes_for_1_APT (consenter : & signer) acquires Venue {
		let consenter_address = signer::address_of (consenter);
		
		
		//
		//
		//	Check if the consenter has joined the sport as a mascot.
		//
		//
		if (mascot_has_joined_the_sport (consenter_address) != utf8 (b"yup")) { 
			abort Imperfection_consenter_has_not_joined 
		};
		
		//
		//
		//	Check if the consenter has greater than 1 APT.
		//
		//
		if (coin::balance<AptosCoin>(consenter_address) < 100000000) { 
			abort Imperfection_consenter_does_not_have_enough_APT_for_purchase 
		};
		
		//
		//
		//	Check if there are enough water balloons left for sale.
		//
		//
		let sport = borrow_global<Venue>(formulator_position ());
		if (sport.votes_for_sale < 5) {
			abort Endings_Module::Ending_there_are_not_enough_votes_left_to_make_that_sale ()
		};
		
		//
		//
		//	Send 1 APT to the Formulator
		//
		//
		coin::transfer<AptosCoin>(consenter, formulator_position (), 100000000);
		
		
		//
		//
		//	Send 5 Water Balloons
		//
		//
		let votes_to_add : u256 = 5;
		let mascot_index = search_for_index_of_mascot (consenter_address);
		let sport = borrow_global_mut<Venue>(formulator_position ());
		let mascots = &mut sport.mascots;
		let mascot_at_index_ref = vector::borrow_mut (mascots, mascot_index);
		
		Mascot_Module::add_votes (mascot_at_index_ref, votes_to_add);	
		
		
		//
		//
		//	Subtract 5 Water Balloons from for sale
		//
		//
		sport.votes_for_sale = sport.votes_for_sale - 5;
		
		// coin::transfer<AptosCoin>(& consenter, mascot_01_position, 500);
		// coin::transfer<AptosCoin>(& consenter, formulator_position (), 500);
	}
	
	public entry fun Throw_Vote (
		consenter : & signer, 
		other_mascot_address : address
	) acquires Venue {
		let consenter_address = signer::address_of (consenter);
		
		//
		//	Search for mascot "from", if not found, end.
		//
		//
		let index_of_mascot_from = search_for_index_of_mascot_with_ending_code (
			consenter_address,
			Endings_Module::Ending_the_thrower_has_not_joined_the_game ()
		);
		
		let index_of_mascot_to = search_for_index_of_mascot_with_ending_code (
			other_mascot_address,
			Endings_Module::Ending_the_catcher_has_not_joined_the_game ()
		);
		
		// let index_of_mascot_to = search_for_index_of_mascot (other_mascot_address);
		let sport = borrow_global_mut<Venue>(formulator_position ());
		let mascots = &mut sport.mascots;
		
		let mascot_from_ref = vector::borrow_mut (mascots, index_of_mascot_from);
		Mascot_Module::subtract_votes (mascot_from_ref, 1);	

		let mascot_to_ref = vector::borrow_mut (mascots, index_of_mascot_to);		
		Mascot_Module::add_votes (mascot_to_ref, 1);		
	}
	
	
	public fun search_for_index_of_mascot (mascot_address : address) : u64 acquires Venue {
		search_for_index_of_mascot_with_ending_code (mascot_address, Ending_mascot_was_not_found)
	}
	
	public fun search_for_index_of_mascot_with_ending_code (
		mascot_address : address,
		ending_code : u64
	) : u64 acquires Venue {
		let sport = borrow_global_mut<Venue>(formulator_position ());
		let mascots = &mut sport.mascots;
		for (index in 0..vector::length (mascots)) {
			let mascot_at_index_ref = vector::borrow_mut (mascots, index);
			let mascot_at_index_address = Mascot_Module::mascot_address (mascot_at_index_ref);
			if (mascot_at_index_address == mascot_address) {
				return index
			}			
		};
		
		abort ending_code
	}
	
	public fun mascot_has_joined_the_sport (mascot_address : address) : String acquires Venue {
		let sport = borrow_global<Venue>(formulator_position ());
		let mascots = & sport.mascots;
		for (index in 0..vector::length (mascots)) {
			let mascot_at_index_ref = vector::borrow (& sport.mascots, index);
			let mascot_at_index_address = Mascot_Module::mascot_address (mascot_at_index_ref);
			if (mascot_at_index_address == mascot_address) {
				return utf8 (b"yup")
			}			
		};
		
		utf8 (b"no")
	}
	

	#[view]
	public fun Votes_Score (mascot_address : address) : u256 acquires Venue {
		let index_of_mascot = search_for_index_of_mascot (mascot_address);
		let sport = borrow_global<Venue>(formulator_position ());
		let mascots = & sport.mascots;
		let mascot_at_index_ref = vector::borrow (
			mascots, 
			index_of_mascot
		);
		
		Mascot_Module::votes_score (mascot_at_index_ref)
	}
	
}