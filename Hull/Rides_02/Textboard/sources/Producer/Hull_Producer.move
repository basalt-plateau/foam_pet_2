

module Builder_01::Hull_Module_Producer {

	use std::vector;
	use std::string::{ String, utf8 };
	
	use aptos_framework::timestamp;

	#[view] public fun Volitions () : String { 
		use Builder_01::Rules_Module::{ Volitions_01 }; Volitions_01 ()
	}
	
	use Builder_01::Producer_Module::{ 
		Self,
		ensure_consenter_is_producer 
	};
	
	use Builder_01::Hulls_Module::{
		Hulls,
		Hulls__mut_retrieve_hulls,
		search_for_index_of_hull,
		Hulls__Hull__change_status
	};
	
	use Builder_01::Hull_Module::{
		Hull,
		Hull__change_status
	};
	
	
	public fun Producer_Hull_Change_Status (
		consenter : & signer,
		platform : String,
		status : String
	) {
		ensure_consenter_is_producer (consenter);
		Hulls__Hull__change_status (consenter, platform, status);
	}
	public entry fun Producer_Hull_Pause (consenter : & signer, platform : String) {
		ensure_consenter_is_producer (consenter);
		Hulls__Hull__change_status (consenter, platform, utf8 (b"paused"));
	}
	public entry fun Producer_Hull_Play (consenter : & signer, platform : String) {
		ensure_consenter_is_producer (consenter);
		Hulls__Hull__change_status (consenter, platform, utf8 (b"playing"));
	}
	public entry fun Producer_Hull_Delete_Then_Pause (
		consenter : & signer,
		platform : String
	) {
		ensure_consenter_is_producer (consenter);
	}
}