




module Builder_01::Endings_Module {
	friend Builder_01::Games_Module;
	
	use std::string::{ String };

	#[view] public fun Volitions () : String { 
		use Builder_01::Rules_Module;
		Rules_Module::Volitions_01 () 
	}
	
	public (friend) fun Ending_there_are_not_enough_boar_Planet_IVs_left_to_make_that_sale () : u64 {
		return 94734
	}
	
	public (friend) fun Ending_cannot_end_yet () : u64 {
		return 943728
	}
}