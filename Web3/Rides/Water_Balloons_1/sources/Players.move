


module builder_1::Water_Balloons_1_Players {
	friend builder_1::Water_Balloons_1_Sport;
	
	use std::string::{ String };
	
	use builder_1::Rules_09;

	const Ending_from_player_has_zero_water_balloons : u64 = 3;
	const Ending_player_was_not_found : u64 = 3;


	#[view]
	public fun Volitions () : String {
		Rules_09::Volitions_01 ()
	}
	
	struct Player has store, drop {
		address : address,
		water_balloons : u256
	}
	
	public fun add (address : address) : Player {
		let player = Player {
			address : address,
			water_balloons : 0
		};
		player
	}
	
	public fun player_address (player : & Player) : address {
		player.address
	}
	
	public fun add_water_balloons (
		player : &mut Player, 
		add : u256
	) {
		player.water_balloons = player.water_balloons + add;
	}
	
	public fun subtract_water_balloons (
		player : &mut Player, 
		subtract : u256
	) {
		if (player.water_balloons == 0) {
			abort Ending_from_player_has_zero_water_balloons
		};
		
		player.water_balloons = player.water_balloons - subtract;
	}
	
	public fun throw_water_balloon (
		from_player : &mut Player, 
		to_player : &mut Player
	) {
		if (from_player.water_balloons == 0) {
			abort Ending_from_player_has_zero_water_balloons
		};
		
		from_player.water_balloons = from_player.water_balloons - 1;
		to_player.water_balloons = to_player.water_balloons + 1;
	}
	
	public fun water_balloons_score (player : & Player) : u256 {
		player.water_balloons
	}
	
}