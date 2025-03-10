


module builder_1::Boar_Team_Module {
	friend builder_1::Boar_Game_Module;
	
	use std::string::{ String };
	
	const Ending_from_boar_Team_has_zero_boar_Planet_IVs : u64 = 3;
	const Ending_boar_Team_was_not_found : u64 = 3;
	
	
	#[view] public fun Volitions () : String { 
		use ride::Rules_10;
		Rules_10::Volitions_01 () 
	}
	
	struct Boar_Team has store, drop {
		address : address,
		boar_Planet_IVs : u256
	}
	
	public (friend) fun add (address : address) : Boar_Team {
		let boar_Team = Boar_Team {
			address : address,
			boar_Planet_IVs : 0
		};
		boar_Team
	}
	
	public (friend) fun boar_Team_address (boar_Team : & Boar_Team) : address {
		boar_Team.address
	}
	
	public (friend) fun add_boar_Planet_IVs (
		boar_Team : &mut Boar_Team, 
		add : u256
	) {
		boar_Team.boar_Planet_IVs = boar_Team.boar_Planet_IVs + add;
	}
	public (friend) fun subtract_boar_Planet_IVs (
		boar_Team : &mut Boar_Team, 
		subtract : u256
	) {
		if (boar_Team.boar_Planet_IVs == 0) {
			abort Ending_from_boar_Team_has_zero_boar_Planet_IVs
		};
		
		boar_Team.boar_Planet_IVs = boar_Team.boar_Planet_IVs - subtract;
	}
	
	public (friend) fun throw_boar_Planet_IV (
		from_boar_Team : &mut Boar_Team, 
		to_boar_Team : &mut Boar_Team
	) {
		if (from_boar_Team.boar_Planet_IVs == 0) {
			abort Ending_from_boar_Team_has_zero_boar_Planet_IVs
		};
		
		from_boar_Team.boar_Planet_IVs = from_boar_Team.boar_Planet_IVs - 1;
		to_boar_Team.boar_Planet_IVs = to_boar_Team.boar_Planet_IVs + 1;
	}
	
	public (friend) fun boar_Planet_IVs_score (boar_Team : & Boar_Team) : u256 {
		boar_Team.boar_Planet_IVs
	}
}