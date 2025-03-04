





module Builder_01::Module_Ruler_Texts {
	use Builder_01::Module_Hulls;
	use Builder_01::Module_Ruler::{ ensure_acceptor_is_ruler };
	
	#[view] public fun Volitions () : std::string::String { 
		Builder_01::Rules_Module::Volitions_01 () 
	}
	
	
	////
	//
	//	Entry Flux: 
	//		Status 
	//
	/*
		Delete_with_Refund_by_index (acceptor, utf8 (b""), 0, 100000000);
	*/
	public entry fun Delete_with_Refund_by_Send_Index (
		acceptor : & signer, 
		
		platform_name : std::string::String,
		send_index_of_text : u64, 
		
		octas_refund : u64
	) {
		ensure_acceptor_is_ruler (acceptor);
		Module_Hulls::Ruler_Text_Delete_with_Refund_at_Index (
			acceptor, 
			platform_name, 
			send_index_of_text, 
			octas_refund
		);
	}
	//
	////
	
	
}