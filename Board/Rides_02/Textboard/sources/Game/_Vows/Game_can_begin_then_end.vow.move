


module Builder_01::Game_can_begin_then_end {
	use std::string::{ String };
	
	#[view] public fun Volitions () : String { 
		use ride::Rules_10;
		Rules_10::Volitions_01 () 
	}
	
	
	#[test (
		aptos_framework_consenter = @0x1, 
		producer_01_consenter = @Producer_01
	)]
	public fun Vow_01 (
		aptos_framework_consenter : signer,
		producer_01_consenter : signer
	) {	
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
		//	Boar_Game Begin
		//
		//
		assert! (Game_Module::is_Game_built () == utf8 (b"no"), 1);
		Game_Module::Begin_Game (& producer_01_consenter);
		assert! (Game_Module::is_Game_built () == utf8 (b"yup"), 1);
		//
		////

		////
		//
		//	Boar_Game End
		//
		// let year_ms : u64 = 31557600000;
		// let ending_ms : u64 = year_ms * 31;
		let year_ms : u64 = 31557600000;
		timestamp::update_global_time_for_test (year_ms * 31);
		//
		//  timestamp::update_global_time_for_test (ending_ms);
		let ending = Game_Module::End_Game ();
		assert! (ending == utf8 (b"The game ended."), 1);
		
		debug::print (& string_utils::format1 (& b"Ending: {}", ending));	
		assert! (Game_Module::is_Game_built () == utf8 (b"no"), 1);
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