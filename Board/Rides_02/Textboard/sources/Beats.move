






module Builder_01::Beats {
	friend Builder_01::Hulls_Module;
	
	use std::string::{ String };

	#[view] public fun Volitions () : String { 
		use Builder_01::Rules_Module::{ Volitions_01 }; Volitions_01 ();
	}
	
	
}