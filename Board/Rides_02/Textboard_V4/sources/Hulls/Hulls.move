


module Builder_01::Hulls_Module {
	
	use std::vector;
	use std::string::{ Self, String, utf8 };
	use std::string_utils;
	use std::signer;
	use std::option::{ Option, some, none };
	use std::debug;
	
	use aptos_framework::timestamp;
	
	use Builder_01::Endings_Module;
	use Builder_01::Producer_Module::{ Self, ensure_consenter_is_producer };
	use Builder_01::Text_Module::{
		Text,
		Text__create,
		Text__change_writer_address,
		Text__change_text,
		Text__change_now_seconds,
		Text__retrieve_writer_address,
		Text__retrieve_text,
		Text__retrieve_now_seconds
	};

	const Limiter_Producer_the_platform_with_writer_address_is_empty : u64 = 100000;
	const Limiter_writer_has_less_than_the_amount_of_Octas_necessary_to_send : u64 = 100001;
	const Limiter_the_hull_is_not_going : u64 = 100002;
	const Limiter_Text_String_needs_to_be_less_than_one_hundred_characters : u64 = 100003;	
	
	const One_APT : u64 = 100000000;
	
	#[view] public fun Volitions () : String { 
		use Builder_01::Rules_Module::{ Volitions_01 }; Volitions_01 ()
	}
	
	struct Text_Envelope has store, drop {
		writer_address : address,
		writer_balance : u64,
		text : String,
		now_seconds : u64
	}
	
	/*
		status:
			playing
			paused
	*/
	struct Hull has store, drop {
		status : String,
		platform : String,
		texts : vector<Text>
	}
	
	/*
		status:
			playing
			paused
	*/
	struct Hulls has key, drop {
		status : String,
		price_of_text_in_octas : u64,
		hulls : vector<Hull>
	}
	
	////
	//
	//	Hulls View
	//
	//
	#[view] public fun are_Hulls_built () : String {
		if (exists<Hulls>(Producer_Module::obtain_address ())) {
			return utf8 (b"yup")
		};
		
		utf8 (b"no")
	}
	#[view] public fun Hulls_Status () : String acquires Hulls {
		borrow_global<Hulls>(Producer_Module::obtain_address ()).status
	}
	#[view] public fun retrieve_vector_of_hull_names () : vector<String> acquires Hulls {
		let hulls_envelope = vector::empty<String>();
		
		let hulls = borrow_global<Hulls>(Producer_Module::obtain_address ());
		let hulls_length = vector::length (& hulls.hulls);
		for (index in 0..hulls_length) {
			let hull_ref = vector::borrow (& hulls.hulls, index);
			vector::push_back (&mut hulls_envelope, hull_ref.platform);
		};
		
		hulls_envelope
	}
	//
	////

	////
	//
	//	Hull View
	//
	//
	#[view] public fun search_for_index_of_hull (platform : String) : u64 acquires Hulls {
		let hulls = borrow_global<Hulls>(Producer_Module::obtain_address ());
		
		let hulls_length = vector::length (& hulls.hulls);
		for (index in 0..hulls_length) {
			let hull_ref = vector::borrow (& hulls.hulls, index);
			if (hull_ref.platform == platform) {
				return index
			}
		};
		
		abort 1
	}
	#[view] public fun search_for_index_of_hull_v2 (platform : String) : (bool, u64) acquires Hulls {
		let hulls = borrow_global<Hulls>(Producer_Module::obtain_address ());
		
		let hulls_length = vector::length (& hulls.hulls);
		for (index in 0..hulls_length) {
			let hull_ref = vector::borrow (& hulls.hulls, index);
			if (hull_ref.platform == platform) {
				return (true, index)
			}
		};
		
		(false, 0)
	}
	//
	////	
	
	
	////
	//
	//	Texts View
	//
	//
	#[view] public fun Retrieve_Count_of_Texts (platform : String) : u64 acquires Hulls {
		
		//
		//	if hull not found, 
		//
		let (exists, index_of_hull) = search_for_index_of_hull_v2 (platform);
		if (exists != true) {
			return 0
		};
		
		let hulls = borrow_global_mut<Hulls>(Producer_Module::obtain_address ());
		let hull_ref : &mut Hull = vector::borrow_mut (&mut hulls.hulls, index_of_hull);
		let hull_texts = &mut hull_ref.texts;
		
		vector::length (hull_texts)
	}
	#[view] public fun Retrieve_Texts (platform : String) : vector<Text_Envelope> acquires Hulls {
		use aptos_framework::coin;
		use aptos_framework::aptos_coin;
		
		let hull_texts_envelope = vector::empty<Text_Envelope>();
		
		//
		//	if hull not found, 
		//	return an empty vector.
		//
		let (exists, index_of_hull) = search_for_index_of_hull_v2 (platform);
		if (exists != true) {
			return hull_texts_envelope
		};
		
		let hulls = borrow_global<Hulls>(Producer_Module::obtain_address ());
		let hull_ref : & Hull = vector::borrow (& hulls.hulls, index_of_hull);
		let hull_texts = & hull_ref.texts;
		let count_of_hull_texts = vector::length (hull_texts);
		for (index in 0..count_of_hull_texts) {
			let text_ref = vector::borrow (hull_texts, index);
			let text_ref_writer_address = Text__retrieve_writer_address (text_ref);
			
			let writer_balance = coin::balance<aptos_coin::AptosCoin>(
				text_ref_writer_address
			);
			
			let this_text = Text_Envelope {
				writer_address : 	text_ref_writer_address,
				writer_balance : 	writer_balance,
				text : 				Text__retrieve_text (text_ref),
				now_seconds : 		Text__retrieve_now_seconds (text_ref)
			};
			
			vector::push_back (&mut hull_texts_envelope, this_text);
		};
		
		hull_texts_envelope
	}
	#[view] public fun Retrieve_Texts_Between (
		platform : String,
		seconds_begin : u64,
		seconds_end : u64
	) : vector<Text_Envelope> acquires Hulls {
		use aptos_framework::coin;
		use aptos_framework::aptos_coin;
		
		let hull_texts_envelope = vector::empty<Text_Envelope>();
		
		//
		//	if hull not found, 
		//	return an empty vector.
		//
		let (exists, index_of_hull) = search_for_index_of_hull_v2 (platform);
		if (exists != true) {
			return hull_texts_envelope
		};
		
		let hulls = borrow_global<Hulls>(Producer_Module::obtain_address ());
		let hull_ref : & Hull = vector::borrow (& hulls.hulls, index_of_hull);
		let hull_texts = & hull_ref.texts;
		let count_of_hull_texts = vector::length (hull_texts);
		for (index in 0..count_of_hull_texts) {
			let text_ref = vector::borrow (hull_texts, index);
			let text_ref_writer_address = Text__retrieve_writer_address (text_ref);
			let text_ref_now_seconds = Text__retrieve_now_seconds (text_ref);
			
			let writer_balance = coin::balance<aptos_coin::AptosCoin>(
				text_ref_writer_address
			);
			
			if (text_ref_now_seconds >= seconds_begin && text_ref_now_seconds <= seconds_end) {
				let this_text = Text_Envelope {
					writer_address : 	text_ref_writer_address,
					writer_balance : 	writer_balance,
					text : 				Text__retrieve_text (text_ref),
					now_seconds : 		Text__retrieve_now_seconds (text_ref)
				};
				vector::push_back (&mut hull_texts_envelope, this_text);
			}
		};
		
		hull_texts_envelope
	}
	//
	////

	
	////
	//
	//	Hulls
	//
	//
	public entry fun Begin_Hulls (consenter : & signer) {
		ensure_consenter_is_producer (consenter);
		
		let price_of_text_in_octas : u64 = 100000000;
		
		let front = Hull {
			status: utf8 (b"playing"),
			platform : utf8 (b""),
			texts : vector::empty<Text>()
		};
		
		let hulls_vector = vector::empty<Hull>();
		vector::push_back (&mut hulls_vector, front);
		
		let hulls = Hulls {
			status: utf8 (b"playing"),
			price_of_text_in_octas : price_of_text_in_octas,
			hulls : hulls_vector
		};
		
		move_to<Hulls>(consenter, hulls)
	}
	public entry fun Ensure_Hulls_is_Playing () acquires Hulls {
		if (Hulls_Status () != utf8 (b"playing")) {
			abort Limiter_the_hull_is_not_going
		}
	}
	//
	////
	
	////
	//
	//	Hull
	//
	//
	public fun Ensure_Hull_is_Playing () {}	
	public fun search_or_begin_hull (platform : String) : u64 acquires Hulls {
		/*
			Search for the index of the hull.
			If the hull does not exist, then start it.
		*/

		let hulls = borrow_global_mut<Hulls>(Producer_Module::obtain_address ());
		let hulls_length = vector::length (& hulls.hulls);
		for (index in 0..hulls_length) {
			let hull_ref = vector::borrow (& hulls.hulls, index);
			if (hull_ref.platform == platform) {
				return index
			}
		};

		let hull = Hull {
			status: utf8 (b"began"),
			platform: platform,
			texts : vector::empty<Text>()
		};
		
		vector::push_back (&mut hulls.hulls, hull);
		
		let index = vector::length (& hulls.hulls) - 1;
		index
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
	) acquires Hulls {
		use aptos_framework::coin;
		use aptos_framework::aptos_coin::{ Self, AptosCoin };
		
		if (string::length (& text) > 100) {
			abort Limiter_Text_String_needs_to_be_less_than_one_hundred_characters
		};
		
		
		let writer_address = signer::address_of (writer);
		let producer_address = Producer_Module::obtain_address ();
		
		let index_of_hull = search_or_begin_hull (platform);
		let hulls = borrow_global_mut<Hulls>(producer_address);
		let hull_ref : &mut Hull = vector::borrow_mut (&mut hulls.hulls, index_of_hull);
		let price_of_text_in_octas = hulls.price_of_text_in_octas;
	
		//
		//	Deduct 1 APT
		//		* Ensure Consenter has >= 1 * "amount_of_plays_to_buy" APT.
		//		* Deduct the APT
		//
		if (coin::balance<AptosCoin>(writer_address) < price_of_text_in_octas) { 
			abort Limiter_writer_has_less_than_the_amount_of_Octas_necessary_to_send
		};
		coin::transfer<AptosCoin>(writer, producer_address, price_of_text_in_octas);
		
		
		let hull_texts = &mut hull_ref.texts;
		let already_has_text = false;
		for (index in 0..vector::length (hull_texts)) {
			let text_ref = vector::borrow_mut (hull_texts, index);
			let text_ref_writer_address = Text__retrieve_writer_address (text_ref);
			
			if (text_ref_writer_address == writer_address) {
				// vector::remove (hull_texts, index);
				
				//
				//	The writer already has a text on this platform,
				//	therefore a text modification occurs.
				//
				Text__change_text (text_ref, text);
				Text__change_now_seconds (text_ref);
				
				already_has_text = true;
				break;
			}
		};
		
		if (already_has_text == false) {
			let this_text = Text__create (writer_address, text);
			vector::push_back (hull_texts, this_text);
		}
	}
	public entry fun Delete_Text (consenter : & signer, platform : String) acquires Hulls {
		let writer_address = signer::address_of (consenter);		
		
		let index_of_hull = search_for_index_of_hull (platform);
		let hulls = borrow_global_mut<Hulls>(Producer_Module::obtain_address ());
		let hull_ref : &mut Hull = vector::borrow_mut (&mut hulls.hulls, index_of_hull);

		let hull_texts = &mut hull_ref.texts;
		for (index in 0..vector::length (hull_texts)) {
			let text_ref = vector::borrow_mut (hull_texts, index);
			if (Text__retrieve_writer_address (text_ref) == writer_address) {
				vector::remove (hull_texts, index);
				return;
			}
		};
		
		abort 260141
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
	//		Hulls
	//
	public fun Producer_Hulls_Change_Status (
		consenter : & signer,
		status : String
	) acquires Hulls {
		ensure_consenter_is_producer (consenter);
		let producer_address = Producer_Module::obtain_address ();
	
		let hulls = borrow_global_mut<Hulls>(producer_address);
		hulls.status = status;
	}
	public entry fun Producer_Hulls_Pause (consenter : & signer) acquires Hulls {
		Producer_Hulls_Change_Status (consenter, utf8 (b"paused"));
	}
	public entry fun Producer_Hulls_Play (consenter : & signer) acquires Hulls {
		Producer_Hulls_Change_Status (consenter, utf8 (b"playing"));
	}
	//
	//	
	//
	//		Hull
	//
	//
	public fun Producer_Hull_Change_Status (
		consenter : & signer,
		platform : String,
		status : String
	) acquires Hulls {
		ensure_consenter_is_producer (consenter);
	
		let index_of_hull = search_for_index_of_hull (platform);
		let hulls = borrow_global_mut<Hulls>(Producer_Module::obtain_address ());
		let hull_ref : &mut Hull = vector::borrow_mut (&mut hulls.hulls, index_of_hull);
		
		hull_ref.status = status;
	}
	public entry fun Producer_Hull_Pause (
		consenter : & signer,
		platform : String
	) acquires Hulls {
		Producer_Hull_Change_Status (consenter, platform, utf8 (b"paused"));
	}
	public entry fun Producer_Hull_Playing (
		consenter : & signer,
		platform : String 
	) acquires Hulls {
		Producer_Hull_Change_Status (consenter, platform, utf8 (b"playing"));
	}
	public entry fun Producer_Hull_Delete_Then_End () {}
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
	) acquires Hulls {
		ensure_consenter_is_producer (consenter);

		let producer_address = Producer_Module::obtain_address ();

		let index_of_hull = search_for_index_of_hull (platform);
		let hulls = borrow_global_mut<Hulls>(producer_address);
		let hull_ref : &mut Hull = vector::borrow_mut (&mut hulls.hulls, index_of_hull);	
		
		let hull_texts = &mut hull_ref.texts;
		for (index_of_text in 0..vector::length (hull_texts)) {
			let text_ref = vector::borrow_mut (hull_texts, index_of_text);
			if (Text__retrieve_writer_address (text_ref) == writer_address) {
				vector::remove (hull_texts, index_of_text);
				return;
			}
		};
		
		abort Limiter_Producer_the_platform_with_writer_address_is_empty
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