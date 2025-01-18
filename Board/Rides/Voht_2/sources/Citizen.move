


module builder_1::Voht_Freighter {
	#[view] public fun Volitions () : String { 
		use Ride_01::Rules_10; 
		Rules_10::Volitions_01 ()
	}
	
	friend builder_1::Void_Freight_Group;
	
	use std::string::{ String };
	
	
	const Ending_from_Freighter_has_zero_Vohts : u64 = 3;
	const Ending_Freighter_was_not_found : u64 = 3;
	
	
	struct Freighter has store, drop {
		address : address,
		Vohts : u256
	}
	
	public (friend) fun add (address : address) : Freighter {
		let Freighter = Freighter {
			address : address,
			Vohts : 0
		};
		Freighter
	}
	
	public (friend) fun address_of_freighter (Freighter : & Freighter) : address {
		Freighter.address
	}
	
	public (friend) fun add_Vohts (
		Freighter : &mut Freighter, 
		add : u256
	) {
		Freighter.Vohts = Freighter.Vohts + add;
	}
	
	public (friend) fun subtract_Vohts (
		Freighter : &mut Freighter, 
		subtract : u256
	) {
		if (Freighter.Vohts == 0) {
			abort Ending_from_Freighter_has_zero_Vohts
		};
		
		Freighter.Vohts = Freighter.Vohts - subtract;
	}
	
	public (friend) fun throw_Voht (
		from_Freighter : &mut Freighter, 
		to_Freighter : &mut Freighter
	) {
		if (from_Freighter.Vohts == 0) {
			abort Ending_from_Freighter_has_zero_Vohts
		};
		
		from_Freighter.Vohts = from_Freighter.Vohts - 1;
		to_Freighter.Vohts = to_Freighter.Vohts + 1;
	}
	
	public (friend) fun Vohts_score (Freighter : & Freighter) : u256 {
		Freighter.Vohts
	}
}