





module Builder_01::Text_Module {
	friend Builder_01::Module_Hulls;
	friend Builder_01::Module_Hull;
	
	use std::string::{ String };
	use aptos_framework::timestamp;

	#[view] public fun Volitions () : String { 
		use Builder_01::Rules_Module::{ Volitions_01 }; Volitions_01 ()
	}
	
	////
	//
	/*
		Each text has a sent_at_index (send_index) that corresponds to when it was
		sequentially added to the vector.
		
		If a text is deleted, the sent_at_index of later and previous texts don't change.
	*/
	struct Text has store, drop, copy {
		writer_address : address,
		text : String,
		
		sent_at_index: u64,
		
		seconds_IX_planet_3 : u64
	}
	//
	////
	
	////
	//
	friend fun Text__create (
		writer_address : address,
		text : String,
		envelope : u64
	) : Text {
		let text = Text {
			writer_address : writer_address,
			text : text,
			sent_at_index : envelope,
			seconds_IX_planet_3 : timestamp::now_seconds ()
		};
		text
	}
	//
	////
	
	////
	//
	//	friend: flux
	//
	friend fun Text__change_writer_address (text : &mut Text, writer_address : address) {
		text.writer_address = writer_address;
	}
	friend fun Text__change_text (text : &mut Text, text_string : String) {
		text.text = text_string;
	}
	friend fun Text__change_seconds_IX_planet_3 (text : &mut Text) {
		text.seconds_IX_planet_3 = timestamp::now_seconds ();
	}
	friend fun Text__change_sent_at_index (text : &mut Text, sent_at_index : u64) {
		text.sent_at_index = sent_at_index;
	}
	//
	////
	
	////
	//
	//	public: retrieve
	//
	/*
		let sent_at_index = Builder_01::Text_Module::Text__retrieve_sent_at_index (& text);
	*/
	public fun Text__retrieve_sent_at_index (text : & Text) : u64 {
		text.sent_at_index
	}
	public fun Text__retrieve_writer_address (text : & Text) : address {
		text.writer_address
	}
	public fun Text__retrieve_text (text : & Text) : String {
		text.text
	}
	public fun Text__retrieve_seconds_IX_planet_3 (text : & Text) : u64 {
		text.seconds_IX_planet_3
	}
	//
	////
	
	
	
	
	
	
}