

module Builder_01::Module_Producer_Hull {

	use std::vector;
	use std::string::{ String, utf8 };
	
	use aptos_framework::timestamp;

	#[view] public fun Volitions () : String { 
		use Builder_01::Rules_Module::{ Volitions_01 }; Volitions_01 ()
	}
	
	use Builder_01::Module_Producer::{ 
		Self,
		ensure_consenter_is_producer 
	};
	
	use Builder_01::Module_Hulls::{
		Hulls,
		Hulls__mut_retrieve_hulls,
		search_for_index_of_hull,
		Hulls__Hull__change_status
	};
	
	use Builder_01::Module_Hull::{
		Hull,
		Hull__change_status
	};
	
	////
	//
	//	Entry Flux: 
	//		Status 
	//
	public entry fun Pause (consenter : & signer, platform : String) {
		ensure_consenter_is_producer (consenter);
		Hulls__Hull__change_status (consenter, platform, utf8 (b"paused"));
	}
	public entry fun Play (consenter : & signer, platform : String) {
		ensure_consenter_is_producer (consenter);
		Hulls__Hull__change_status (consenter, platform, utf8 (b"playing"));
	}
	//
	////
	
	
	////
	//
	//	View Constant
	//
	//
	
	//
	////
	
	
	
	
	////
	//
	//	Unfinished
	//
	public entry fun Producer_Hull_Delete_Then_Pause (
		consenter : & signer,
		platform : String
	) {
		ensure_consenter_is_producer (consenter);
	}
	//
	////
}