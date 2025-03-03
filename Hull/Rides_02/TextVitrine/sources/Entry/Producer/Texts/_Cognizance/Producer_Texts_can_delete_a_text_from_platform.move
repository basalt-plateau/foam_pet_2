





module Builder_01::Producer_Texts_can_delete_a_text_from_platform {
	use std::string::{ String };
	
	#[view] public fun Volitions () : String { 
		use Builder_01::Rules_Module;
		Rules_Module::Volitions_01 () 
	}
	
	
	#[test] 
	public fun Congizance__Producer_Texts_can_delete_a_text_from_platform () {	
		use std::vector;
		use std::string::{ utf8 };
		use std::signer;
		
		use aptos_framework::coin;
		use aptos_framework::aptos_coin::AptosCoin;
		use aptos_framework::account;		
		
		use Builder_01::Module_Producer_Hulls;
		use Builder_01::Module_Producer_Texts;
		use Builder_01::Module_Guest_Hulls;
		use Builder_01::Module_Guest_Hull;
		use Builder_01::Module_Guest_Texts;
		use Builder_01::Module_Hulls; 
		use Builder_01::Vow_Parts_01; 
		
		////
		//
		let aptos_framework_consenter : & signer = & account::create_account_for_test (@0x1);
		let producer_01_consenter : & signer = & account::create_account_for_test (@Producer_01);
		let producer_01_address = signer::address_of (producer_01_consenter);
		let writer_01_consenter : & signer = & account::create_account_for_test (@0x100000);
		let writer_01_address = signer::address_of (writer_01_consenter);
		let writer_02_consenter : & signer = & account::create_account_for_test (@0x100001);
		let writer_02_address = signer::address_of (writer_02_consenter);
		//
		////
	
		let one_APT : u64 = 100000000; 
		let apt_mint : u64 = one_APT * 100;
		
		Vow_Parts_01::clock (aptos_framework_consenter);
		
		let (burn_cap, freeze_cap, mint_cap) = Vow_Parts_01::origin (aptos_framework_consenter);
		let coins = coin::mint<AptosCoin>(apt_mint, & mint_cap);
		coin::register<AptosCoin>(producer_01_consenter);
		coin::deposit (producer_01_address, coins);
		
		
		////
		//	
		//	writers:
		//	
		//	
		coin::register<AptosCoin>(writer_01_consenter);
		coin::register<AptosCoin>(writer_02_consenter);
		//
		coin::transfer<AptosCoin>(producer_01_consenter, writer_01_address, one_APT * 10);
		//
		////
		
		////
		//
		//	Hull Begin
		//
		//
		assert! (Module_Guest_Hulls::are_built () == utf8 (b"no"), 1);
		Module_Producer_Hulls::Begin (producer_01_consenter);
		assert! (Module_Guest_Hulls::are_built () == utf8 (b"yup"), 1);
		//
		////
		
		
		////
		//
		//	Send Text
		//
		//
		let text_01_text : String = utf8 (b"This is a text.");
		let text_01_platform : String = utf8 (b"Platform 01");		
		Module_Guest_Texts::Send_Text (writer_01_consenter, utf8 (b"This is a text."), text_01_platform, utf8 (b"I accept."));
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
		//	Producer Delete Text
		//
		//
		Module_Producer_Texts::Delete_with_Refund_by_index (
			producer_01_consenter,
			text_01_platform,
			0,
			100000000
		);
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