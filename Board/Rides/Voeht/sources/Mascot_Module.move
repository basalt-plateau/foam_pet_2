


module builder_1::Mascot_Module {
	friend builder_1::Venue_Module;
	
	use std::string::{ String };
	
	const Ending_from_mascot_has_zero_vohts : u64 = 3;
	const Ending_mascot_was_not_found : u64 = 3;
	
	
	#[view] public fun Volitions () : String { 
		use ride::Rules_10;
		Rules_10::Volitions_01 () 
	}
	
	struct Mascot has store, drop {
		address : address,
		vohts : u256
	}
	
	public (friend) fun add (address : address) : Mascot {
		let mascot = Mascot {
			address : address,
			vohts : 0
		};
		mascot
	}
	
	public (friend) fun mascot_address (mascot : & Mascot) : address {
		mascot.address
	}
	
	public (friend) fun add_vohts (
		mascot : &mut Mascot, 
		add : u256
	) {
		mascot.vohts = mascot.vohts + add;
	}
	
	public (friend) fun subtract_vohts (
		mascot : &mut Mascot, 
		subtract : u256
	) {
		if (mascot.vohts == 0) {
			abort Ending_from_mascot_has_zero_vohts
		};
		
		mascot.vohts = mascot.vohts - subtract;
	}
	
	public (friend) fun throw_voht (
		from_mascot : &mut Mascot, 
		to_mascot : &mut Mascot
	) {
		if (from_mascot.vohts == 0) {
			abort Ending_from_mascot_has_zero_vohts
		};
		
		from_mascot.vohts = from_mascot.vohts - 1;
		to_mascot.vohts = to_mascot.vohts + 1;
	}
	
	public (friend) fun vohts_score (mascot : & Mascot) : u256 {
		mascot.vohts
	}
}