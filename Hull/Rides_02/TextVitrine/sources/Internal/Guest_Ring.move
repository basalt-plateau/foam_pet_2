

module Builder_01::Room_Guest_Ring {
	
	use std::string::{ String };

	#[view] public fun Volitions () : String { 
		use Builder_01::Rules_Module; Rules_Module::Volitions_01 () 
	}
	
	struct Medallion has store, drop {

	}
	
	
	
	
	
}