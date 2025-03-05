




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
	#[view] public fun Volitions () : std::string::String { 
		Builder_01::Rules_Module::Volitions_01 () 
	}

	struct Log has copy, store, drop {
		name : String,
		address : address,
		amount_of_apt : u64,
		seconds_IX_planet_3 : u64
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
			seconds_IX_planet_3 : timestamp::now_seconds ()
		};
		log
	}
	
	
	friend fun Log__name (log : Log) : String {
		log.name
	}
	friend fun Log__address (log : Log) : address {
		log.address
	}
	friend fun Log__amount_of_apt (log : Log) : u64 {
		log.amount_of_apt
	}
	friend fun Log__seconds_IX_planet_3 (log : Log) : u64 {
		log.seconds_IX_planet_3
	}

	
	// friend fun Log__ditto () : Log {}
}