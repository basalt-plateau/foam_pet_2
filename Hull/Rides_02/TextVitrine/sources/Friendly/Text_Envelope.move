





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
		use std::vector;
		use std::string::{ utf8 };
		
		let line_01 = utf8 (b"");
		std::string::append_utf8 (&mut line_01, b"Text Envelope: ");
		std::string::append_utf8 (&mut line_01, b"\n  writer_address: ");
		std::string::append (
			&mut line_01, 
			std::string_utils::to_string_with_canonical_addresses (& text_envelope.writer_address)
		);
		std::string::append_utf8 (&mut line_01, b"\n  text: ");
		std::string::append (&mut line_01, text_envelope.text);
		std::string::append_utf8 (&mut line_01, b"\n  sent_at_index: ");
		std::string::append (
			&mut line_01, 
			std::string_utils::to_string (& text_envelope.sent_at_index)
		);
		std::string::append_utf8 (&mut line_01, b"\n  seconds_IX_planet_3_roughly: ");
		std::string::append (
			&mut line_01, 
			std::string_utils::to_string (& text_envelope.seconds_IX_planet_3_roughly)
		);
		std::string::append_utf8 (&mut line_01, b"\n");
		std::debug::print (& std::string_utils::format1 (
			& b"{}", 
			line_01
		));
	}
	
}