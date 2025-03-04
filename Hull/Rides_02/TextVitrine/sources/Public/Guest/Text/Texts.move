






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
	//	View Sturdy (Constant)
	//
	//
	/*
		Module_Guest_Texts::Ensure_Text_Exists_at_Vector_Index (
			utf8 (b""), 
			0,
			texter_01_address, 
			utf8 (b"This is a text.")
		);
	*/
	#[view] public fun Ensure_Text_Exists_at_Vector_Index (
		platform_name : String,
		vector_index : u64,
		
		texter_address : address,
		text : String
	) : String {
		let texts : vector<Module_Hulls::Text_Envelope> = Module_Guest_Hull::Retrieve_Texts (platform_name);
		let text_amp = vector::borrow (& texts, vector_index);
		
		assert! (Module_Hulls::Text_Envelope_Text (text_amp) == text, 1);
		assert! (Module_Hulls::Text_Envelope__retrieve_writer_address (text_amp) == texter_address, 1);
		
		utf8 (b"exists")
	}
	//
	////
}