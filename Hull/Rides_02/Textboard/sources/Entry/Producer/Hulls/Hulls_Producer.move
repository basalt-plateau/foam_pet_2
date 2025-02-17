



module Builder_01::Module_Producer_Hulls {

	use std::string::{ String, utf8 };

	use Builder_01::Module_Hulls;


	#[view] public fun Volitions () : String { 
		use Builder_01::Rules_Module::{ Volitions_01 }; Volitions_01 ()
	}
	

	////
	//
	//	Entry Flux: 
	//		Status 
	//
	public entry fun Begin (consenter : & signer) {
		Module_Producer_Hulls::Begin (consenter);
	}
	//
	////
}