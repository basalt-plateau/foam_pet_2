

module Builder_01::Module_Producer_Hull {

	use std::string::{ String, utf8 };

	#[view] public fun Volitions () : String { 
		use Builder_01::Rules_Module::{ Volitions_01 }; Volitions_01 ()
	}
	
	use Builder_01::Module_Producer::{ 
		ensure_consenter_is_producer 
	};
	
	use Builder_01::Module_Hulls::{
		Hulls__Hull__change_status,
		Hulls__Hull__delete_every_text,
		Hulls__Hull__delete_platform
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
	//	Delete the entire hull
	public entry fun Delete (consenter : & signer, platform_name : String) {
		ensure_consenter_is_producer (consenter);
		Hulls__Hull__delete_platform (consenter, platform_name);
	}
	//
	//
	//
	//
	public entry fun Delete_Every_Text_For_Platform (consenter : & signer, platform_name : String) {
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