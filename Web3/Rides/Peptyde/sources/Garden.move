




module builder_1::Peptyde_01_Garden {
	
	use std::string::{ String };
	
	use builder_1::Rules_09;
	
	#[view]
	public fun Volitions () : String {
		Rules_09::Volitions_01 ()
	}
	

}