





module Builder_01::Hulls_can_text_to_front {
	use std::string::{ String };
	
	#[view] public fun Volitions () : String { 
		use Builder_01::Rules_Module;
		Rules_Module::Volitions_01 () 
	}
	
	
	#[test_only]
	public fun Vow () {	
		use std::vector;
		use std::string::{ utf8 };
		use std::signer;
		
		use aptos_framework::coin;
		use aptos_framework::aptos_coin::AptosCoin;
		use aptos_framework::account;		
		
		use Builder_01::Module_Ruler_Hulls;
		use Builder_01::Module_Denizen_Texts;
		use Builder_01::Module_Guest_Hulls;
		use Builder_01::Module_Guest_Hull;
		use Builder_01::Module_Guest_Texts;
		
		use Builder_01::Module_Hulls; 
		
		use Builder_01::Vow_Parts_01; 

		let aptos_framework_consenter : signer = account::create_account_for_test (@0x1);
		let ruler_01_consenter : & signer = & account::create_account_for_test (@Ruler_01);
		let writer_01_consenter : & signer = & account::create_account_for_test (@0x100000);
		let writer_02_consenter : & signer = & account::create_account_for_test (@0x100001);

		let one_APT : u64 = 100000000; 
		let apt_mint : u64 = one_APT * 100;
		
		let ruler_address = signer::address_of (ruler_01_consenter);
		Vow_Parts_01::clock (& aptos_framework_consenter);
		
		let (burn_cap, freeze_cap, mint_cap) = Vow_Parts_01::origin (& aptos_framework_consenter);
		let coins = coin::mint<AptosCoin>(apt_mint, & mint_cap);
		account::create_account_for_test (ruler_address);
		coin::register<AptosCoin>(ruler_01_consenter);
		coin::deposit (ruler_address, coins);
		
		
		
		////
		//
		//	writers:
		//		
		//
		let writer_01_address = signer::address_of (writer_01_consenter);
		account::create_account_for_test (writer_01_address);
		coin::register<AptosCoin>(writer_01_consenter);
		//
		let writer_02_address = signer::address_of (writer_02_consenter);
		account::create_account_for_test (writer_02_address);
		coin::register<AptosCoin>(writer_02_consenter);
		//
		coin::transfer<AptosCoin>(ruler_01_consenter, writer_01_address, one_APT * 10);
		//
		////
		
		////
		//
		//	Hull Begin
		//
		//
		assert! (Module_Guest_Hulls::are_built () == utf8 (b"no"), 1);
		Module_Ruler_Hulls::Begin (ruler_01_consenter);
		assert! (Module_Guest_Hulls::are_built () == utf8 (b"yup"), 1);
		//
		////
		
		
		////
		//
		//	Send Text
		//
		//
		let text_01_text : String = utf8 (b"This is a text.");
		let text_01_platform : String = utf8 (b"");		
		Module_Denizen_Texts::Send_Text (
			writer_01_consenter,
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
		let text_ref = vector::borrow (& texts, 0);
		assert! (vector::length (& texts) == 1, 1);		
		assert! (Module_Hulls::Text_Envelope_Text (text_ref) == utf8 (b"This is a text."), 1);
		//
		////
		
		////
		//
		//	Delete Text
		//
		//
		Module_Denizen_Texts::Delete_Text (writer_01_consenter, text_01_platform);
		assert! (vector::length (& Module_Guest_Hull::Retrieve_Texts (text_01_platform)) == 0, 1);	
		//
		////

		
		////
		//
		//	After Party
		//
		coin::destroy_mint_cap (mint_cap);
		coin::destroy_freeze_cap (freeze_cap);
		coin::destroy_burn_cap (burn_cap);
		//
		////
	}

	
}