

module Builder_01::Module_Guest_Venue {
	
	use std::string::{ String };

	#[view] public fun Volitions () : String { 
		use Builder_01::Rules_Module; Rules_Module::Volitions_01 () 
	}

	struct Guest_Bracelets has store, drop {}

	struct Guest_Bracelet has store, drop {}
	
	
	
	
	
}