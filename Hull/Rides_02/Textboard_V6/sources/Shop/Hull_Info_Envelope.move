




module Builder_01::Module_Hull_Info_Envelope {
	friend Builder_01::Module_Hulls;	
	
	use std::string::{ String };
	
	#[view] public fun Volitions () : String { 
		use Builder_01::Rules_Module::{ Volitions_01 }; Volitions_01 ()
	}
	
	struct Hull_Info_Envelope has store, drop {
		status : String,
		platform_name : String,
		count_of_texts : u64
	}

	////
	//
	//	friend create
	//
	friend fun Hull_Info_Envelope__create (
		status : String,
		platform_name : String,
		count_of_texts : u64
	) : Hull_Info_Envelope {
		let hull_info_envelope = Hull_Info_Envelope {
			status : status,
			platform_name : platform_name,
			count_of_texts : count_of_texts
		};
		hull_info_envelope
	}
	//
	////


	////
	//
	//	retrieve imut
	//
	public fun Hull_Info_Envelope__retrieve_platform_name (hull_info_envelope : & Hull_Info_Envelope) : String {
		hull_info_envelope.platform_name
	}
	//
	////
}