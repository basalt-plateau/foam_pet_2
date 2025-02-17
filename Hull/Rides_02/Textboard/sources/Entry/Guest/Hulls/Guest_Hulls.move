






module Builder_01::Module_Guest_Hulls {
	use std::string::{ String, utf8 };

	use Builder_01::Module_Producer::{ Self };
	use Builder_01::Module_Hulls;

	#[view] public fun Volitions () : String { 
		use Builder_01::Rules_Module::{ Volitions_01 }; Volitions_01 ()
	}
	
	////
	//
	//	View Constant
	//
	//
	#[view] public fun are_built () : String {
		Module_Hulls::are_Hulls_built ()
	}
	#[view] public fun Status () : String {
		Module_Hulls::Hulls_Status ()
	}
	//
	////
}

