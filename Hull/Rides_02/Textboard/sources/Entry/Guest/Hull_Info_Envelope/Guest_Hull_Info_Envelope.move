




module Builder_01::Module_Guest_Hull_Info_Envelope {
	friend Builder_01::Module_Producer_Hull;	
	friend Builder_01::Module_Hulls;
	
	use std::vector;	
	use std::string::{ String, utf8 };
	
	use aptos_framework::timestamp;	
	
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
	//
	////

}