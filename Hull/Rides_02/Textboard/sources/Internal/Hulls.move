


module Builder_01::Module_Hulls {
	friend Builder_01::Module_Producer_Hulls;	
	friend Builder_01::Module_Producer_Hull;
	friend Builder_01::Module_Producer_Texts;

	friend Builder_01::Module_Guest_Hulls;
	friend Builder_01::Module_Guest_Hull;
	friend Builder_01::Module_Guest_Texts;

	use std::vector;
	use std::string::{ Self, String, utf8 };
	use std::string_utils;
	use std::signer;
	use std::option::{ Option, some, none };
	use std::debug;
	
	use aptos_framework::timestamp;
	
	use Builder_01::Endings_Module;
	use Builder_01::Module_Producer::{ Self, ensure_consenter_is_producer };
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
	use Builder_01::Module_Hull::{
		Hull,
		Hull__create,
		Hull__ensure_is_playing,
		Hull__change_status,		
		Hull__mut_retrieve_texts,
		Hull__retrieve_status,
		Hull__retrieve_platform,
		Hull__retrieve_texts,
		Hull__retrieve_count_of_texts,
		Hull__retrieve_created_at_now_seconds
	};

	const Limiter_Producer_the_platform_with_writer_address_is_empty : u64 = 100000;
	const Limiter_writer_has_less_than_the_amount_of_Octas_necessary_to_send : u64 = 100001;
	const Limiter_the_hull_is_not_going : u64 = 100002;
	const Limiter_Text_String_needs_to_be_less_than_one_hundred_characters : u64 = 100003;	
	const Limiter_Refund_must_be_1_apt_or_fewer : u64 = 100004;	
	
	const One_APT : u64 = 100000000;
	
	struct Text_Envelope has store, drop {
		writer_address : address,
		writer_balance : u64,
		text : String,
		now_seconds : u64
	}
	
	struct Hull_Info_Envelope has store, drop {
		status : String,
		platform_name : String,
		count_of_texts : u64
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
	
	#[view] public fun Volitions () : String { 
		use Builder_01::Rules_Module::{ Volitions_01 }; Volitions_01 ()
	}	
	
