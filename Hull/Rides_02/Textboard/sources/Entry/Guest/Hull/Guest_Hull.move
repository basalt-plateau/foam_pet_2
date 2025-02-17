






module Builder_01::Module_Guest_Hull {
	use std::string::{ String, utf8 };

	#[view] public fun Volitions () : String { 
		use Builder_01::Rules_Module::{ Volitions_01 }; Volitions_01 ()
	}
	
	
}



