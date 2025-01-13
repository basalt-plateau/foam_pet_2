


module builder_1::Water_Balloons_1_Endings {
	friend builder_1::Water_Balloons_1_Sport;

	use std::string::{ String };
	use builder_1::Rules_09;


	#[view]
	public fun Volitions () : String { Rules_09::Volitions_01 () }
	
	public (friend) fun Ending_there_are_not_enough_water_balloons_left_to_make_that_sale () : u64 {
		return 94734
	}
	
	public (friend) fun Ending_the_thrower_has_not_joined_the_game () : u64 {
		return 473890
	}
	
	public (friend) fun Ending_the_catcher_has_not_joined_the_game () : u64 {
		return 890478
	}
}