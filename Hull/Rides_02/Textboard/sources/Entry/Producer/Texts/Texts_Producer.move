





module Builder_01::Module_Producer_Texts {
	use std::string::{ String };
	
	use Builder_01::Module_Hulls;
	
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
	//
	////
	
	
}