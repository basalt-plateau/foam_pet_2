




module builder_1::Boar_Game_Module {
	
	use std::vector;
	use std::string::{ String, utf8 };
	use std::signer;

	use aptos_framework::timestamp;
	use aptos_framework::coin;
	use aptos_framework::aptos_coin::AptosCoin;
	
	use builder_1::Boar_Team_Module::{ Self, Boar_Team };
	use builder_1::Boar_Producer_Module::{ 
		boar_Producer_position, 
		ask_if_consenter_is_Boar_Producer 
	};
	use builder_1::Endings_Module;
	
	const Imperfection_consenter_has_not_joined : u64 = 0;
	const Imperfection_consenter_is_not_Boar_Producer : u64 = 1;
	const Imperfection_consenter_does_not_have_enough_APT_for_purchase : u64 = 2;
	const Ending_boar_Team_was_not_found : u64 = 3;
	const Ending_every_boar_Planet_IV_has_been_sold : u64 = 3;
	const Ending_cannot_exit_the_game_if_have_plays : u64 = 3;
	
	struct Boar_Planet_IV has key, drop {}
	
	struct Boar_Game has key, drop {
		boar_Planet_IVs_for_sale : u256,
		boar_Teams : vector<Boar_Team>
	}
	
	#[view] public fun Volitions () : String { 
		use ride::Rules_10;
		Rules_10::Volitions_01 () 
	}
	
	
	////
	//
	//	Boar_Game
	//
	//
	public entry fun Build (
		consenter : & signer,
		boar_Planet_IVs_for_sale : u256
	) {
		//
		//	Make sure the consenter is the Boar_Producer.
		//
		//
		if (ask_if_consenter_is_Boar_Producer (consenter) != utf8 (b"yup")) { 
			abort Imperfection_consenter_is_not_Boar_Producer 
		};

		let boar_Boar_Game = Boar_Game {
			boar_Planet_IVs_for_sale : boar_Planet_IVs_for_sale,
			boar_Teams : vector::empty<Boar_Team>()
		};
		
		move_to<Boar_Game>(consenter, boar_Boar_Game)
	}
	#[view] public fun is_boar_Boar_Game_built () : String {
		if (exists<Boar_Game>(boar_Producer_position ())) {
			return utf8 (b"yup")
		};
		
		utf8 (b"no")
	}
	#[view] public fun End () : String acquires Boar_Game {
		// public entry fun End (consenter : & signer) acquires Boar_Game {
		//
		//	Check if is after 2250 = 30 + 250 = 280
		//
		//
		// 1000 * 60 * 60 * 24 * 365.25
		let can_end_after : u64 = 31557600000 * 280;
		if (timestamp::now_microseconds () <= can_end_after) {
			abort Endings_Module::Ending_cannot_end_yet ()
		};
		
		move_from<Boar_Game>(boar_Producer_position ());
		
		is_boar_Boar_Game_built ()
	}
	//
	////
	
	
	////
	//
	//	Boar_Teams:
	//		Join_the_Boar_Game
	//		Boar_Team_Count
	//		Boar_Team_Roster
	//
	//		search_for_index_of_boar_Team
	//		search_for_index_of_boar_Team_with_ending_code
	//		boar_Team_has_joined_the_sport
	//
	public entry fun Join_the_Boar_Game (consenter : & signer) acquires Boar_Game {
		let consenter_address = signer::address_of (consenter);
		
		let sport = borrow_global_mut<Boar_Game>(boar_Producer_position ());
		let boar_Teams = &mut sport.boar_Teams;
		let boar_Team = Boar_Team_Module::add (consenter_address);
		vector::push_back (boar_Teams, boar_Team);		
	}
	public entry fun Exit_the_Boar_Game (consenter : & signer) acquires Boar_Game {
		let consenter_address = signer::address_of (consenter);
		
		let index = search_for_index_of_boar_Team (consenter_address);
		
		let boar_Game = borrow_global_mut<Boar_Game>(boar_Producer_position ());
		let boar_Teams = &mut boar_Game.boar_Teams;
		let boar_Team_at_index_ref = vector::borrow_mut (boar_Teams, index);
		
		if (Boar_Team_Module::boar_Planet_IVs_score (boar_Team_at_index_ref) != 0) {
			abort Ending_cannot_exit_the_game_if_have_plays
		};
		
		vector::remove (boar_Teams, index);
	}
	
	#[view] public fun Boar_Team_Count () : u64 acquires Boar_Game {
		let sport = borrow_global<Boar_Game>(boar_Producer_position ());
		vector::length (&sport.boar_Teams)
	}
	#[view] public fun Boar_Team_Roster () : String acquires Boar_Game {
		// in development
		
		let sport = borrow_global<Boar_Game>(boar_Producer_position ());
		let bracket = vector::empty<u8>();	
		let num_boar_Teams = vector::length(&sport.boar_Teams);
		
		
		utf8 (b"")
	}
	
	public fun search_for_index_of_boar_Team (boar_Team_address : address) : u64 acquires Boar_Game {
		search_for_index_of_boar_Team_with_ending_code (boar_Team_address, Ending_boar_Team_was_not_found)
	}
	public fun search_for_index_of_boar_Team_with_ending_code (
		boar_Team_address : address,
		ending_code : u64
	) : u64 acquires Boar_Game {
		let sport = borrow_global_mut<Boar_Game>(boar_Producer_position ());
		let boar_Teams = &mut sport.boar_Teams;
		for (index in 0..vector::length (boar_Teams)) {
			let boar_Team_at_index_ref = vector::borrow_mut (boar_Teams, index);
			let boar_Team_at_index_address = Boar_Team_Module::boar_Team_address (boar_Team_at_index_ref);
			if (boar_Team_at_index_address == boar_Team_address) {
				return index
			}			
		};
		
		abort ending_code
	}
	
	public fun boar_Team_has_joined_the_sport (boar_Team_address : address) : String acquires Boar_Game {
		let sport = borrow_global<Boar_Game>(boar_Producer_position ());
		let boar_Teams = & sport.boar_Teams;
		for (index in 0..vector::length (boar_Teams)) {
			let boar_Team_at_index_ref = vector::borrow (& sport.boar_Teams, index);
			let boar_Team_at_index_address = Boar_Team_Module::boar_Team_address (boar_Team_at_index_ref);
			if (boar_Team_at_index_address == boar_Team_address) {
				return utf8 (b"yup")
			}			
		};
		
		utf8 (b"no")
	}
	//
	////
	
	////
	//
	//	Boar_Planet_IVs
	//
	//
	#[view] public fun Boar_Planet_IVs_For_Sale_Left () : u256 acquires Boar_Game {
		let sport = borrow_global<Boar_Game>(boar_Producer_position ());
		sport.boar_Planet_IVs_for_sale
	}
	public entry fun Buy_Boar_Planet_IVs_for_1_APT_each (
		consenter : & signer,
		amount_of_plays_to_buy : u256
	) acquires Boar_Game {
		let consenter_address = signer::address_of (consenter);
		
		let octas_per_APT : u256 = 100000000;
		
		let price_in_Octas_u256 : u256 = amount_of_plays_to_buy * octas_per_APT;
		let price_in_Octas_u64 = (price_in_Octas_u256 as u64);
		
		//
		//	Vows:
		//		1. Vow that the consenter has joined the sport as a boar_Team.
		//		2. Vow that the consenter has greater than 1 * "amount_of_plays_to_buy" APT.
		//		3. Vow that there are enough boar_Planet_IVs left for sale.
		//
		if (boar_Team_has_joined_the_sport (consenter_address) != utf8 (b"yup")) { 
			abort Imperfection_consenter_has_not_joined 
		};
		if (coin::balance<AptosCoin>(consenter_address) < price_in_Octas_u64) { 
			abort Imperfection_consenter_does_not_have_enough_APT_for_purchase 
		};
		let sport = borrow_global<Boar_Game>(boar_Producer_position ());
		if (sport.boar_Planet_IVs_for_sale < amount_of_plays_to_buy) {
			abort Endings_Module::Ending_there_are_not_enough_boar_Planet_IVs_left_to_make_that_sale ()
		};
		
		//
		//
		//	Send the APT to the Boar_Producer
		//
		//
		coin::transfer<AptosCoin>(consenter, boar_Producer_position (), price_in_Octas_u64);
		
		
		//
		//
		//	Send "amount_of_plays_to_buy"
		//
		//
		let boar_Team_index = search_for_index_of_boar_Team (consenter_address);
		let sport = borrow_global_mut<Boar_Game>(boar_Producer_position ());
		let boar_Teams = &mut sport.boar_Teams;
		let boar_Team_at_index_ref = vector::borrow_mut (boar_Teams, boar_Team_index);
		
		Boar_Team_Module::add_boar_Planet_IVs (boar_Team_at_index_ref, amount_of_plays_to_buy);	
		
		
		//
		//
		//	Subtract "amount_of_plays_to_buy" Water Balloons from for sale
		//
		//
		sport.boar_Planet_IVs_for_sale = sport.boar_Planet_IVs_for_sale - amount_of_plays_to_buy;
	}
	
	
	public entry fun Throw_Boar_Planet_IV (
		consenter : & signer, 
		other_boar_Team_address : address
	) acquires Boar_Game {
		let consenter_address = signer::address_of (consenter);
		
		//
		//	Search for boar_Team "from", if not found, end.
		//
		//
		let index_of_boar_Team_from = search_for_index_of_boar_Team_with_ending_code (
			consenter_address,
			Endings_Module::Ending_the_thrower_has_not_joined_the_game ()
		);
		
		let index_of_boar_Team_to = search_for_index_of_boar_Team_with_ending_code (
			other_boar_Team_address,
			Endings_Module::Ending_the_catcher_has_not_joined_the_game ()
		);
		
		// let index_of_boar_Team_to = search_for_index_of_boar_Team (other_boar_Team_address);
		let sport = borrow_global_mut<Boar_Game>(boar_Producer_position ());
		let boar_Teams = &mut sport.boar_Teams;
		
		let boar_Team_from_ref = vector::borrow_mut (boar_Teams, index_of_boar_Team_from);
		Boar_Team_Module::subtract_boar_Planet_IVs (boar_Team_from_ref, 1);	

		let boar_Team_to_ref = vector::borrow_mut (boar_Teams, index_of_boar_Team_to);		
		Boar_Team_Module::add_boar_Planet_IVs (boar_Team_to_ref, 1);		
	}
	
	
	
	

	#[view]
	public fun Boar_Planet_IVs_Score (boar_Team_address : address) : u256 acquires Boar_Game {
		let index_of_boar_Team = search_for_index_of_boar_Team (boar_Team_address);
		let sport = borrow_global<Boar_Game>(boar_Producer_position ());
		let boar_Teams = & sport.boar_Teams;
		let boar_Team_at_index_ref = vector::borrow (
			boar_Teams, 
			index_of_boar_Team
		);
		
		Boar_Team_Module::boar_Planet_IVs_score (boar_Team_at_index_ref)
	}
	
}