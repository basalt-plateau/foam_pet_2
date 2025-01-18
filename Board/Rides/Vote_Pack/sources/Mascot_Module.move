


module builder_1::Mascot_Module {
	friend builder_1::Venue_Module;
	
	use std::string::{ String };
	
	const Ending_from_mascot_has_zero_votes : u64 = 3;
	const Ending_mascot_was_not_found : u64 = 3;
	
	
	#[view] public fun Volitions () : String { 
		use ride::Rules_10;
		Rules_10::Volitions_01 () 
	}
	
	struct Mascot has store, drop {
		address : address,
		votes : u256
	}
	
	public (friend) fun add (address : address) : Mascot {
		let mascot = Mascot {
			address : address,
			votes : 0
		};
		mascot
	}
	
	public (friend) fun mascot_address (mascot : & Mascot) : address {
		mascot.address
	}
	
	public (friend) fun add_votes (
		mascot : &mut Mascot, 
		add : u256
	) {
		mascot.votes = mascot.votes + add;
	}
	
	public (friend) fun subtract_votes (
		mascot : &mut Mascot, 
		subtract : u256
	) {
		if (mascot.votes == 0) {
			abort Ending_from_mascot_has_zero_votes
		};
		
		mascot.votes = mascot.votes - subtract;
	}
	
	public (friend) fun throw_vote (
		from_mascot : &mut Mascot, 
		to_mascot : &mut Mascot
	) {
		if (from_mascot.votes == 0) {
			abort Ending_from_mascot_has_zero_votes
		};
		
		from_mascot.votes = from_mascot.votes - 1;
		to_mascot.votes = to_mascot.votes + 1;
	}
	
	public (friend) fun votes_score (mascot : & Mascot) : u256 {
		mascot.votes
	}
}