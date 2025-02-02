


module Builder_01::Game_Module {
	
	//use std::vector;
	use std::string::{ String, utf8 };
	
	use aptos_framework::timestamp;
	
	use Builder_01::Endings_Module;
	use Builder_01::Producer_Module::{ Self, ensure_consenter_is_producer };
	
	
	#[view] public fun Volitions () : String { 
		use ride::Rules_10;
		Rules_10::Volitions_01 () 
	}
	
	/*
		topics: vector::empty<String>()
	*/
	struct Text has store, drop {
		topics: vector<String>,
		text: String
	}
	
	struct Game has key, drop {
		price_of_text_in_octas : u64
	}
	
	
	
	////
	//
	//	Show
	//
	//
	public entry fun Begin_Game (consenter : & signer) {
		ensure_consenter_is_producer (consenter);
		
		let price_of_text_in_octas : u64 = 100000000;
		let game = Game {
			price_of_text_in_octas : price_of_text_in_octas
		};
		
		move_to<Game>(consenter, game)
	}
	#[view] public fun End_Game () : String acquires Game {
		//
		//	Check if is after 2250 = 30 + 250 = 280
		//	Check if is after 2026 = 30 + 1 = 31
		//
		// 1000 * 60 * 60 * 24 * 365.25 = 31557600000
		//
		let can_end_after : u64 = 31557600000 * 31;
		if (timestamp::now_microseconds () <= can_end_after) {
			abort Endings_Module::Ending_cannot_end_yet ()
		};
		
		move_from<Game>(Producer_Module::obtain_address ());
		
		is_Game_built ()
	}
	#[view] public fun is_Game_built () : String {
		if (exists<Game>(Producer_Module::obtain_address ())) {
			return utf8 (b"yup")
		};
		
		utf8 (b"no")
	}
	public entry fun Reliquish_Game (consenter : & signer) {
		// reliquish a show to the ownership of another address.
		
		
		
	}
}