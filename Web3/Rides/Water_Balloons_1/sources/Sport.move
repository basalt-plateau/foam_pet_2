


module builder_1::Water_Balloons_1_Sport {
	
	use std::vector;
	use std::string::{ String, utf8 };
	use std::signer;

	use aptos_framework::coin;
	use aptos_framework::aptos_coin::AptosCoin;

	use builder_1::Rules_09;
	
	use builder_1::Water_Balloons_1_Players::{ Self, Player };
	use builder_1::Water_Balloons_1_Owner::{ owner_position, ask_if_consenter_is_owner };

	const Imperfection_consenter_has_not_joined : u64 = 0;
	const Imperfection_consenter_is_not_owner : u64 = 1;
	const Imperfection_consenter_does_not_have_enough_APT_for_purchase : u64 = 2;
	const Ending_player_was_not_found : u64 = 3;

	#[view]
	public fun Volitions () : String {
		Rules_09::Volitions_01 ()
	}
	
	struct Water_Balloon has key, drop {}
	struct Sport has key, drop {
		players: vector<Player>
	}
	
	
	public entry fun Begin (consenter : & signer) {
		if (ask_if_consenter_is_owner (consenter) != utf8 (b"yup")) { 
			abort Imperfection_consenter_is_not_owner 
		};
		
		//
		//	Check if the consenter is the producer.
		//
		//
		let sport = Sport {
			players: vector::empty<Player>()
		};
		
		move_to<Sport>(consenter, sport)
	}
	public entry fun End (consenter : & signer) {
		//
		//	Check if is after 2250
		//
		//
		
		
	}
	
	
	public entry fun Join (consenter : & signer) acquires Sport {
		let consenter_address = signer::address_of (consenter);
		
		let sport = borrow_global_mut<Sport>(owner_position ());
		let players = &mut sport.players;
		let player = Water_Balloons_1_Players::add (consenter_address);
		vector::push_back (players, player);		
	}
		
	
	public entry fun Buy_5_water_balloons_for_1_APT (consenter : & signer) acquires Sport {
		
		//
		//
		//	Check if the consenter has joined the sport as a player.
		//
		//
		let consenter_address = signer::address_of (consenter);
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
		//	Send 1 APT to the owner
		//
		//
		coin::transfer<AptosCoin>(consenter, owner_position (), 100000000);
		
		
		//
		//
		//	Send 5 Water Balloons
		//
		//
		let water_balloons_to_add : u256 = 5;
		let player_index = search_for_player (consenter_address);
		
		
		let sport = borrow_global_mut<Sport>(owner_position ());
		let players = &mut sport.players;
		let player_at_index_ref = vector::borrow_mut (players, player_index);
		
		
		
		
		//Water_Balloons_1_Players::add_water_balloons (consenter, water_balloons_to_add);		
		// coin::transfer<AptosCoin>(& consenter, player_01_position, 500);
		// coin::transfer<AptosCoin>(& consenter, owner_position (), 500);
	}
	
	
	public fun search_for_player (player_address : address) : u64 acquires Sport {
		let sport = borrow_global_mut<Sport>(owner_position ());
		let players = &mut sport.players;
		for (index in 0..vector::length (players)) {
			let player_at_index_ref = vector::borrow_mut (players, index);
			let player_at_index_address = Water_Balloons_1_Players::player_address (player_at_index_ref);
			if (player_at_index_address == player_address) {
				return index
			}			
		};
		
		abort Ending_player_was_not_found
	}
	
	public fun player_has_joined_the_sport (player_address : address) : String acquires Sport {
		let sport = borrow_global<Sport>(owner_position ());
		let players = & sport.players;
		for (index in 0..vector::length (players)) {
			let player_at_index_ref = vector::borrow (& sport.players, index);
			let player_at_index_address = Water_Balloons_1_Players::player_address (player_at_index_ref);
			if (player_at_index_address == player_address) {
				return utf8 (b"yup")
			}			
		};
		
		utf8 (b"no")
	}
	
	
	
}