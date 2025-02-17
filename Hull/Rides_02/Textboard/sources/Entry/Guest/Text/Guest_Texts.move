






module Builder_01::Module_Guest_Texts {
	use std::string::{ String, utf8 };
	use std::vector;

	use Builder_01::Module_Hulls;

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
	public entry fun Delete (
		consenter : & signer,
		platform_name : String
	) {
		Module_Hulls::Delete_Text (consenter, platform_name);
	}
	//
	////
	
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
	#[view] public fun Retrieve_Texts_Between (
		platform_name : String,
		seconds_begin : u64,
		seconds_end : u64
	) : vector<Module_Hulls::Text_Envelope> {
		Module_Hulls::Retrieve_Texts_Between (
			platform_name,
			seconds_begin,
			seconds_end
		)
	}
	#[view] public fun Ensure_Text_Exists_at_Index (
		platform_name : String,
		writer_address : address,
		text : String,
		text_index : u64
	) : String {
		let texts : vector<Module_Hulls::Text_Envelope> = Retrieve_Texts (platform_name);
		
		let text_ref = vector::borrow (& texts, text_index);
		
		assert! (
			Module_Hulls::Text_Envelope_Text (vector::borrow (& texts, text_index)) == text, 
			1
		);
		
		utf8 (b"")
	}
	//
	////
}