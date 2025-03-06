





module Builder_01::Module_Text_Envelope {
	friend Builder_01::Module_Hulls;

	
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
		
		seconds_IX_planet_3_roughly : u64
	}
	//
	////
	
	friend fun Text_Envelope__create (
		writer_address : address,
		writer_balance : u64,
		text : String,
		sent_at_index : u64,
		seconds_IX_planet_3_roughly : u64
	) : Text_Envelope {
		let text_envelope = Text_Envelope {
			writer_address : writer_address,
			writer_balance : writer_balance,
			text : text,
			sent_at_index : sent_at_index,
			seconds_IX_planet_3_roughly : seconds_IX_planet_3_roughly
		};
		text_envelope
	}
	
	/*
		Builder_01::Module_Text_Envelope::Text_Envelope__retrieve_sent_at_index (& text_envelope)
	*/
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
	
	
	/*
		Builder_01::Module_Text_Envelope::display (text_envelope);
	*/
	public fun display (text_envelope : & Text_Envelope) {
		std::debug::print (& std::string_utils::format1 (
			& b"Text Envelope address: {}", 
			text_envelope.writer_address
		));
		std::debug::print (& std::string_utils::format1 (
			& b"Text Envelope address: {}", 
			text_envelope.writer_balance
		));
		std::debug::print (& std::string_utils::format1 (
			& b"Text Envelope text: {}", 
			text_envelope.text
		));
		std::debug::print (& std::string_utils::format1 (
			& b"Text Envelope sent_at_index: {}", 
			text_envelope.sent_at_index
		));
		std::debug::print (& std::string_utils::format1 (
			& b"Text Envelope seconds_IX_planet_3_roughly: {}", 
			text_envelope.seconds_IX_planet_3_roughly
		));
	}
	
}