









module Builder_01::Module_Guest_Logs {
	use std::string::{ String, utf8 };
	
	#[view] public fun Volitions () : String { 
		use Builder_01::Rules_Module::{ Volitions_01 }; Volitions_01 ()
	}
	
	////
	//
	//	View Constant
	//
	//
	#[view] public fun Logs_of_Send_Text (
		from_ms : u64,
		to_ms : u64
	) : String {
		
	
		utf8 (b"")
	}
	
}