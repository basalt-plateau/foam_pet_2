





module Builder_01::Ruler_Text_Delete {
	
	#[view] public fun Volitions () : std::string::String { 
		Builder_01::Rules_Module::Volitions_01 () 
	}	
	

	#[test] public fun Vow () {	
		use std::vector;
		use std::string::{ String, utf8 };
		
		use Builder_01::Module_Ruler_Hulls;
		use Builder_01::Module_Ruler_Texts;
		use Builder_01::Module_Denizen_Texts;
		use Builder_01::Module_Guest_Hulls;
		use Builder_01::Module_Guest_Hull;		
		use Builder_01::Module_Guest_Texts;
		use Builder_01::Module_Hulls; 
		use Builder_01::Vow_Parts_01;
	
		let aptos_framework_acceptance : signer = aptos_framework::account::create_account_for_test (@0x1);
		
		let ruler_01_consenter : & signer = & aptos_framework::account::create_account_for_test (@Ruler_01);
		let ruler_address = std::signer::address_of (ruler_01_consenter);
	
		let one_APT : u64 = 100000000; 
		let octas_to_mint : u64 = one_APT * 100;
		
		let venue = Builder_01::Vow_Parts_Embark::Produce (
			& aptos_framework_acceptance, 
			octas_to_mint,
			ruler_01_consenter
		);
		
		
		let (texter_01_address, texter_01_acceptance) = Builder_01::Nurture__Milieu::Embark (@0x100000);
		aptos_framework::coin::transfer<aptos_framework::aptos_coin::AptosCoin>(
			ruler_01_consenter, 
			texter_01_address, 
			one_APT * 10
		);
		
		let (texter_02_address, texter_02_acceptance) = Builder_01::Nurture__Milieu::Embark (@0x100000);
		
		
		Module_Ruler_Hulls::Begin (ruler_01_consenter);
		
		
		////
		//
		//	Send Text
		//
		//
		let text_01_text : String = utf8 (b"This is a text.");
		let text_01_platform : String = utf8 (b"");		
		Module_Denizen_Texts::Send_Text (
			& texter_01_acceptance, 
			text_01_text, 
			text_01_platform, 
			utf8 (b"I accept.")
		);
		
		//
		////
		

		////
		//
		//	Ensure text exists
		//
		//
		let texts : vector<Module_Hulls::Text_Envelope> = Module_Guest_Hull::Retrieve_Texts (text_01_platform);
		assert! (vector::length (& texts) == 1, 1);	
		
		let text_00 = vector::borrow (& texts, 0);
		
		std::debug::print (& std::string_utils::format1 (
			& b"Text Envelope Index: {}", 
			Builder_01::Module_Hulls::Text_Envelope__retrieve_envelope_index (text_00)
		));
		
		let envelope_index = Builder_01::Module_Hulls::Text_Envelope__retrieve_envelope_index (text_00);
		assert! (Module_Hulls::Text_Envelope_Text (text_00) == utf8 (b"This is a text."), 1);
		assert! (Builder_01::Module_Hulls::Text_Envelope__retrieve_envelope_index (text_00) == 0, 1);
		//
		////
		
		////
		//
		//	Ruler Delete Text
		//
		//
		Module_Ruler_Texts::Delete_with_Refund_by_Send_Index (
			ruler_01_consenter,
			utf8 (b""),
			0,
			100000000
		);
		assert! (vector::length (& Module_Guest_Hull::Retrieve_Texts (text_01_platform)) == 0, 1);	
		//
		////

		
		Builder_01::Vow_Parts_Embark::Expire (& aptos_framework_acceptance, venue);
	}

	
}