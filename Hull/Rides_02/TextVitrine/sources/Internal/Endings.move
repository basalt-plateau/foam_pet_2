




module Builder_01::Endings_Module {
	friend Builder_01::Module_Hulls;
	
	use std::string::{ String };

	#[view] public fun Volitions () : String { 
		use Builder_01::Rules_Module; Rules_Module::Volitions_01 () 
	}
	
	public (friend) fun Ending_cannot_end_yet () : u64 {
		return 943728
	}
}