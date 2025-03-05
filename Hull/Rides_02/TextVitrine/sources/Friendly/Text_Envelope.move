





module Builder_01::Module_Text_Envelope {
	#[view] public fun Volitions () : std::string::String { 
		use Builder_01::Rules_Module::{ Volitions_01 }; Volitions_01 ()
	}
	
	
	use std::string::{ String };

	
	////
	//
	struct Text_Envelope has store, drop, copy {
		writer_address : address,
		text : String,
		
		envelope_index: u64,
		
		now_seconds : u64
	}
	//
	////
	

	
	
	
}