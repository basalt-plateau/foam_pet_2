






module Builder_01::Module_Guest_Hull {
	use std::string::{ String, utf8 };

	use Builder_01::Module_Hulls;

	#[view] public fun Volitions () : String { 
		use Builder_01::Rules_Module::{ Volitions_01 }; Volitions_01 ()
	}
	
	////
	//
	//	Entry Flux: 
	//
	
	//
	////
	
	
	
	////
	//
	//	View Constant
	//
	//
	#[view] public fun Ensure_Count_of_Texts (platform_name : String, count : u64) : String {
		assert! (Module_Hulls::Retrieve_Count_of_Texts (platform_name) == count, 1);
		utf8 (b"exists")
	}
	#[view] public fun Count_of_Texts (platform_name : String) : u64 {
		Module_Hulls::Retrieve_Count_of_Texts (platform_name)
	}
	#[view] public fun Hull_Index (platform_name : String) : u64 {
		Module_Hulls::search_for_index_of_hull (platform_name)
	}
	#[view] public fun Hull_Index_V2 (platform_name : String) : (bool, u64) {
		Module_Hulls::search_for_index_of_hull_v2 (platform_name)
	}
	//
	////
	
}



