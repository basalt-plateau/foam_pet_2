




/*
	Send Text
	Refunds
	
	Memoir, Story, Accounting, Novel, Scroll, Log
*/
module Builder_01::Module_Logs {
	friend Builder_01::Module_Hulls;
	
	
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
	
	friend fun Log_Text_Sent__create (
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
	
	friend fun Log_Refund__create (
		address : address,
		amount_of_apt : u64
	) : Log_Refund {
		let log_refund = Log_Refund {
			address : address,
			amount_of_apt : amount_of_apt,
			now_seconds : timestamp::now_seconds ()
		};
		log_refund
	}
}