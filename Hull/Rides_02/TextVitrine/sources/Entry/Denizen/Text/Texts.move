








module Builder_01::Module_Denizen_Texts {
	use std::string::{ String, utf8 };
	use std::vector;

	use Builder_01::Module_Hulls;
	use Builder_01::Module_Guest_Hull;
	
	#[view] public fun Volitions () : String { 
		use Builder_01::Rules_Module::{ Volitions_01 }; Volitions_01 ()
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
	
	public entry fun Delete_Text_by_send_index (texter : & signer, send_index : u64) {
		Module_Hulls::Hulls__ensure_is_playing ();
	}
}