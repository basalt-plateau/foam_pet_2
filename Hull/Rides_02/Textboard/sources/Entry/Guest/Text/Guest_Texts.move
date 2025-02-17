






module Builder_01::Module_Guest_Texts {
	use std::string::{ String, utf8 };

	use Builder_01::Module_Hulls;

	#[view] public fun Volitions () : String { 
		use Builder_01::Rules_Module::{ Volitions_01 }; Volitions_01 ()
	}
	
	////
	//
	//	View Constant
	//
	//
	#[view] public fun Count_of_Texts (platform_name : String) : u64 {
		Module_Hulls::Retrieve_Count_of_Texts (platform_name)
	}
	#[view] public fun Retrieve_Texts (
		platform_name : String
	) : vector<Module_Hulls::Text_Envelope> {
		Module_Hulls::Retrieve_Texts (platform_name)
	}
	//
	////
}