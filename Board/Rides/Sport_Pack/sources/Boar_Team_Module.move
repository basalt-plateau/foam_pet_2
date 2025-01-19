


module builder_1::Boar_Team_Module {
	friend builder_1::Boar_Game_Module;
	
	use std::string::{ String };
	
	const Ending_from_boar_Team_has_zero_votes : u64 = 3;
	const Ending_boar_Team_was_not_found : u64 = 3;
	
	
	#[view] public fun Volitions () : String { 
		use ride::Rules_10;
		Rules_10::Volitions_01 () 
	}
	
	struct Boar_Team has store, drop {
		address : address,
		votes : u256
	}
	
	public (friend) fun add (address : address) : Boar_Team {
		let boar_Team = Boar_Team {
			address : address,
			votes : 0
		};
		boar_Team
	}
	
	public (friend) fun boar_Team_address (boar_Team : & Boar_Team) : address {
		boar_Team.address
	}
	
	public (friend) fun add_votes (
		boar_Team : &mut Boar_Team, 
		add : u256
	) {
		boar_Team.votes = boar_Team.votes + add;
	}
	
	public (friend) fun subtract_votes (
		boar_Team : &mut Boar_Team, 
		subtract : u256
	) {
		if (boar_Team.votes == 0) {
			abort Ending_from_boar_Team_has_zero_votes
		};
		
		boar_Team.votes = boar_Team.votes - subtract;
	}
	
	public (friend) fun throw_vote (
		from_boar_Team : &mut Boar_Team, 
		to_boar_Team : &mut Boar_Team
	) {
		if (from_boar_Team.votes == 0) {
			abort Ending_from_boar_Team_has_zero_votes
		};
		
		from_boar_Team.votes = from_boar_Team.votes - 1;
		to_boar_Team.votes = to_boar_Team.votes + 1;
	}
	
	public (friend) fun votes_score (boar_Team : & Boar_Team) : u256 {
		boar_Team.votes
	}
}