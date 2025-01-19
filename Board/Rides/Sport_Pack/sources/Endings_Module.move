


module builder_1::Endings_Module {
	friend builder_1::Game_Module;
	
	use std::string::{ String };

	#[view] public fun Volitions () : String { 
		use ride::Rules_10;
		Rules_10::Volitions_01 () 
	}
	
	public (friend) fun Ending_there_are_not_enough_votes_left_to_make_that_sale () : u64 {
		return 94734
	}
	
	public (friend) fun Ending_the_thrower_has_not_joined_the_game () : u64 {
		return 473890
	}
	
	public (friend) fun Ending_the_catcher_has_not_joined_the_game () : u64 {
		return 890478
	}
	
	public (friend) fun Ending_cannot_end_yet () : u64 {
		return 943728
	}
}