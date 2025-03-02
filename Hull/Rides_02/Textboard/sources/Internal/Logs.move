




/*
	Send Text
	Refunds
	
	Memoir, Story, Accounting, Novel, Scroll, Log
*/
module Builder_01::Module_Logs {
	friend Builder_01::Module_Hulls;
	friend Builder_01::Module_Guest_Logs;
	
	use std::timestamp;
	
	use std::string::{ String, utf8 };
	#[view] public fun Volitions () : String { 
		use Builder_01::Rules_Module::{ Volitions_01 }; Volitions_01 ()
	}

	struct Log has copy, store, drop {
		name : String,
		address : address,
		amount_of_apt : u64,
		now_seconds : u64
	}
	
	/*
		names:
			send_text
			refund
			
		let log = Log__create ()
	*/
	friend fun Log__create (
		name : String,
		address : address,
		amount_of_apt : u64
	) : Log {
		let log = Log {
			name : name,
			address : address,
			amount_of_apt : amount_of_apt,
			now_seconds : timestamp::now_seconds ()
		};
		log
	}
	
	// friend fun Log__ditto () : Log {}
}