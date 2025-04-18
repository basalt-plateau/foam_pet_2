









module Builder_01::Games_while_paused_cannot_text {
	use std::string::{ String };
	
	#[view] public fun Volitions () : String { 
		use Builder_01::Rules_Module;
		Rules_Module::Volitions_01 () 
	}
	
	#[test_only]
	public fun Vow () {	
		use std::string::{ utf8 };
		use std::signer;
		use std::debug;
		use std::string_utils;
		
		use aptos_framework::coin;
		use aptos_framework::aptos_coin::AptosCoin;
		use aptos_framework::account;		
	
		use Builder_01::Games_Module; 
		use Builder_01::Vow_Parts_01; 
	
		let aptos_framework_consenter : signer = account::create_account_for_test (@0x1);
		let producer_01_consenter : & signer = & account::create_account_for_test (@Producer_01);
		let writer_01_consenter : & signer = & account::create_account_for_test (@0x100000);
	
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
		//	Games Begin
		//
		//
		assert! (Games_Module::are_Games_built () == utf8 (b"no"), 1);
		Games_Module::Begin_Games (producer_01_consenter);
		assert! (Games_Module::Games_Status () == utf8 (b"playing"), 1);
		assert! (Games_Module::are_Games_built () == utf8 (b"yup"), 1);
		//
		////
		
		
		Games_Module::Producer_Games_Pause (producer_01_consenter);	
		assert! (Games_Module::Games_Status () == utf8 (b"paused"), 1);
		
		let text_01_text : String = utf8 (b"This is a text.");
		let text_01_platform : String = utf8 (b"");		
		Games_Module::Send_Text (
			writer_01_consenter,
			text_01_text,
			text_01_platform
		);
		
		
		
		Games_Module::Producer_Games_Play (producer_01_consenter);
		assert! (Games_Module::Games_Status () == utf8 (b"playing"), 1);
		
		
		
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