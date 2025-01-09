


module builder_1::Water_Balloons_1_Players {
	
	use std::signer;
	use std::string::{ String, utf8 };
	
	use builder_1::Rules_09;
	
	#[view]
	public fun Volitions () : String {
		Rules_09::Volitions_01 ()
	}
	
	struct Player has store, drop {
		address : address
	}
	
	public fun add (address : address) : Player {
		let player = Player {
			address : address
		};
		player
	}
	
	
	
}