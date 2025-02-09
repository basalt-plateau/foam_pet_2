

module Builder_01::Hulls_Outer_Module {
	
	use std::vector;
	use std::string::{ Self, String, utf8 };
	
	#[view] public fun Volitions () : String { 
		use Builder_01::Rules_Module::{ Volitions_01 }; Volitions_01 () 
	}
	

}