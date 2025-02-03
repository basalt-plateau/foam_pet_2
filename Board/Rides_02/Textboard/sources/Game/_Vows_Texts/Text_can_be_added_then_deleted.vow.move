


module Builder_01::Text_can_be_added_then_deleted {
	use std::string::{ String };

	
	#[view] public fun Volitions () : String { 
		use Builder_01::Rules_Module;
		Rules_Module::Volitions_01 () 
	}
	
	
	#[test (
		aptos_framework_consenter = @0x1, 
		producer_01_consenter = @Producer_01,
		
		organization_01_consenter = @1000001,
		organization_02_consenter = @1000002
	)]
	public fun Vow_Text_can_be_added_then_deleted (
		aptos_framework_consenter : signer,
		producer_01_consenter : signer,
		
		organization_01_consenter : & signer,
		organization_02_consenter : & signer
	) {	
		use std::vector;
		use std::string_utils;
		use std::string::{ utf8 };
		use std::signer;
		use std::debug;
		
		use aptos_framework::timestamp;
		use aptos_framework::coin;
		use aptos_framework::aptos_coin::AptosCoin;
		use aptos_framework::account;		
	
		use Builder_01::Game_Module; 
		use Builder_01::Vow_Parts_01; 
	
		let one_APT : u64 = 100000000; 
		let apt_mint : u64 = one_APT * 100;
		
		let producer_address = signer::address_of (& producer_01_consenter);
		Vow_Parts_01::clock (& aptos_framework_consenter);
		
		let (burn_cap, freeze_cap, mint_cap) = Vow_Parts_01::origin (& aptos_framework_consenter);
		let coins = coin::mint<AptosCoin>(apt_mint, & mint_cap);
		account::create_account_for_test (producer_address);
		coin::register<AptosCoin>(& producer_01_consenter);
		coin::deposit (producer_address, coins);
		
		
		
		////
		//
		//	Game Begin
		//
		//
		assert! (Game_Module::is_Game_built () == utf8 (b"no"), 1);
		Game_Module::Begin_Game (& producer_01_consenter);
		assert! (Game_Module::is_Game_built () == utf8 (b"yup"), 1);
		//
		////
		
		
		
		//
		//	Send Texts
		//
		//
		let text_01_text : String = utf8 (b"This");
		let platforms_01 = vector::empty<String>();
		let allow_translation : String = utf8 (b"This");
		Game_Module::send_text (
			organization_01_consenter,
			text_01_text,
			platforms_01,
			allow_translation
		);
		
		//
		//	Retrieve Texts
		//
		//
		let texts : vector<Game_Module::Text> = Game_Module::retrieve_texts ();
		assert! (vector::length (& texts) == 1);
		
		// assert! (vector::borrow (& texts, 0).text == utf8 (b"This"));
		
		
		
		
		////
		//
		//	Game End
		//
		let year_ms : u64 = 31557600000;
		let year_2026_ms : u64 = year_ms * 31;
		timestamp::update_global_time_for_test (year_2026_ms - 1);
		//
		let ending = Game_Module::End_Game ();
		debug::print (& string_utils::format1 (& b"Ending: {}", ending));			
		assert! (ending == utf8 (b"The game cannot be ended yet. Now is 978285599999. The game can end at 978285600000"), 1);
		assert! (Game_Module::is_Game_built () == utf8 (b"yup"), 1);
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