


module builder_1::Digital_Hydro_Balloons_1_Sport {
	
	use std::vector;
	use std::string::{ String, utf8 };
	use std::signer;

	use aptos_framework::coin;
	use aptos_framework::aptos_coin::AptosCoin;

	use builder_1::Rules_09;
	
	use builder_1::Digital_Hydro_Balloons_1_Players::{ Self, Player };
	use builder_1::Digital_Hydro_Balloons_1_Owner::{ owner_position, ask_if_consenter_is_owner };
	use builder_1::Digital_Hydro_Balloons_1_Endings;

	const Imperfection_consenter_has_not_joined : u64 = 0;
	const Imperfection_consenter_is_not_owner : u64 = 1;
	const Imperfection_consenter_does_not_have_enough_APT_for_purchase : u64 = 2;
	const Ending_player_was_not_found : u64 = 3;
	const Ending_every_digital_hydro_balloon_has_been_sold : u64 = 3;

	#[view]
	public fun Volitions () : String {
		Rules_09::Volitions_01 ()
	}
	
	struct Digital_Hydro_Balloon has key, drop {}
	
	struct Sport has key, drop {
		digital_hydro_balloons_for_sale : u256,
		players : vector<Player>
	}
	
	#[view]
	public fun Digital_Hydro_Balloons_For_Sale_Left () : u256 acquires Sport {
		let sport = borrow_global<Sport>(owner_position ());
		sport.digital_hydro_balloons_for_sale
	}
	
	public entry fun Begin (
		consenter : & signer,
		digital_hydro_balloons_for_sale : u256
	) {
		if (ask_if_consenter_is_owner (consenter) != utf8 (b"yup")) { 
			abort Imperfection_consenter_is_not_owner 
		};
		
		//
		//	Check if the consenter is the producer.
		//
		//
		let sport = Sport {
			digital_hydro_balloons_for_sale : digital_hydro_balloons_for_sale,
			players : vector::empty<Player>()
		};
		
		move_to<Sport>(consenter, sport)
	}
	
	
	public entry fun End (consenter : & signer) {
		//
		//	Check if is after 2250 = 30 + 250 = 280
		//
		//
		// 1000 * 60 * 60 * 24 * 365.25
		let year : u64 = 31557600000 * 280;
		// year * years
	}
	
	
	public entry fun Join (consenter : & signer) acquires Sport {
		let consenter_address = signer::address_of (consenter);
		
		let sport = borrow_global_mut<Sport>(owner_position ());
		let players = &mut sport.players;
		let player = Digital_Hydro_Balloons_1_Players::add (consenter_address);
		vector::push_back (players, player);		
	}
		
	
	public entry fun Buy_5_digital_hydro_balloons_for_1_APT (consenter : & signer) acquires Sport {
		let consenter_address = signer::address_of (consenter);
		
		
		//
		//
		//	Check if the consenter has joined the sport as a player.
		//
		//
		if (player_has_joined_the_sport (consenter_address) != utf8 (b"yup")) { 
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
		if (sport.digital_hydro_balloons_for_sale < 5) {
			abort Digital_Hydro_Balloons_1_Endings::Ending_there_are_not_enough_digital_hydro_balloons_left_to_make_that_sale ()
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
		let digital_hydro_balloons_to_add : u256 = 5;
		let player_index = search_for_index_of_player (consenter_address);
		let sport = borrow_global_mut<Sport>(owner_position ());
		let players = &mut sport.players;
		let player_at_index_ref = vector::borrow_mut (players, player_index);
		
		Digital_Hydro_Balloons_1_Players::add_digital_hydro_balloons (player_at_index_ref, digital_hydro_balloons_to_add);	
		
		
		//
		//
		//	Subtract 5 Water Balloons from for sale
		//
		//
		sport.digital_hydro_balloons_for_sale = sport.digital_hydro_balloons_for_sale - 5;
		
		// coin::transfer<AptosCoin>(& consenter, player_01_position, 500);
		// coin::transfer<AptosCoin>(& consenter, owner_position (), 500);
	}
	
	public entry fun Throw_Digital_Hydro_Balloon (
		consenter : & signer, 
		other_player_address : address
	) acquires Sport {
		let consenter_address = signer::address_of (consenter);
		
		//
		//	Search for player "from", if not found, end.
		//
		//
		let index_of_player_from = search_for_index_of_player_with_ending_code (
			consenter_address,
			Digital_Hydro_Balloons_1_Endings::Ending_the_thrower_has_not_joined_the_game ()
		);
		
		let index_of_player_to = search_for_index_of_player_with_ending_code (
			other_player_address,
			Digital_Hydro_Balloons_1_Endings::Ending_the_catcher_has_not_joined_the_game ()
		);
		
		// let index_of_player_to = search_for_index_of_player (other_player_address);
		let sport = borrow_global_mut<Sport>(owner_position ());
		let players = &mut sport.players;
		
		let player_from_ref = vector::borrow_mut (players, index_of_player_from);
		Digital_Hydro_Balloons_1_Players::subtract_digital_hydro_balloons (player_from_ref, 1);	

		let player_to_ref = vector::borrow_mut (players, index_of_player_to);		
		Digital_Hydro_Balloons_1_Players::add_digital_hydro_balloons (player_to_ref, 1);		
	}
	
	
	public fun search_for_index_of_player (player_address : address) : u64 acquires Sport {
		search_for_index_of_player_with_ending_code (player_address, Ending_player_was_not_found)
	}
	
	public fun search_for_index_of_player_with_ending_code (
		player_address : address,
		ending_code : u64
	) : u64 acquires Sport {
		let sport = borrow_global_mut<Sport>(owner_position ());
		let players = &mut sport.players;
		for (index in 0..vector::length (players)) {
			let player_at_index_ref = vector::borrow_mut (players, index);
			let player_at_index_address = Digital_Hydro_Balloons_1_Players::player_address (player_at_index_ref);
			if (player_at_index_address == player_address) {
				return index
			}			
		};
		
		abort ending_code
	}
	
	public fun player_has_joined_the_sport (player_address : address) : String acquires Sport {
		let sport = borrow_global<Sport>(owner_position ());
		let players = & sport.players;
		for (index in 0..vector::length (players)) {
			let player_at_index_ref = vector::borrow (& sport.players, index);
			let player_at_index_address = Digital_Hydro_Balloons_1_Players::player_address (player_at_index_ref);
			if (player_at_index_address == player_address) {
				return utf8 (b"yup")
			}			
		};
		
		utf8 (b"no")
	}
	

	#[view]
	public fun Digital_Hydro_Balloons_Score (player_address : address) : u256 acquires Sport {
		let index_of_player = search_for_index_of_player (player_address);
		let sport = borrow_global<Sport>(owner_position ());
		let players = & sport.players;
		let player_at_index_ref = vector::borrow (
			players, 
			index_of_player
		);
		
		Digital_Hydro_Balloons_1_Players::digital_hydro_balloons_score (player_at_index_ref)
	}
	
}