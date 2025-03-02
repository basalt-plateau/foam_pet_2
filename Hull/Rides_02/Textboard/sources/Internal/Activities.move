




/*
	Send Text
	Refunds
	
	Memoir, Story, Accounting, Novel, Scroll, Log
*/
module Builder_01::Module_Logs {
	
	use std::string::{ String, utf8 };
	#[view] public fun Volitions () : String { 
		use Builder_01::Rules_Module::{ Volitions_01 }; Volitions_01 ()
	}
	
	struct Log_Text_Sent has store, drop {
		address : address,
		amount_of_apt : u64
	}
	
	struct Log_Refund has store, drop {
		address : address,
		amount_of_apt : u64
	}
	
	
}