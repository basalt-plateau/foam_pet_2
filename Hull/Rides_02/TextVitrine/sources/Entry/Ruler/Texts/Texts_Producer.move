





module Builder_01::Module_Ruler_Texts {
	use std::string::{ String };
	
	use Builder_01::Module_Hulls;
	use Builder_01::Module_Ruler::{ Self, ensure_consenter_is_ruler };
	
	#[view] public fun Volitions () : String { 
		use Builder_01::Rules_Module::{ Volitions_01 }; Volitions_01 ()
	}
	
	
	////
	//
	//	Entry Flux: 
	//		Status 
	//
	
	/*
	public entry fun Delete (
		acceptor : & signer, 
		writer_address : address, 
		platform_name : String
	) {
		Module_Hulls::Ruler_Delete_Text (acceptor, writer_address, platform_name);
	}
	public entry fun Delete_with_Refund (
		acceptor : & signer, 
		writer_address : address, 
		platform_name : String,
		octas_refund : u64
	) {
		Module_Hulls::Ruler_Text_Delete_with_Refund (
			acceptor, 
			writer_address, 
			platform_name, 
			octas_refund
		);
	}
	*/
	
	
	/*
		Delete_with_Refund_by_index (acceptor, utf8 (b""), 0, 100000000)
	*/
	public entry fun Delete_with_Refund_by_index (
		acceptor : & signer, 
		platform_name : String,
		index_of_text : u64, 
		octas_refund : u64
	) {
		ensure_consenter_is_ruler (acceptor);
		Module_Hulls::Ruler_Text_Delete_with_Refund_at_Index (
			acceptor, 
			platform_name, 
			index_of_text, 
			octas_refund
		);
	}
	//
	////
	
	
}