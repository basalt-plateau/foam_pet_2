


module builder_1::Mascot_Module {
	friend builder_1::Mix_Venue_Module;
	
	use std::string::{ String };
	
	use builder_1::Rules_09;

	const Ending_from_mascot_has_zero_tiny_water_balloons : u64 = 3;
	const Ending_mascot_was_not_found : u64 = 3;


	#[view]
	public fun Volitions () : String {
		Rules_09::Volitions_01 ()
	}
	
	struct Mascot has store, drop {
		address : address,
		tiny_water_balloons : u256
	}
	
	public (friend) fun add (address : address) : Mascot {
		let mascot = Mascot {
			address : address,
			tiny_water_balloons : 0
		};
		mascot
	}
	
	public (friend) fun mascot_address (mascot : & Mascot) : address {
		mascot.address
	}
	
	public (friend) fun add_tiny_water_balloons (
		mascot : &mut Mascot, 
		add : u256
	) {
		mascot.tiny_water_balloons = mascot.tiny_water_balloons + add;
	}
	
	public (friend) fun subtract_tiny_water_balloons (
		mascot : &mut Mascot, 
		subtract : u256
	) {
		if (mascot.tiny_water_balloons == 0) {
			abort Ending_from_mascot_has_zero_tiny_water_balloons
		};
		
		mascot.tiny_water_balloons = mascot.tiny_water_balloons - subtract;
	}
	
	public (friend) fun throw_tiny_water_balloon (
		from_mascot : &mut Mascot, 
		to_mascot : &mut Mascot
	) {
		if (from_mascot.tiny_water_balloons == 0) {
			abort Ending_from_mascot_has_zero_tiny_water_balloons
		};
		
		from_mascot.tiny_water_balloons = from_mascot.tiny_water_balloons - 1;
		to_mascot.tiny_water_balloons = to_mascot.tiny_water_balloons + 1;
	}
	
	public (friend) fun tiny_water_balloons_score (mascot : & Mascot) : u256 {
		mascot.tiny_water_balloons
	}
}