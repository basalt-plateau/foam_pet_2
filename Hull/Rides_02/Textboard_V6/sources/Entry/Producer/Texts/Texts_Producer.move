





module Builder_01::Module_Producer_Texts {
	use std::string::{ String };
	
	use Builder_01::Module_Hulls;
	use Builder_01::Module_Producer::{ Self, ensure_consenter_is_producer };
	
	#[view] public fun Volitions () : String { 
		use Builder_01::Rules_Module::{ Volitions_01 }; Volitions_01 ()
	}
	
	
	////
	//
	//	Entry Flux: 
	//		Status 
	//
	public entry fun Delete (
		consenter : & signer, 
		writer_address : address, 
		platform_name : String
	) {
		Module_Hulls::Producer_Delete_Text (consenter, writer_address, platform_name);
	}
	public entry fun Delete_with_Refund (
		consenter : & signer, 
		writer_address : address, 
		platform_name : String,
		octas_refund : u64
	) {
		Module_Hulls::Producer_Text_Delete_with_Refund (
			consenter, 
			writer_address, 
			platform_name, 
			octas_refund
		);
	}
	
	public entry fun Delete_with_Refund_by_index (
		consenter : & signer, 
		platform_name : String,
		index_of_text : u64, 
		octas_refund : u64
	) {
		ensure_consenter_is_producer (consenter);
		Module_Hulls::Producer_Text_Delete_with_Refund_at_Index (
			consenter, 
			platform_name, 
			index_of_text, 
			octas_refund
		);
	}
	//
	////
	
	
}