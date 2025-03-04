








module Builder_01::Module_Denizen_Texts {
	use std::string::{ String, utf8 };

	use Builder_01::Module_Hulls;
	
	#[view] public fun Volitions () : std::string::String { 
		Builder_01::Rules_Module::Volitions_01 () 
	}
	

	/*
		Module_Denizen_Texts::Send_Text (
			acceptor, 
			utf8 (b""), 
			utf8 (b""), 
			utf8 (b""), 
			utf8 (b"I accept.")
		)
	*/
	public entry fun Send_Text (
		acceptor : & signer,
		text : String,
		platform_name : String,
		agreed_to_rules : String
	) {
		Module_Hulls::Hulls__ensure_is_playing ();
		if (utf8 (b"I accept.") != agreed_to_rules) {
			abort 0xE000001;
		};
		
		Module_Hulls::Send_Text (acceptor, text, platform_name);
	}
	
	
	/*
		Module_Denizen_Texts::Delete_Text (acceptor, utf8 (b""))
	*/
	public entry fun Delete_Text (texter : & signer, platform_name : String) {
		Module_Hulls::Hulls__ensure_is_playing ();
		Module_Hulls::Delete_Text (texter, platform_name);
	}
	
	
	/*
		Each text has a send_index that corresponds to when it was
		sequentially added to the vector.
	*/
	public entry fun Delete_Text_by_Send_Index (
		deleter_acceptance : & signer, 
		platform_name : String, 
		send_index : u64
	) {
		Module_Hulls::Hulls__ensure_is_playing ();
		Module_Hulls::Denizen_Text_Delete_at_Send_Index (deleter_acceptance, platform_name, send_index);
	}
}