






module Builder_01::Module_Guest_Hulls {
	use std::string::{ String, utf8 };
	
	use Builder_01::Module_Hulls;
	use Builder_01::Module_Hull_Info_Envelope::{
		Hull_Info_Envelope
	};
	
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
	#[view] public fun Hull_Names () : vector<String> {
		Module_Hulls::retrieve_vector_of_hull_names ()
	}
	#[view] public fun Retrieve_Hulls_Info () : vector<Hull_Info_Envelope> {
		Module_Hulls::retrieve_vector_of_hulls_info ()
	}
	
	/*
		let hulls_info = Module_Guest_Hulls::Retrieve_Screened_Hulls_Info (utf8 (b"platform"));
		let hull_01_name = 
	*/
	#[view] public fun Retrieve_Screened_Hulls_Info (
		platform_name_partial : String
	) : vector<Hull_Info_Envelope> {
		Module_Hulls::retrieve_screened_vector_of_hulls_info (platform_name_partial)
	}
	//
	#[view] public fun retrieve_platform_name_at_index (
		_index : u64
	) : String {
		
		utf8 (b"")
	}
	//
	////
}




