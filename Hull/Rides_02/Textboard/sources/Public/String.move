



module Builder_01::String {
	
	use std::string::{ String };
	
	#[view] public fun Volitions () : String { 
		use Builder_01::Rules_Module; Rules_Module::Volitions_01 () 
	}
}



