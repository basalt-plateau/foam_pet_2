


module Builder_01::Hull_Module {
	friend Builder_01::Hull_Module_Producer;	
	friend Builder_01::Hulls_Module;
	
	use std::string::{ String, utf8 };
	use aptos_framework::timestamp;	
	
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

	const Ending__Hull_is_not_playing : u64 = 9937483;


	/*
		task:
			ensure status is:
				playing
				paused
	*/
	struct Hull has store, drop {
		status : String,
		platform : String,
		texts : vector<Text>,
		created_at_now_seconds : u64
	}
	
	#[view] public fun Volitions () : String { 
		use Builder_01::Rules_Module::{ Volitions_01 }; Volitions_01 ()
	}
	
	////
	//
	friend fun Hull__create (
		status : String,
		platform : String,
		texts : vector<Text>
	) : Hull {
		let hull = Hull {
			status : status,
			platform : platform,
			texts : texts,
			created_at_now_seconds : timestamp::now_seconds ()
		};
		hull
	}
	//
	////
	
	////
	//
	//	change
	//
	public fun Hull__change_status (hull : &mut Hull, status : String) {
		hull.status = status;
	}
	//
	////
	
	////
	//
	//	ensure
	//
	public fun Hull__ensure_is_playing (hull : & Hull) {
		if (hull.status != utf8 (b"playing")) {
			abort Ending__Hull_is_not_playing
		}
	}
	//
	////
	
	////
	//
	//	retrieve mut
	//
	public fun Hull__mut_retrieve_texts (hull : &mut Hull) : &mut vector<Text> {
		&mut hull.texts
	}
	
	//
	////
	
	
	////
	//
	//	retrieve imut
	//
	public fun Hull__retrieve_texts (hull : & Hull) : vector<Text> {
		hull.texts
	}
	public fun Hull__retrieve_status (hull : & Hull) : String {
		hull.status
	}
	public fun Hull__retrieve_platform (hull : & Hull) : String {
		hull.platform
	}
	public fun Hull__retrieve_created_at_now_seconds (hull : & Hull) : u64 {
		hull.created_at_now_seconds
	}
	//
	////
}