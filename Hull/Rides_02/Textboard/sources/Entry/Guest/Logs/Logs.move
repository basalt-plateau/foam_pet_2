









module Builder_01::Module_Guest_Logs {
	use std::string::{ String, utf8 };
	use Builder_01::Module_Hulls;
	use Builder_01::Module_Logs::{ Log };
	
	#[view] public fun Volitions () : String { 
		use Builder_01::Rules_Module::{ Volitions_01 }; Volitions_01 ()
	}
	
	////
	//
	//	View Constant
	//
	//
	#[view] public fun Logs_of_Send_Text (
		name : String,
		from_ms : u64,
		to_ms : u64
	) : vector<Log> {
		Module_Hulls::retrieve__text_sent_logs (name, from_ms, to_ms)
	}
	
}