




module builder_1::Peptyde_01_Boats {

	use std::signer;
	use std::string::{ String, utf8 };
	
	use builder_1::Rules_09;
	
	#[view]
	public fun Volitions () : String {
		Rules_09::Volitions_01 ()
	}
	
	struct Boat has store {}
	

}