





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
	struct Text has store, drop, copy {
		writer_address : address,
		text : String,
		
		index: u64,
		
		now_seconds : u64
	}
	//
	////
	
	////
	//
	friend fun Text__create (
		writer_address : address,
		text : String,
		index : u64
	) : Text {
		let text = Text {
			writer_address : writer_address,
			text : text,
			index : index,
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
	//
	////
	
	////
	//
	//	public: retrieve
	//
	friend fun Text__retrieve_writer_address (text : & Text) : address {
		text.writer_address
	}
	friend fun Text__retrieve_text (text : & Text) : String {
		text.text
	}
	friend fun Text__retrieve_now_seconds (text : & Text) : u64 {
		text.now_seconds
	}
	//
	////
	
	
	
	
	
	
}