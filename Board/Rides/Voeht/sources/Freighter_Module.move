


module builder_1::Freighter_Module {
	friend builder_1::Void_Freight_Group_Module;
	
	use std::string::{ String };
	
	use builder_1::Rules_09;

	const Ending_from_player_has_zero_tiny_water_balloons : u64 = 3;
	const Ending_player_was_not_found : u64 = 3;


	#[view]
	public fun Volitions () : String {
		Rules_09::Volitions_01 ()
	}
	
	struct Player has store, drop {
		address : address,
		tiny_water_balloons : u256
	}
	
	public (friend) fun add (address : address) : Player {
		let player = Player {
			address : address,
			tiny_water_balloons : 0
		};
		player
	}
	
	public (friend) fun player_address (player : & Player) : address {
		player.address
	}
	
	public (friend) fun add_tiny_water_balloons (
		player : &mut Player, 
		add : u256
	) {
		player.tiny_water_balloons = player.tiny_water_balloons + add;
	}
	
	public (friend) fun subtract_tiny_water_balloons (
		player : &mut Player, 
		subtract : u256
	) {
		if (player.tiny_water_balloons == 0) {
			abort Ending_from_player_has_zero_tiny_water_balloons
		};
		
		player.tiny_water_balloons = player.tiny_water_balloons - subtract;
	}
	
	public (friend) fun throw_tiny_water_balloon (
		from_player : &mut Player, 
		to_player : &mut Player
	) {
		if (from_player.tiny_water_balloons == 0) {
			abort Ending_from_player_has_zero_tiny_water_balloons
		};
		
		from_player.tiny_water_balloons = from_player.tiny_water_balloons - 1;
		to_player.tiny_water_balloons = to_player.tiny_water_balloons + 1;
	}
	
	public (friend) fun tiny_water_balloons_score (player : & Player) : u256 {
		player.tiny_water_balloons
	}
}