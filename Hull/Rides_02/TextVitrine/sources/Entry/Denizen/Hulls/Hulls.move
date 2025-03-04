










module Builder_01::Module_Denizen_Hulls {
	use std::string::{ String, utf8 };
	use std::vector;

	use Builder_01::Module_Hulls;
	use Builder_01::Module_Guest_Hull;
	
	#[view] public fun Volitions () : String { 
		use Builder_01::Rules_Module::{ Volitions_01 }; Volitions_01 ()
	}
	
	/*
		Module_Denizen_Texts::Delete_Text (acceptor, utf8 (b""))
	*/
	public entry fun Delete_Hulls (denizen : & signer) {
		//
		//	if duration: 24 * 500
		// 	then anyone can delete the hulls.
		//
		
		
		
		
	}
}