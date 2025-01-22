



/*
	Can end
*/
module builder_1::Steady__Can_End {
	
	
	#[test (
		aptos_framework_consenter = @0x1, 
	
		builder_1_consenter = @builder_1,
		boar_Producer_1_consenter = @Boar_Producer_1,
	
		boar_Team_01_consenter = @boar_Team_01, 
		boar_Team_02_consenter = @boar_Team_02,
		boar_Team_03_consenter = @boar_Team_03		
	)]
    public fun steady (
		aptos_framework_consenter : signer,
	
		builder_1_consenter : signer,
		boar_Producer_1_consenter : signer,		
	
		boar_Team_01_consenter : signer,
		boar_Team_02_consenter : signer,
		boar_Team_03_consenter : signer
	) {	
		use std::string_utils;
		use std::string::{ utf8 };
		use std::signer;
		use std::debug;

		use aptos_framework::timestamp;
		use aptos_framework::coin;
		use aptos_framework::aptos_coin::AptosCoin;
		use aptos_framework::account;		
	
		use builder_1::Boar_Game_Module; 
		use builder_1::Steady; 
	
	
		let one_APT : u64 = 100000000; 
		
		let apt_mint : u64 = one_APT * 100;
		let apt_boar_Team_01_position : u64 = one_APT * 10;

		let boar_Planet_IVs_for_sale : u256 = 900000;
	
	
		let boar_Producer_position = signer::address_of (& boar_Producer_1_consenter);
		let boar_Team_01_position = signer::address_of (& boar_Team_01_consenter);
		let boar_Team_02_position = signer::address_of (& boar_Team_02_consenter);
		let boar_Team_03_position = signer::address_of (& boar_Team_03_consenter);	
		
		Steady::clock (& aptos_framework_consenter);
		
		let (burn_cap, freeze_cap, mint_cap) = Steady::origin (& aptos_framework_consenter);
		let coins = coin::mint<AptosCoin>(apt_mint, &mint_cap);
		account::create_account_for_test (boar_Producer_position);
		coin::register<AptosCoin>(& boar_Producer_1_consenter);
		coin::deposit (boar_Producer_position, coins);
		
		account::create_account_for_test (boar_Team_01_position);
		account::create_account_for_test (boar_Team_02_position);
		account::create_account_for_test (boar_Team_03_position);
		
		
		Steady::prepare_APT_for_boar_Teams (
			& boar_Team_01_consenter,
			& boar_Team_02_consenter,
			& boar_Team_03_consenter
		);
		
		coin::transfer<AptosCoin>(& boar_Producer_1_consenter, boar_Team_01_position, apt_boar_Team_01_position);
		
		////
		//
		//	Boar_Game Begin
		//
		//
		let boar_Planet_IVs_for_sale : u256 = 900000;
		Boar_Game_Module::Build (& boar_Producer_1_consenter, boar_Planet_IVs_for_sale);
		assert! (Boar_Game_Module::is_boar_Boar_Game_built () == utf8 (b"yup"), 1);
		//
		////

		////
		//
		//	Boar_Game End
		//
		let year_ms : u64 = 31557600000;
		timestamp::update_global_time_for_test (year_ms * 281);
		let ending = Boar_Game_Module::End ();	
		debug::print (& string_utils::format1 (& b"Ending: {}", ending));	
		assert! (Boar_Game_Module::is_boar_Boar_Game_built () == utf8 (b"no"), 1);
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