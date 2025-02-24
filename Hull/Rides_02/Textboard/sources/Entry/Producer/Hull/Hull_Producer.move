

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
		Hulls__Hull__change_status,
		Hulls__Hull__delete_every_text
	};
	
	////
	//
	//	Entry Flux: 
	//		Status:
	//			playing
	//			paused
	//			disappeared: exists in struct, but not on dapp
	//
	public entry fun Disappear (consenter : & signer, platform_name : String) {
		ensure_consenter_is_producer (consenter);
		Hulls__Hull__change_status (consenter, platform_name, utf8 (b"disappeared"));
	}
	public entry fun Pause (consenter : & signer, platform_name : String) {
		ensure_consenter_is_producer (consenter);
		Hulls__Hull__change_status (consenter, platform_name, utf8 (b"paused"));
	}
	public entry fun Play (consenter : & signer, platform_name : String) {
		ensure_consenter_is_producer (consenter);
		Hulls__Hull__change_status (consenter, platform_name, utf8 (b"playing"));
	}
	//
	//
	//
	//
	public entry fun Delete_Every_Text_For_Platform (consenter : & signer, platform_name : String) {
		ensure_consenter_is_producer (consenter);
		Hulls__Hull__delete_every_text (consenter, platform_name);
	}
	public entry fun Delete (consenter : & signer, platform_name : String) {
		ensure_consenter_is_producer (consenter);
		Hulls__Hull__delete_every_text (consenter, platform_name);
	}
	public entry fun Producer_Hull_Delete_Every_Text_For_Platform (
		consenter : & signer,
		platform_name : String
	) {
		// Ancient.. use "Delete_Every_Text_For_Platform"
		ensure_consenter_is_producer (consenter);
		Hulls__Hull__delete_every_text (consenter, platform_name);
	}
	//
	////
	

}