	////////
	//
	//	Hulls
	//		[Retrieve]
	//
	friend fun Hulls__mut_retrieve_hulls (hulls : &mut Hulls) : &mut vector<Hull> {
		&mut hulls.hulls
	}
	//
	//
	//		[Flux]
	//
	friend fun Begin_Hulls (consenter : & signer) {
		ensure_consenter_is_producer (consenter);
		
		let price_of_text_in_octas : u64 = 100000000;
		
		let front = Hull__create (
			utf8 (b"playing"),
			utf8 (b""),
			vector::empty<Text>()
		);
		
		let hulls_vector = vector::empty<Hull>();
		vector::push_back (&mut hulls_vector, front);
		
		let hulls = Hulls {
			status: utf8 (b"playing"),
			price_of_text_in_octas : price_of_text_in_octas,
			hulls : hulls_vector
		};
		
		move_to<Hulls>(consenter, hulls)
	}
	friend fun Hulls_Change_Status (
		consenter : & signer,
		status : String
	) acquires Hulls {
		ensure_consenter_is_producer (consenter);
		let producer_address = Module_Producer::obtain_address ();
	
		let hulls = borrow_global_mut<Hulls>(producer_address);
		hulls.status = status;
	}
	//
	//
	//		[Constants]
	//
	friend fun are_Hulls_built () : String {
		if (exists<Hulls>(Module_Producer::obtain_address ())) {
			return utf8 (b"yup")
		};
		
		utf8 (b"no")
	}
	friend fun Hulls_Status () : String acquires Hulls {
		borrow_global<Hulls>(Module_Producer::obtain_address ()).status
	}
	friend fun retrieve_vector_of_hull_names () : vector<String> acquires Hulls {
		let envelope = vector::empty<String>();
		
		let hulls_ref = borrow_global<Hulls>(Module_Producer::obtain_address ());
		let hulls_length = vector::length (& hulls_ref.hulls);
		for (index in 0..hulls_length) {
			let hull_ref = vector::borrow (& hulls_ref.hulls, index);
			vector::push_back (&mut envelope, Hull__retrieve_platform (hull_ref));
		};
		
		envelope
	}
	friend fun retrieve_vector_of_hulls_info () : vector<Hull_Info_Envelope> acquires Hulls {
		let envelope = vector::empty<Hull_Info_Envelope>();
		
		let hulls_ref = borrow_global<Hulls>(Module_Producer::obtain_address ());
		let hulls_length = vector::length (& hulls_ref.hulls);
		for (index in 0..hulls_length) {
			let hull_ref = vector::borrow (& hulls_ref.hulls, index);
			
			let hull_info_envelope = Hull_Info_Envelope {
				status : Hull__retrieve_status (hull_ref),
				platform_name : Hull__retrieve_platform (hull_ref),
				count_of_texts : Hull__retrieve_count_of_texts (hull_ref)
			};
			
			vector::push_back (&mut envelope, hull_info_envelope);
		};
		
		envelope
	}
	fun Ensure_Hulls_is_Playing () acquires Hulls {
		if (Hulls_Status () != utf8 (b"playing")) {
			abort Limiter_the_hull_is_not_going
		}
	}
	//
	////////
	
	
	
	

	
	////////
	//
	//	Hull:
	//		[Flux]
	//
	//
	friend fun Hulls__Hull__change_status (
		consenter : & signer,
		platform : String,
		status : String
	) acquires Hulls {
		let index_of_hull = search_for_index_of_hull (platform);
		
		let hulls_key_mref = borrow_global_mut<Hulls>(Module_Producer::obtain_address ());
		let hulls_mref = &mut hulls_key_mref.hulls;
		let hull_mref : &mut Hull = vector::borrow_mut (hulls_mref, index_of_hull);
		
		Hull__change_status (hull_mref, status);
	}
	friend fun Hulls__Hull__delete_every_text (consenter : & signer, platform_name : String) acquires Hulls {
		let index_of_hull = search_for_index_of_hull (platform_name);
		
		let hulls_key_mref = borrow_global_mut<Hulls>(Module_Producer::obtain_address ());
		let hulls_mref = &mut hulls_key_mref.hulls;
		let hull_mref : &mut Hull = vector::borrow_mut (hulls_mref, index_of_hull);
		
	}
	//
	//		[Flux Internal]
	//
	//
	fun search_or_begin_hull (platform : String) : u64 acquires Hulls {
		/*
			Search for the index of the hull.
			If the hull does not exist, then start it.
		*/
		let hulls = borrow_global_mut<Hulls>(Module_Producer::obtain_address ());
		let hulls_length = vector::length (& hulls.hulls);
		for (index in 0..hulls_length) {
			let hull_ref = vector::borrow (& hulls.hulls, index);
			if (Hull__retrieve_platform (hull_ref) == platform) {
				return index
			}
		};
		
		let hull = Hull__create (
			utf8 (b"playing"),
			platform,
			vector::empty<Text>()
		);
		
		vector::push_back (&mut hulls.hulls, hull);
		
		let index = vector::length (& hulls.hulls) - 1;
		index
	}
	//
	//	[Constant]
	//
	//
	friend fun Hulls__Hull__retrieve_status (platform : String) : String acquires Hulls {
		let index_of_hull = search_for_index_of_hull (platform);
		
		let hulls_key_mref = borrow_global_mut<Hulls>(Module_Producer::obtain_address ());
		let hulls_mref = &mut hulls_key_mref.hulls;
		let hull_mref : &mut Hull = vector::borrow_mut (hulls_mref, index_of_hull);
		
		Hull__retrieve_status (hull_mref)
	}
	friend fun search_for_index_of_hull (platform : String) : u64 acquires Hulls {
		/*
		
		
		*/
		
		
		let hulls = borrow_global<Hulls>(Module_Producer::obtain_address ());
		
		let hulls_length = vector::length (& hulls.hulls);
		for (index in 0..hulls_length) {
			let hull_ref = vector::borrow (& hulls.hulls, index);
			if (Hull__retrieve_platform (hull_ref) == platform) {
				return index
			}
		};
		
		abort 1
	}
	friend fun search_for_index_of_hull_v2 (platform : String) : (bool, u64) acquires Hulls {
		/*
			let (exists, index_of_hull) = search_for_index_of_hull_v2 (platform);
			if (exists != true) {
				return hull_texts_envelope
			};
		*/
		
		let hulls = borrow_global<Hulls>(Module_Producer::obtain_address ());
		
		let hulls_length = vector::length (& hulls.hulls);
		for (index in 0..hulls_length) {
			let hull_ref = vector::borrow (& hulls.hulls, index);
			if (Hull__retrieve_platform (hull_ref) == platform) {
				return (true, index)
			}
		};
		
		(false, 0)
	}
	friend fun Retrieve_Texts_Between (
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
		
		let hulls = borrow_global<Hulls>(Module_Producer::obtain_address ());
		let hull_ref : & Hull = vector::borrow (& hulls.hulls, index_of_hull);
		let hull_texts = & Hull__retrieve_texts (hull_ref);
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
	////////
	
	
	////////
	//
	//	Texts: 
	//		[Constants]
	//
	friend fun Retrieve_Count_of_Texts (platform : String) : u64 acquires Hulls {
		//
		//	if hull not found, 
		//
		let (exists, index_of_hull) = search_for_index_of_hull_v2 (platform);
		if (exists != true) {
			return 0
		};
		
		let hulls = borrow_global<Hulls>(Module_Producer::obtain_address ());
		let hull_ref : & Hull = vector::borrow (& hulls.hulls, index_of_hull);
		let hull_texts = & Hull__retrieve_texts (hull_ref);
		
		vector::length (hull_texts)
	}
	friend fun Retrieve_Texts (platform : String) : vector<Text_Envelope> acquires Hulls {
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
		
		let hulls = borrow_global<Hulls>(Module_Producer::obtain_address ());
		let hull_ref : & Hull = vector::borrow (& hulls.hulls, index_of_hull);
		let hull_texts = & Hull__retrieve_texts (hull_ref);
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
	
	//
	//
	//	[Flux]
	//
	friend fun Send_Text (
		writer : & signer,
		text : String,
		platform : String
	) acquires Hulls {
		use aptos_framework::coin;
		use aptos_framework::aptos_coin::{ Self, AptosCoin };
		
		////
		//
		//	Rules
		//
		//
		if (string::length (& text) > 100) {
			abort Limiter_Text_String_needs_to_be_less_than_one_hundred_characters
		};
		//
		////
		
		let writer_address = signer::address_of (writer);
		let producer_address = Module_Producer::obtain_address ();
		
		let index_of_hull = search_or_begin_hull (platform);
		let hulls_mref = borrow_global_mut<Hulls>(producer_address);
		let hull_mref : &mut Hull = vector::borrow_mut (&mut hulls_mref.hulls, index_of_hull);
		let price_of_text_in_octas = hulls_mref.price_of_text_in_octas;
	
		////
		//
		//	Deduct 1 APT
		//		* Ensure Consenter has >= 1 * "amount_of_plays_to_buy" APT.
		//		* Deduct the APT
		//
		if (coin::balance<AptosCoin>(writer_address) < price_of_text_in_octas) { 
			abort Limiter_writer_has_less_than_the_amount_of_Octas_necessary_to_send
		};
		coin::transfer<AptosCoin>(writer, producer_address, price_of_text_in_octas);
		//
		////
		
		let hull_texts = Hull__mut_retrieve_texts (hull_mref);
		for (index in 0..vector::length (hull_texts)) {
			let text_mref = vector::borrow_mut (hull_texts, index);
			if (Text__retrieve_writer_address (text_mref) == writer_address) {
				//
				//	The writer already has a text on this platform,
				//	therefore a text modification occurs.
				//
				Text__change_text (text_mref, text);
				Text__change_now_seconds (text_mref);
				return;
			}
		};
		
		//
		//	The writer does not have a text on this platform,
		//	therefore a text is written.
		//
		let this_text = Text__create (writer_address, text);
		vector::push_back (hull_texts, this_text);
	}
	friend fun Delete_Text (consenter : & signer, platform : String) acquires Hulls {
		let writer_address = signer::address_of (consenter);		
		
		let index_of_hull = search_for_index_of_hull (platform);
		let hulls = borrow_global_mut<Hulls>(Module_Producer::obtain_address ());
		let hull_ref : &mut Hull = vector::borrow_mut (&mut hulls.hulls, index_of_hull);

		let hull_texts = Hull__mut_retrieve_texts (hull_ref);
		for (index in 0..vector::length (hull_texts)) {
			let text_ref = vector::borrow_mut (hull_texts, index);
			if (Text__retrieve_writer_address (text_ref) == writer_address) {
				vector::remove (hull_texts, index);
				return;
			}
		};
		
		abort 260141
	}
	friend fun Producer_Text_Delete_with_Refund (
		consenter : & signer,
		writer_address : address,
		platform : String,
		octas_refund : u64
	) acquires Hulls {
		use aptos_framework::coin;
		use aptos_framework::aptos_coin::{ Self, AptosCoin };
		
		Producer_Delete_Text (consenter, writer_address, platform);
		
		if (octas_refund > 100000000) { 
			abort Limiter_Refund_must_be_1_apt_or_fewer
		};
		
		////
		//
		//	Deduct Refund Octas
		//		* Ensure Consenter has >= 1 * "amount_of_plays_to_buy" APT.
		//		* Deduct the APT
		//
		if (coin::balance<AptosCoin>(writer_address) < octas_refund) { 
			abort Limiter_writer_has_less_than_the_amount_of_Octas_necessary_to_send
		};
		coin::transfer<AptosCoin>(consenter, writer_address, octas_refund);
		//
		////
	}
	friend fun Producer_Delete_Text (
		consenter : & signer,
		writer_address : address,
		platform : String 
	) acquires Hulls {
		ensure_consenter_is_producer (consenter);
		
		let producer_address = Module_Producer::obtain_address ();
		
		let index_of_hull = search_for_index_of_hull (platform);
		let hulls = borrow_global_mut<Hulls>(producer_address);
		let hull_mref : &mut Hull = vector::borrow_mut (&mut hulls.hulls, index_of_hull);
		
		let hull_texts = Hull__mut_retrieve_texts (hull_mref);
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
	////////
	

	
	////////
	//
	//	Text_Envelope
	//		[Constants]
	//
	public fun Text_Envelope_Text (envelope: & Text_Envelope) : String {
		envelope.text
	}
	//
	////////


}