


module Builder_01::Module_Hull {
	friend Builder_01::Module_Producer_Hull;	
	friend Builder_01::Module_Hulls;
	
	use std::vector;	
	use std::string::{ String, utf8 };
	
	use aptos_framework::timestamp;	
	
	use Builder_01::Text_Module::{
		Text
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

		index_of_hull: u64,
		index_of_next_text : u64,

		created_at_now_seconds : u64
	}
	
	#[view] public fun Volitions () : String { 
		use Builder_01::Rules_Module::{ Volitions_01 }; Volitions_01 ()
	}
	
	////
	//
	//	friend create
	//
	friend fun Hull__create (
		status : String,
		platform : String,
		texts : vector<Text>,
		index_of_hull : u64
	) : Hull {
		let index_of_next_text = 0;
		
		let hull = Hull {
			status : status,
			platform : platform,
			texts : texts,
			
			index_of_hull,
			index_of_next_text : index_of_next_text,
			
			created_at_now_seconds : timestamp::now_seconds ()
		};
		hull
	}
	//
	////
	
	////
	//
	//	friend changes
	//
	friend fun Hull__change_status (hull : &mut Hull, status : String) {
		hull.status = status;
	}
	friend fun Hull__delete_texts (hull : &mut Hull) {
		hull.texts = vector::empty<Text>();
	}
	//
	////
	
	
	////
	//
	//	ensure
	//
	friend fun Hull__ensure_is_playing (hull : & Hull) {
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
	friend fun Hull__mut_retrieve_texts (hull : &mut Hull) : &mut vector<Text> {
		&mut hull.texts
	}
	//
	////
	
	
	////
	//
	//	retrieve imut
	//
	friend fun Hull__retrieve_index_of_next_text (hull : & Hull) : u64 {
		hull.index_of_next_text
	}
	friend fun Hull__retrieve_texts (hull : & Hull) : vector<Text> {
		hull.texts
	}
	friend fun Hull__retrieve_count_of_texts (hull : & Hull) : u64 {
		vector::length (& hull.texts)
	}
	friend fun Hull__retrieve_status (hull : & Hull) : String {
		hull.status
	}
	friend fun Hull__retrieve_platform (hull : & Hull) : String {
		hull.platform
	}
	friend fun Hull__retrieve_created_at_now_seconds (hull : & Hull) : u64 {
		hull.created_at_now_seconds
	}
	//
	////
}