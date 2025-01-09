


module builder_1::Water_Balloons_1_Players {
	
	use std::signer;
	use std::string::{ String, utf8 };
	
	use builder_1::Rules_09;
	
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
	
}