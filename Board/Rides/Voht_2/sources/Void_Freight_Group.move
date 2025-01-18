


module builder_1::Void_Freight_Group {
	#[view] public fun Volitions () : String { 
		use Ride_01::Rules_10; 
		Rules_10::Volitions_01 ()
	}
	
	use std::vector;
	use std::string::{ String, utf8 };
	use std::signer;

	use aptos_framework::timestamp;
	use aptos_framework::coin;
	use aptos_framework::aptos_coin::AptosCoin;
	
	use builder_1::Voht_Freighter::{ Self, Freighter };
	use builder_1::Voht_Owner::{ owner_position, ask_if_consenter_is_owner };
	use builder_1::Voht_Endings;

	const Imperfection_consenter_has_not_joined : u64 = 0;
	const Imperfection_consenter_is_not_owner : u64 = 1;
	const Imperfection_consenter_does_not_have_enough_APT_for_purchase : u64 = 2;
	const Ending_Freighter_was_not_found : u64 = 3;
	const Ending_every_Voht_has_been_sold : u64 = 3;

	
	struct Tiny_Water_Balloon has key, drop {}
	
	struct Sport has key, drop {
		vohts_for_sale : u256,
		Freighters : vector<Freighter>
	}
	
	#[view]
	public fun Tiny_Water_Balloons_For_Sale_Left () : u256 acquires Sport {
		let sport = borrow_global<Sport>(owner_position ());
		sport.vohts_for_sale
	}
	
	/*
	#[view]
	public fun Freighter_Roster () acquires Sport {
		let sport = borrow_global<Sport>(owner_position ());
		
		let bracket = vector::empty<u8>();	
		let num_Freighters = vector::length(&sport.Freighters);
	}
	*/
	
	#[view]
	public fun Freighter_Count () : u64 acquires Sport {
		let sport = borrow_global<Sport>(owner_position ());
		vector::length (&sport.Freighters)
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
			Freighters : vector::empty<Freighter>()
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
			abort Voht_Endings::Ending_cannot_end_yet ()
		};
		
		
		move_from<Sport>(owner_position ());
		
		sport_exists ()
	}
	
	
	public entry fun Join_the_Game (consenter : & signer) acquires Sport {
		let consenter_address = signer::address_of (consenter);
		
		let sport = borrow_global_mut<Sport>(owner_position ());
		let Freighters = &mut sport.Freighters;
		let Freighter = Voht_Freighter::add (consenter_address);
		vector::push_back (Freighters, Freighter);		
	}
		
	
	public entry fun Buy_5_Vohts_for_1_APT (consenter : & signer) acquires Sport {
		let consenter_address = signer::address_of (consenter);
		
		
		//
		//
		//	Check if the consenter has joined the sport as a Freighter.
		//
		//
		if (Freighter_has_joined_the_sport (consenter_address) != utf8 (b"yup")) { 
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
			abort Voht_Endings::Ending_there_are_not_enough_Vohts_left_to_make_that_sale ()
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
		let Freighter_index = search_for_index_of_Freighter (consenter_address);
		let sport = borrow_global_mut<Sport>(owner_position ());
		let Freighters = &mut sport.Freighters;
		let Freighter_at_index_ref = vector::borrow_mut (Freighters, Freighter_index);
		
		Voht_Freighter::add_Vohts (Freighter_at_index_ref, vohts_to_add);	
		
		
		//
		//
		//	Subtract 5 Water Balloons from for sale
		//
		//
		sport.vohts_for_sale = sport.vohts_for_sale - 5;
		
		// coin::transfer<AptosCoin>(& consenter, Freighter_01_position, 500);
		// coin::transfer<AptosCoin>(& consenter, owner_position (), 500);
	}
	
	public entry fun Throw_Tiny_Water_Balloon (
		consenter : & signer, 
		other_address_of_freighter : address
	) acquires Sport {
		let consenter_address = signer::address_of (consenter);
		
		//
		//	Search for Freighter "from", if not found, end.
		//
		//
		let index_of_Freighter_from = search_for_index_of_Freighter_with_ending_code (
			consenter_address,
			Voht_Endings::Ending_the_thrower_has_not_joined_the_game ()
		);
		
		let index_of_Freighter_to = search_for_index_of_Freighter_with_ending_code (
			other_address_of_freighter,
			Voht_Endings::Ending_the_catcher_has_not_joined_the_game ()
		);
		
		// let index_of_Freighter_to = search_for_index_of_Freighter (other_address_of_freighter);
		let sport = borrow_global_mut<Sport>(owner_position ());
		let Freighters = &mut sport.Freighters;
		
		let Freighter_from_ref = vector::borrow_mut (Freighters, index_of_Freighter_from);
		Voht_Freighter::subtract_Vohts (Freighter_from_ref, 1);	

		let Freighter_to_ref = vector::borrow_mut (Freighters, index_of_Freighter_to);		
		Voht_Freighter::add_Vohts (Freighter_to_ref, 1);		
	}
	
	
	public fun search_for_index_of_Freighter (address_of_freighter : address) : u64 acquires Sport {
		search_for_index_of_Freighter_with_ending_code (address_of_freighter, Ending_Freighter_was_not_found)
	}
	
	public fun search_for_index_of_Freighter_with_ending_code (
		address_of_freighter : address,
		ending_code : u64
	) : u64 acquires Sport {
		let sport = borrow_global_mut<Sport>(owner_position ());
		let Freighters = &mut sport.Freighters;
		for (index in 0..vector::length (Freighters)) {
			let Freighter_at_index_ref = vector::borrow_mut (Freighters, index);
			let Freighter_at_index_address = Voht_Freighter::address_of_freighter (Freighter_at_index_ref);
			if (Freighter_at_index_address == address_of_freighter) {
				return index
			}			
		};
		
		abort ending_code
	}
	
	public fun Freighter_has_joined_the_sport (address_of_freighter : address) : String acquires Sport {
		let sport = borrow_global<Sport>(owner_position ());
		let Freighters = & sport.Freighters;
		for (index in 0..vector::length (Freighters)) {
			let Freighter_at_index_ref = vector::borrow (& sport.Freighters, index);
			let Freighter_at_index_address = Voht_Freighter::address_of_freighter (Freighter_at_index_ref);
			if (Freighter_at_index_address == address_of_freighter) {
				return utf8 (b"yup")
			}			
		};
		
		utf8 (b"no")
	}
	

	#[view]
	public fun Tiny_Water_Balloons_Score (address_of_freighter : address) : u256 acquires Sport {
		let index_of_Freighter = search_for_index_of_Freighter (address_of_freighter);
		let sport = borrow_global<Sport>(owner_position ());
		let Freighters = & sport.Freighters;
		let Freighter_at_index_ref = vector::borrow (
			Freighters, 
			index_of_Freighter
		);
		
		Voht_Freighter::Vohts_score (Freighter_at_index_ref)
	}
	
}