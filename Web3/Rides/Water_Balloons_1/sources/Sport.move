


module builder_1::Water_Balloons_1_Sport {
	
	use std::signer;
	use std::string::{ String, utf8 };
	use std::vector;

	use builder_1::Rules_09;
	
	use builder_1::Water_Balloons_1_Players::{ Self, Player };
	use builder_1::Water_Balloons_1_Owner::{ owner_position, ask_if_consenter_is_owner };


	#[view]
	public fun Volitions () : String {
		Rules_09::Volitions_01 ()
	}
	
	struct Water_Balloon has key, drop {}
	struct Sport has key, drop {
		players: vector<Player>
	}
	
	
	public entry fun Begin (consenter : & signer) {
		if (ask_if_consenter_is_owner (consenter) != utf8 (b"yup")) { abort 9502 };
		
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
		
	
	public entry fun Buy_5_water_balloons_for_1_APT (consenter : & signer) {
		//
		//	Check if the consenter is a player.
		//
		//
		
		// coin::transfer<AptosCoin>(& consenter, player_01_position, 500);
		
		
	}
	
	fun has_joined_the_sport () {
		
	}
	
	
	
}