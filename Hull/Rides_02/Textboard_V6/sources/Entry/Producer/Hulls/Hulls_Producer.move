



module Builder_01::Module_Producer_Hulls {
	
	use std::string::{ String, utf8 };

	use Builder_01::Module_Hulls;
	use Builder_01::Module_Producer::{ Self, ensure_consenter_is_producer };
	
	#[view] public fun Volitions () : String { 
		use Builder_01::Rules_Module::{ Volitions_01 }; Volitions_01 ()
	}
	

	////
	//
	//	Entry Flux: 
	//		Begin and Delete 
	//
	public entry fun Begin (acceptor : & signer) {
		ensure_consenter_is_producer (acceptor);
		Module_Hulls::Begin_Hulls (acceptor);
	}
	public entry fun Delete (acceptor : & signer) {
		ensure_consenter_is_producer (acceptor);
		Module_Hulls::Hulls_Delete (acceptor);
	}
	//
	////

	////
	//
	//	Entry Flux: 
	//		Status 
	//
	public entry fun Pause (acceptor : & signer) {
		ensure_consenter_is_producer (acceptor);
		Module_Hulls::Hulls_Change_Status (acceptor, utf8 (b"paused"));
	}
	public entry fun Play (acceptor : & signer) {
		ensure_consenter_is_producer (acceptor);
		Module_Hulls::Hulls_Change_Status (acceptor, utf8 (b"playing"));
	}
	//
	////
	
	
	/*
		Perhaps if not fed, the platform can be deleted...
	*/
	public entry fun Feed (acceptor : & signer) {
		ensure_consenter_is_producer (acceptor);
	}
}