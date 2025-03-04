





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
		Each text has a envelope_index (send_index) that corresponds to when it was
		sequentially added to the vector.
		
		If a text is deleted, the envelope_index of later and previous texts don't change.
	*/
	struct Text has store, drop, copy {
		writer_address : address,
		text : String,
		
		envelope_index: u64,
		
		now_seconds : u64
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
			envelope_index : envelope,
			now_seconds : timestamp::now_seconds ()
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
	friend fun Text__change_now_seconds (text : &mut Text) {
		text.now_seconds = timestamp::now_seconds ();
	}
	friend fun Text__change_envelope_index (text : &mut Text, envelope_index : u64) {
		text.envelope_index = envelope_index;
	}
	//
	////
	
	////
	//
	//	public: retrieve
	//
	/*
		let envelope_index = Builder_01::Text_Module::Text__retrieve_envelope_index (& text);
	*/
	public fun Text__retrieve_envelope_index (text : & Text) : u64 {
		text.envelope_index
	}
	public fun Text__retrieve_writer_address (text : & Text) : address {
		text.writer_address
	}
	public fun Text__retrieve_text (text : & Text) : String {
		text.text
	}
	public fun Text__retrieve_now_seconds (text : & Text) : u64 {
		text.now_seconds
	}
	//
	////
	
	
	
	
	
	
}