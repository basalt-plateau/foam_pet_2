

module Builder_01::Hull_Module_Producer {
	use std::string::{ String };
	use aptos_framework::timestamp;

	#[view] public fun Volitions () : String { 
		use Builder_01::Rules_Module::{ Volitions_01 }; Volitions_01 ()
	}
	
		
}