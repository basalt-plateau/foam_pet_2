


module Builder_01::Games_Module {
	
	use std::vector;
	use std::string::{ Self, String, utf8 };
	use std::string_utils;
	use std::signer;
	use std::debug;
	
	use aptos_framework::timestamp;
	
	use Builder_01::Endings_Module;
	use Builder_01::Producer_Module::{ Self, ensure_consenter_is_producer };

	const Abortion_Producer_the_platform_with_writer_address_is_empty : u64 = 100000;
	const Abortion_writer_has_less_than_the_amount_of_Octas_necessary_to_send : u64 = 100001;
	const Abortion_the_game_is_not_going : u64 = 100002;
	const Hull_Text_String_needs_to_be_less_than_one_hundred_characters : u64 = 100003;	
	
	const One_APT : u64 = 100000000;
	
	#[view] public fun Volitions () : String { 
		use Builder_01::Rules_Module;
		Rules_Module::Volitions_01 () 
	}
	
	/*
		platforms: vector::empty<String>()
	*/
	struct Text has store, drop {
		writer_address : address,
		text : String
	}
	struct Text_Envelope has store, drop {
		writer_address : address,
		writer_balance : u64,
		text : String
	}
	
	/*
		status:
			playing
			paused
	*/
	struct Game has store, drop {
		status : String,
		platform : String,
		texts : vector<Text>
	}
	
	/*
		status:
			playing
			paused
	*/
	struct Games has key, drop {
		status : String,
		price_of_text_in_octas : u64,
		games : vector<Game>
	}
	

	
	////
	//
	//	Games
	//
	//
	#[view] public fun are_Games_built () : String {
		if (exists<Games>(Producer_Module::obtain_address ())) {
			return utf8 (b"yup")
		};
		
		utf8 (b"no")
	}
	public entry fun Begin_Games (consenter : & signer) {
		ensure_consenter_is_producer (consenter);
		
		let price_of_text_in_octas : u64 = 100000000;
		
		let front = Game {
			status: utf8 (b"playing"),
			platform : utf8 (b""),
			texts : vector::empty<Text>()
		};
		
		let games_vector = vector::empty<Game>();
		vector::push_back (&mut games_vector, front);
		
		let games = Games {
			status: utf8 (b"playing"),
			price_of_text_in_octas : price_of_text_in_octas,
			games : games_vector
		};
		
		move_to<Games>(consenter, games)
	}
	#[view] public fun Games_Status () : String acquires Games {
		borrow_global<Games>(Producer_Module::obtain_address ()).status
	}
	public entry fun Ensure_Games_is_Playing () acquires Games {
		if (Games_Status () != utf8 (b"playing")) {
			abort Abortion_the_game_is_not_going
		}
	}
	//
	////
	
	////
	//
	//	Game
	//
	//
	#[view] public fun retrieve_vector_of_game_names () : vector<String> acquires Games {
		let games_envelope = vector::empty<String>();
		
		let games = borrow_global<Games>(Producer_Module::obtain_address ());
		let games_length = vector::length (& games.games);
		for (index in 0..games_length) {
			let game_ref = vector::borrow (& games.games, index);
			vector::push_back (&mut games_envelope, game_ref.platform);
		};
		
		games_envelope
	}
	public fun Ensure_Game_is_Playing () {}	
	public fun search_or_begin_game (platform : String) : u64 acquires Games {
		/*
			Search for the index of the game.
			If the game does not exist, then start it.
		*/

		let games = borrow_global_mut<Games>(Producer_Module::obtain_address ());
		let games_length = vector::length (& games.games);
		for (index in 0..games_length) {
			let game_ref = vector::borrow (& games.games, index);
			if (game_ref.platform == platform) {
				return index
			}
		};

		let game = Game {
			status: utf8 (b"began"),
			platform: platform,
			texts : vector::empty<Text>()
		};
		
		vector::push_back (&mut games.games, game);
		
		let index = vector::length (& games.games) - 1;
		index
	}
	#[view] public fun search_for_index_of_game (platform : String) : u64 acquires Games {
		let games = borrow_global<Games>(Producer_Module::obtain_address ());
		
		let games_length = vector::length (& games.games);
		for (index in 0..games_length) {
			let game_ref = vector::borrow (& games.games, index);
			if (game_ref.platform == platform) {
				return index
			}
		};
		
		abort 1
	}
	//
	////
	
	
	
	////
	//
	//	Texts
	//
	//
	public entry fun Send_Text (
		writer : & signer,
		text : String,
		platform : String
	) acquires Games {
		use aptos_framework::coin;
		use aptos_framework::aptos_coin::{ Self, AptosCoin };
		
		if (string::length (& text) > 100) {
			abort Hull_Text_String_needs_to_be_less_than_one_hundred_characters
		};
		
		
		let writer_address = signer::address_of (writer);
		let producer_address = Producer_Module::obtain_address ();
		
		let index_of_game = search_or_begin_game (platform);
		let games = borrow_global_mut<Games>(producer_address);
		let game_ref : &mut Game = vector::borrow_mut (&mut games.games, index_of_game);
		let price_of_text_in_octas = games.price_of_text_in_octas;
	
		//
		//	Deduct 1 APT
		//		* Ensure Consenter has >= 1 * "amount_of_plays_to_buy" APT.
		//		* Deduct the APT
		//
		if (coin::balance<AptosCoin>(writer_address) < price_of_text_in_octas) { 
			abort Abortion_writer_has_less_than_the_amount_of_Octas_necessary_to_send
		};
		coin::transfer<AptosCoin>(writer, producer_address, price_of_text_in_octas);
		
		
		let game_texts = &mut game_ref.texts;
		let already_has_text = false;
		for (index in 0..vector::length (game_texts)) {
			let text_ref = vector::borrow_mut (game_texts, index);
			if (text_ref.writer_address == writer_address) {
				// vector::remove (game_texts, index);
				
				//
				//	The writer already has a text on this platform,
				//	therefore a text modification occurs.
				//
				text_ref.text = text;
				
				
				already_has_text = true;
				break;
			}
		};
		
		if (already_has_text == false) {
			let this_text = Text {
				writer_address : writer_address,
				text : text
			};
			
			vector::push_back (game_texts, this_text);
		}
	}
	public entry fun Delete_Text (consenter : & signer, platform : String) acquires Games {
		let writer_address = signer::address_of (consenter);		
		
		let index_of_game = search_for_index_of_game (platform);
		let games = borrow_global_mut<Games>(Producer_Module::obtain_address ());
		let game_ref : &mut Game = vector::borrow_mut (&mut games.games, index_of_game);

		let game_texts = &mut game_ref.texts;
		for (index in 0..vector::length (game_texts)) {
			let text_ref = vector::borrow_mut (game_texts, index);
			if (text_ref.writer_address == writer_address) {
				vector::remove (game_texts, index);
				return;
			}
		};
		
		abort 260141
	}

	#[view] public fun Retrieve_Texts (platform : String) : vector<Text_Envelope> acquires Games {
		use aptos_framework::coin;
		use aptos_framework::aptos_coin;
		
		let index_of_game = search_for_index_of_game (platform);
		let games = borrow_global_mut<Games>(Producer_Module::obtain_address ());
		let game_ref : &mut Game = vector::borrow_mut (&mut games.games, index_of_game);
		
		let game_texts = &mut game_ref.texts;
		
		let game_texts_envelope = vector::empty<Text_Envelope>();
		for (index in 0..vector::length (game_texts)) {
			let text_ref = vector::borrow_mut (game_texts, index);
			let writer_balance = coin::balance<aptos_coin::AptosCoin>(text_ref.writer_address);
			
			let this_text = Text_Envelope {
				writer_address : text_ref.writer_address,
				writer_balance : writer_balance,
				text : text_ref.text
			};
			
			vector::push_back (&mut game_texts_envelope, this_text);
		};
		
		game_texts_envelope
	}
	public fun Text_Envelope_Text (envelope: & Text_Envelope) : String {
		envelope.text
	}
	//
	////
	
	
	////
	//
	//	Producer Moves
	//
	//		Games
	//
	public fun Producer_Games_Change_Status (
		consenter : & signer,
		status : String
	) acquires Games {
		ensure_consenter_is_producer (consenter);
		let producer_address = Producer_Module::obtain_address ();
	
		let games = borrow_global_mut<Games>(producer_address);
		games.status = status;
	}
	public entry fun Producer_Games_Pause (consenter : & signer) acquires Games {
		Producer_Games_Change_Status (consenter, utf8 (b"paused"));
	}
	public entry fun Producer_Games_Play (consenter : & signer) acquires Games {
		Producer_Games_Change_Status (consenter, utf8 (b"playing"));
	}
	//
	//	
	//
	//		Game
	//
	//
	public fun Producer_Game_Change_Status (
		consenter : & signer,
		platform : String,
		status : String
	) acquires Games {
		ensure_consenter_is_producer (consenter);
	
		let index_of_game = search_for_index_of_game (platform);
		let games = borrow_global_mut<Games>(Producer_Module::obtain_address ());
		let game_ref : &mut Game = vector::borrow_mut (&mut games.games, index_of_game);
		
		game_ref.status = status;
	}
	public entry fun Producer_Game_Pause (
		consenter : & signer,
		platform : String
	) acquires Games {
		Producer_Game_Change_Status (consenter, platform, utf8 (b"paused"));
	}
	public entry fun Producer_Game_Playing (
		consenter : & signer,
		platform : String 
	) acquires Games {
		Producer_Game_Change_Status (consenter, platform, utf8 (b"playing"));
	}
	public entry fun Producer_Game_Delete_Then_End () {}
	//
	//
	//
	//		Text
	//
	//
	public entry fun Producer_Delete_Text (
		consenter : & signer,
		writer_address : address,
		platform : String 
	) acquires Games {
		ensure_consenter_is_producer (consenter);

		let producer_address = Producer_Module::obtain_address ();

		let index_of_game = search_for_index_of_game (platform);
		let games = borrow_global_mut<Games>(producer_address);
		let game_ref : &mut Game = vector::borrow_mut (&mut games.games, index_of_game);	
		
		let game_texts = &mut game_ref.texts;
		for (index_of_text in 0..vector::length (game_texts)) {
			let text_ref = vector::borrow_mut (game_texts, index_of_text);
			if (text_ref.writer_address == writer_address) {
				vector::remove (game_texts, index_of_text);
				return;
			}
		};
		
		abort Abortion_Producer_the_platform_with_writer_address_is_empty
	}
	//
	////
	
	////
	//
	//	Anyone Moves
	//
	//
	public entry fun Clean_Texts () {}
	//
	////
}