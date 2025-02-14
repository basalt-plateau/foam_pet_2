


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
		use Builder_01::Rules_Module;
		Rules_Module::Volitions_01 () 
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
				
				text_ref.text = text;
				text_ref.platforms = platforms;
				text_ref.allow_translation = allow_translation;
				
				already_has_text = true;
				break;
			}
		};
		
		if (already_has_text == false) {
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
	
	
	struct Text_02 has store, drop {
		writer_address : address,
		writer_balance : u64,
		
		text : String,
		platforms : vector<String>,
		allow_translation: String
	}
	
	/*
		Bracket: {
			"writer_address": "",
			"text": "",
			"platforms": "",
			"allow_translation": ""
		}
	*/
	#[view] public fun retrieve_texts () : vector<Text_02> acquires Game {
		use aptos_framework::coin;
		use aptos_framework::aptos_coin;
		
		let game = borrow_global_mut<Game>(Producer_Module::obtain_address ());
		let game_texts = &mut game.texts;
		
		
		let platforms_01 = vector::empty<Text_02>();
		for (index in 0..vector::length (game_texts)) {
			let text_ref = vector::borrow_mut (game_texts, index);
			let writer_balance = coin::balance<aptos_coin::AptosCoin>(text_ref.writer_address);
			
			let this_text = Text_02 {
				writer_address : text_ref.writer_address,
				writer_balance : writer_balance,
				
				text : text_ref.text,
				platforms : text_ref.platforms,
				allow_translation : text_ref.allow_translation
			};
			
			vector::push_back (&mut platforms_01, this_text);
		};
		
		platforms_01
	}
	//
	////
}