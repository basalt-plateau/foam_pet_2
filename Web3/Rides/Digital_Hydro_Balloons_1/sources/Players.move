


module builder_1::Digital_Hydro_Balloons_1_Players {
	friend builder_1::Digital_Hydro_Balloons_1_Sport;
	
	use std::string::{ String };
	
	use builder_1::Rules_09;

	const Ending_from_player_has_zero_digital_hydro_balloons : u64 = 3;
	const Ending_player_was_not_found : u64 = 3;


	#[view]
	public fun Volitions () : String {
		Rules_09::Volitions_01 ()
	}
	
	struct Player has store, drop {
		address : address,
		digital_hydro_balloons : u256
	}
	
	public (friend) fun add (address : address) : Player {
		let player = Player {
			address : address,
			digital_hydro_balloons : 0
		};
		player
	}
	
	public (friend) fun player_address (player : & Player) : address {
		player.address
	}
	
	public (friend) fun add_digital_hydro_balloons (
		player : &mut Player, 
		add : u256
	) {
		player.digital_hydro_balloons = player.digital_hydro_balloons + add;
	}
	
	public (friend) fun subtract_digital_hydro_balloons (
		player : &mut Player, 
		subtract : u256
	) {
		if (player.digital_hydro_balloons == 0) {
			abort Ending_from_player_has_zero_digital_hydro_balloons
		};
		
		player.digital_hydro_balloons = player.digital_hydro_balloons - subtract;
	}
	
	public (friend) fun throw_digital_hydro_balloon (
		from_player : &mut Player, 
		to_player : &mut Player
	) {
		if (from_player.digital_hydro_balloons == 0) {
			abort Ending_from_player_has_zero_digital_hydro_balloons
		};
		
		from_player.digital_hydro_balloons = from_player.digital_hydro_balloons - 1;
		to_player.digital_hydro_balloons = to_player.digital_hydro_balloons + 1;
	}
	
	public (friend) fun digital_hydro_balloons_score (player : & Player) : u256 {
		player.digital_hydro_balloons
	}
	
}