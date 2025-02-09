





module Builder_01::Text_Module {
	friend Builder_01::Hulls_Module;
	
	use std::string::{ String };

	use aptos_framework::timestamp;


	#[view] public fun Volitions () : String { 
		use Builder_01::Rules_Module::{ Volitions_01 }; Volitions_01 ()
	}
	
	////
	//
	struct Text has store, drop {
		writer_address : address,
		text : String,
		now_seconds : u64
	}
	//
	////
	
	////
	//
	friend fun Text__create (
		writer_address : address,
		text : String
	) : Text {
		let text = Text {
			writer_address : writer_address,
			text : text,
			now_seconds : timestamp::now_seconds ()
		};
		text
	}
	//
	////
	
	////
	//
	//	change
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
	//
	////
	
	////
	//
	//	retrieve
	//
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