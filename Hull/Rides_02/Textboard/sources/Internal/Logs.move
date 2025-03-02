




/*
	Send Text
	Refunds
	
	Memoir, Story, Accounting, Novel, Scroll, Log
*/
module Builder_01::Module_Logs {
	
	use std::timestamp;
	
	use std::string::{ String, utf8 };
	#[view] public fun Volitions () : String { 
		use Builder_01::Rules_Module::{ Volitions_01 }; Volitions_01 ()
	}
	
	struct Log_Text_Sent has store, drop {
		address : address,
		amount_of_apt : u64,
		now_seconds : u64
	}
	struct Log_Refund has store, drop {
		address : address,
		amount_of_apt : u64,
		now_seconds : u64
	}
	
	friend fun Log_Text_Send__create (
		address : address,
		amount_of_apt : u64
	) : Log_Text_Sent {
		let log_text_send = Log_Text_Sent {
			address : address,
			amount_of_apt : amount_of_apt,
			now_seconds : timestamp::now_seconds ()
		};
		log_text_send
	}
}