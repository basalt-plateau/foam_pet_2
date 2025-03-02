



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
	public entry fun Begin (acceptor : & signer) {
		Module_Hulls::Begin_Hulls (acceptor);
	}
	public entry fun Pause (acceptor : & signer) {
		Module_Hulls::Hulls_Change_Status (acceptor, utf8 (b"paused"));
	}
	public entry fun Play (acceptor : & signer) {
		Module_Hulls::Hulls_Change_Status (acceptor, utf8 (b"playing"));
	}
	//
	////
	
	public entry fun Feed (acceptor : & signer) {
		
	}
}