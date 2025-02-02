


module Builder_01::Game_Module {
	
	use std::vector;
	use std::string::{ String, utf8 };
	use std::string_utils;
	use std::signer;
	use std::debug;
	
	use aptos_framework::timestamp;
	
	use Builder_01::Endings_Module;
	use Builder_01::Producer_Module::{ Self, ensure_consenter_is_producer };
	
	
	#[view] public fun Volitions () : String { 
		use ride::Rules_10;
		Rules_10::Volitions_01 () 
	}
	
	/*
		platforms: vector::empty<String>()
	*/
	struct Text has store, drop {
		writer_address : address,
		text : String,
		platforms : vector<String>,
		allow_translation: String
	}
	
	/*
		status:
			began
	*/
	struct Game has key, drop {
		status : String,
		price_of_text_in_octas : u64,
		texts : vector<Text>
	}
	
	
	
	////
	//
	//	Game
	//
	//
	public entry fun Begin_Game (consenter : & signer) {
		ensure_consenter_is_producer (consenter);
		
		let price_of_text_in_octas : u64 = 100000000;
		let game = Game {
			status: utf8 (b"began"),
			price_of_text_in_octas : price_of_text_in_octas,
			texts : vector::empty<Text>()
		};
		
		move_to<Game>(consenter, game)
	}
	#[view] public fun End_Game () : String acquires Game {
		if (is_Game_built () != utf8 (b"yup")) {
			return utf8 (b"There isn't a game going on.")
		};
		
		//
		//	Check if is after 2250 = 30 + 250 = 280
		//	Check if is after 2026 = 30 + 1 = 31
		//
		// 1000 * 60 * 60 * 24 * 365.25 = 31557600000
		//
		let can_end_after : u64 = 31557600000 * 31;
		
		debug::print (& string_utils::format1 (& b"beat 1: {}", can_end_after));
		debug::print (& string_utils::format1 (& b"beat 2: {}", timestamp::now_microseconds ()));
		
		let now = timestamp::now_microseconds ();
		if (now < can_end_after) {
			return string_utils::format2 (
				& b"The game cannot be ended yet. Now is {}. The game can end at {}", 
				now, 
				can_end_after
			)
		};
		
		move_from<Game>(Producer_Module::obtain_address ());
		
		if (is_Game_built () == utf8 (b"yup")) {
			return utf8 (b"The game didn't end for some reason.")
		};
		
		utf8 (b"The game ended.")
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
	//
	////
	
	////
	//
	//	Texts
	//
	public entry fun send_text (
		consenter : & signer,
		text : String,
		platforms : vector<String>,
		allow_translation : String
	) acquires Game {
		let writer_address = signer::address_of (consenter);
		let game = borrow_global_mut<Game>(Producer_Module::obtain_address ());
		let game_texts = &mut game.texts;
		
		
		let already_has_text = false;
		for (index in 0..vector::length (game_texts)) {
			let text_ref = vector::borrow_mut (game_texts, index);
			if (text_ref.writer_address == writer_address) {
				// vector::remove (game_texts, index);
				
				already_has_text = true;
				
				text_ref.text = text;
				text_ref.platforms = platforms;
				text_ref.allow_translation = allow_translation;
				
				return;
			}
		};
		
		if (already_has_text) {
			
		}
		else {
			let this_text = Text {
				writer_address : writer_address,
				text : text,
				platforms : platforms,
				allow_translation : allow_translation
			};
			
			vector::push_back (game_texts, this_text);
		}
	}
	public entry fun delete_text (consenter : & signer) acquires Game {
		let writer_address = signer::address_of (consenter);
		let game = borrow_global_mut<Game>(Producer_Module::obtain_address ());
		let game_texts = &mut game.texts;
		
		for (index in 0..vector::length (game_texts)) {
			let text_ref = vector::borrow_mut (game_texts, index);
			if (text_ref.writer_address == writer_address) {
				vector::remove (game_texts, index);
			}
		};
	}
	//
	////
}