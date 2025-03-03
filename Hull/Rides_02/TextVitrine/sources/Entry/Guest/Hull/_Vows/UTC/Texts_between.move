





module Builder_01::Texts_between {
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

		use aptos_framework::timestamp;		
		use aptos_framework::coin;
		use aptos_framework::aptos_coin::AptosCoin;
		use aptos_framework::account;		
	
		use Builder_01::Module_Producer_Hulls;
		use Builder_01::Module_Denizen_Texts;
		use Builder_01::Module_Guest_Hulls;
		use Builder_01::Module_Guest_Hull;	
		use Builder_01::Module_Guest_Texts;
		use Builder_01::Module_Hulls; 
		use Builder_01::Vow_Parts_01; 

		let aptos_framework_consenter : signer = account::create_account_for_test (@0x1);
		let producer_01_consenter : & signer = & account::create_account_for_test (@Producer_01);
		let writer_01_consenter : & signer = & account::create_account_for_test (@0x100000);
		let writer_02_consenter : & signer = & account::create_account_for_test (@0x100001);

		let one_APT : u64 = 100000000; 
		let apt_mint : u64 = one_APT * 100;
		
		let producer_address = signer::address_of (producer_01_consenter);
		Vow_Parts_01::clock (& aptos_framework_consenter);
		
		let (burn_cap, freeze_cap, mint_cap) = Vow_Parts_01::origin (& aptos_framework_consenter);
		let coins = coin::mint<AptosCoin>(apt_mint, & mint_cap);
		account::create_account_for_test (producer_address);
		coin::register<AptosCoin>(producer_01_consenter);
		coin::deposit (producer_address, coins);
		
		
		
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
		//	Send Texts
		//
		//
		Module_Denizen_Texts::Send_Text (writer_01_consenter, utf8 (b"This is text 000001."), utf8 (b""), utf8 (b"I accept."));
		Module_Denizen_Texts::Send_Text (writer_01_consenter, utf8 (b"This is text 000002."), utf8 (b""), utf8 (b"I accept."));
		timestamp::update_global_time_for_test (31557600000 * 50);
		Module_Denizen_Texts::Send_Text (writer_01_consenter, utf8 (b"This is text 000003."), utf8 (b""), utf8 (b"I accept."));
		Module_Denizen_Texts::Send_Text (writer_01_consenter, utf8 (b"This is text 000004."), utf8 (b""), utf8 (b"I accept."));
		//
		////
			
			
		////
		//
		//	Retrieve Texts 20_40
		//
		//
		let texts_20_40 = Module_Guest_Hull::Retrieve_Texts_Between (utf8 (b""), 31557600000 * 20, 31557600000 * 40);
		assert! (vector::length (& texts_20_40) == 2, 1);	
		assert! (Module_Hulls::Text_Envelope_Text (vector::borrow (& texts_20_40, 0)) == utf8 (b"This is text 000001."), 1);
		assert! (Module_Hulls::Text_Envelope_Text (vector::borrow (& texts_20_40, 1)) == utf8 (b"This is text 000002."), 1);
		//
		////	
			
		////
		//
		//	Retrieve Texts 40_60
		//
		//
		let texts_40_60 = Module_Guest_Hull::Retrieve_Texts_Between (utf8 (b""), 31557600000 * 40, 31557600000 * 60);
		assert! (vector::length (& texts_40_60) == 2, 1);	
		assert! (Module_Hulls::Text_Envelope_Text (vector::borrow (& texts_20_40, 0)) == utf8 (b"This is text 000003."), 1);
		assert! (Module_Hulls::Text_Envelope_Text (vector::borrow (& texts_20_40, 1)) == utf8 (b"This is text 000004."), 1);
		//
		////

		////
		//
		//	Cleaning
		//
		coin::destroy_mint_cap (mint_cap);
		coin::destroy_freeze_cap (freeze_cap);
		coin::destroy_burn_cap (burn_cap);
		//
		////
	}

	
}


