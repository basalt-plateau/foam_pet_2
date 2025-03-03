



/*
	Is between UTC span?
*/
module Builder_01::Rhythm {
	friend Builder_01::Module_Hulls;
	
	use std::string::{ String, utf8 };

	#[view] public fun Volitions () : String { 
		use Builder_01::Rules_Module::{ Volitions_01 }; Volitions_01 ()
	}
	
	public fun is_between_seconds () : String { 
		utf8 (b"perhaps")
	}
}