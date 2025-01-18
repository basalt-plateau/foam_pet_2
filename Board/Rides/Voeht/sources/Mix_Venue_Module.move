


module builder_1::Mix_Venue_Module {
	
	use std::vector;
	use std::string::{ String, utf8 };
	use std::signer;

	use aptos_framework::timestamp;
	use aptos_framework::coin;
	use aptos_framework::aptos_coin::AptosCoin;

	use builder_1::Rules_09;
	
	use builder_1::Mascot_Module::{ Self, Mascot };
	use builder_1::Production_Module::{ owner_position, ask_if_consenter_is_owner };
	use builder_1::Endings_Module;

	const Imperfection_consenter_has_not_joined : u64 = 0;
	const Imperfection_consenter_is_not_owner : u64 = 1;
	const Imperfection_consenter_does_not_have_enough_APT_for_purchase : u64 = 2;
	const Ending_mascot_was_not_found : u64 = 3;
	const Ending_every_voht_has_been_sold : u64 = 3;

	#[view] public fun Volitions () : String { 
		use ride::Rules_10;
		Rules_10::Volitions_01 () 
	}
	
	struct Voht has key, drop {}
	
	struct Sport has key, drop {
		vohts_for_sale : u256,
		mascots : vector<Mascot>
	}
	
	#[view]
	public fun Vohts_For_Sale_Left () : u256 acquires Sport {
		let sport = borrow_global<Sport>(owner_position ());
		sport.vohts_for_sale
	}
	
	/*
	#[view]
	public fun Mascot_Roster () acquires Sport {
		let sport = borrow_global<Sport>(owner_position ());
		
		let bracket = vector::empty<u8>();	
		let num_mascots = vector::length(&sport.mascots);
	}
	*/
	
	#[view]
	public fun Mascot_Count () : u64 acquires Sport {
		let sport = borrow_global<Sport>(owner_position ());
		vector::length (&sport.mascots)
	}
	
	
	
	public entry fun Begin (
		consenter : & signer,
		vohts_for_sale : u256
	) {
		//
		//	Make sure the consenter is the owner.
		//
		//
		if (ask_if_consenter_is_owner (consenter) != utf8 (b"yup")) { 
			abort Imperfection_consenter_is_not_owner 
		};

		let sport = Sport {
			vohts_for_sale : vohts_for_sale,
			mascots : vector::empty<Mascot>()
		};
		
		move_to<Sport>(consenter, sport)
	}
	
	
	#[view]
	public fun sport_exists () : String {
		if (exists<Sport>(owner_position ())) {
			return utf8 (b"yup")
		};
		
		utf8 (b"no")
	}
	
	#[view]
	public fun End () : String acquires Sport {
		// public entry fun End (consenter : & signer) acquires Sport {
		//
		//	Check if is after 2250 = 30 + 250 = 280
		//
		//
		// 1000 * 60 * 60 * 24 * 365.25
		let can_end_after : u64 = 31557600000 * 280;
		if (timestamp::now_microseconds () <= can_end_after) {
			abort Endings_Module::Ending_cannot_end_yet ()
		};
		
		
		move_from<Sport>(owner_position ());
		
		sport_exists ()
	}
	
	
	public entry fun Join_the_Game (consenter : & signer) acquires Sport {
		let consenter_address = signer::address_of (consenter);
		
		let sport = borrow_global_mut<Sport>(owner_position ());
		let mascots = &mut sport.mascots;
		let mascot = Mascot_Module::add (consenter_address);
		vector::push_back (mascots, mascot);		
	}
		
	
	public entry fun Buy_5_vohts_for_1_APT (consenter : & signer) acquires Sport {
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
		let sport = borrow_global<Sport>(owner_position ());
		if (sport.vohts_for_sale < 5) {
			abort Endings_Module::Ending_there_are_not_enough_vohts_left_to_make_that_sale ()
		};
		
		//
		//
		//	Send 1 APT to the owner
		//
		//
		coin::transfer<AptosCoin>(consenter, owner_position (), 100000000);
		
		
		//
		//
		//	Send 5 Water Balloons
		//
		//
		let vohts_to_add : u256 = 5;
		let mascot_index = search_for_index_of_mascot (consenter_address);
		let sport = borrow_global_mut<Sport>(owner_position ());
		let mascots = &mut sport.mascots;
		let mascot_at_index_ref = vector::borrow_mut (mascots, mascot_index);
		
		Mascot_Module::add_vohts (mascot_at_index_ref, vohts_to_add);	
		
		
		//
		//
		//	Subtract 5 Water Balloons from for sale
		//
		//
		sport.vohts_for_sale = sport.vohts_for_sale - 5;
		
		// coin::transfer<AptosCoin>(& consenter, mascot_01_position, 500);
		// coin::transfer<AptosCoin>(& consenter, owner_position (), 500);
	}
	
	public entry fun Throw_Voht (
		consenter : & signer, 
		other_mascot_address : address
	) acquires Sport {
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
		let sport = borrow_global_mut<Sport>(owner_position ());
		let mascots = &mut sport.mascots;
		
		let mascot_from_ref = vector::borrow_mut (mascots, index_of_mascot_from);
		Mascot_Module::subtract_vohts (mascot_from_ref, 1);	

		let mascot_to_ref = vector::borrow_mut (mascots, index_of_mascot_to);		
		Mascot_Module::add_vohts (mascot_to_ref, 1);		
	}
	
	
	public fun search_for_index_of_mascot (mascot_address : address) : u64 acquires Sport {
		search_for_index_of_mascot_with_ending_code (mascot_address, Ending_mascot_was_not_found)
	}
	
	public fun search_for_index_of_mascot_with_ending_code (
		mascot_address : address,
		ending_code : u64
	) : u64 acquires Sport {
		let sport = borrow_global_mut<Sport>(owner_position ());
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
	
	public fun mascot_has_joined_the_sport (mascot_address : address) : String acquires Sport {
		let sport = borrow_global<Sport>(owner_position ());
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
	public fun Vohts_Score (mascot_address : address) : u256 acquires Sport {
		let index_of_mascot = search_for_index_of_mascot (mascot_address);
		let sport = borrow_global<Sport>(owner_position ());
		let mascots = & sport.mascots;
		let mascot_at_index_ref = vector::borrow (
			mascots, 
			index_of_mascot
		);
		
		Mascot_Module::vohts_score (mascot_at_index_ref)
	}
	
}