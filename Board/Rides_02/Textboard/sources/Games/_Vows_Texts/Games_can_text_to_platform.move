





module Builder_01::Games_can_text_to_platform {
	
	
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
		//	Game Begin
		//
		//
		assert! (Games_Module::are_Games_built () == utf8 (b"no"), 1);
		Games_Module::Begin_Games (producer_01_consenter);
		assert! (Games_Module::are_Games_built () == utf8 (b"yup"), 1);
		assert! (vector::length (& Games_Module::retrieve_vector_of_game_names ()) == 1, 1);
		//
		////
		
		
		////
		//
		//	Send Text
		//
		//
		let text_01_text : String = utf8 (b"This is a text.");
		let text_01_platform : String = utf8 (b"Dimension 3");		
		Games_Module::Send_Text (
			writer_01_consenter,
			text_01_text,
			text_01_platform
		);
		//
		////

		////
		//
		//	Ensure text exists
		//
		//
		let texts : vector<Games_Module::Text_Envelope> = Games_Module::Retrieve_Texts (text_01_platform);
		let text_ref = vector::borrow (& texts, 0);
		assert! (vector::length (& texts) == 1, 1);		
		assert! (Games_Module::Text_Envelope_Text (text_ref) == utf8 (b"This is a text."), 1);
		//
		////
		
		
		////
		//
		//	Ensure platform exists
		//
		//
		let platforms : vector<String> = Games_Module::retrieve_vector_of_game_names ();
			
		
		
		debug::print (& string_utils::format1 (
			& b"platforms: {}", 
			platforms
		));
		
		assert! (vector::length (& platforms) == 2, 1);		
		assert! (vector::borrow (& platforms, 1) == & utf8 (b"Dimension 3"), 1);
		//
		////
		
		
		
		////
		//
		//	Delete Text
		//
		//
		Games_Module::Delete_Text (
			writer_01_consenter,
			text_01_platform
		);
		assert! (vector::length (& Games_Module::Retrieve_Texts (text_01_platform)) == 0, 1);	
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