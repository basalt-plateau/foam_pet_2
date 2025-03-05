





module Builder_01::Module_Text_Envelope {
	#[view] public fun Volitions () : std::string::String { 
		use Builder_01::Rules_Module::{ Volitions_01 }; Volitions_01 ()
	}
	
	
	use std::string::{ String };

	
	////
	//
	struct Text_Envelope has store, drop {
		writer_address : address,
		writer_balance : u64,
		text : String,
		
		sent_at_index: u64,
		
		now_seconds : u64
	}
	//
	////
	
	friend fun Text_Envelope__create (
		writer_address : address,
		writer_balance : u64,
		text : String,
		sent_at_index : u64,
		now_seconds : now_seconds
	) : Text {
		let text = Text {
			writer_address : writer_address,
			writer_balance : writer_balance,
			text : text,
			sent_at_index : sent_at_index,
			now_seconds : now_seconds
		};
		text
	}
	
	public fun Text_Envelope__retrieve_text (envelope: & Text_Envelope) : String {
		envelope.text
	}
	public fun Text_Envelope__retrieve_writer_address (envelope: & Text_Envelope) : address {
		envelope.writer_address
	}
	/*
		Builder_01::Module_Text_Envelope::Text_Envelope__retrieve_sent_at_index ()
	*/
	public fun Text_Envelope__retrieve_sent_at_index (envelope: & Text_Envelope) : u64 {
		envelope.sent_at_index
	}
	
	
}