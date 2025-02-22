






module Builder_01::Module_Guest_Texts {
	use std::string::{ String, utf8 };
	use std::vector;

	use Builder_01::Module_Hulls;
	use Builder_01::Module_Guest_Hull;
	
	#[view] public fun Volitions () : String { 
		use Builder_01::Rules_Module::{ Volitions_01 }; Volitions_01 ()
	}
	
	////
	//
	//	Entry Flux: 
	//		* Send
	//		* Delete
	//
	public entry fun Send (
		consenter : & signer,
		text : String,
		platform_name : String
	) {
		Module_Hulls::Send_Text (consenter, text, platform_name);
	}
	public entry fun Delete (consenter : & signer, platform_name : String) {
		Module_Hulls::Delete_Text (consenter, platform_name);
	}
	//
	////
	
	////
	//
	//	View Constant
	//
	//
	#[view] public fun Ensure_Text_Exists_at_Index (
		platform_name : String,
		writer_address : address,
		text : String,
		text_index : u64
	) : String {
		let texts : vector<Module_Hulls::Text_Envelope> = Module_Guest_Hull::Retrieve_Texts (platform_name);
		let text_ref = vector::borrow (& texts, text_index);
		
		assert! (Module_Hulls::Text_Envelope_Text (vector::borrow (& texts, text_index)) == text, 1);
		
		utf8 (b"exists")
	}
	//
	////
}