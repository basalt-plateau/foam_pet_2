


module builder_1::Steady__Can_buy_up_to_limit {
	
	
	
	/*
		Ensure that can't buy more than the limit.
		
			Create 10 Plays
			Purchase 5 -> Pass
			Purchase 5 -> Pass
			Purchases -> Fail
	*/
	#[test (
		aptos_framework_consenter = @0x1, 
	
		builder_1_consenter = @builder_1,
		boar_Producer_1_consenter = @Boar_Producer_1,
	
		boar_Team_01_consenter = @boar_Team_01, 
		boar_Team_02_consenter = @boar_Team_02,
		boar_Team_03_consenter = @boar_Team_03		
	)]
    public fun ending__cannot_buy_more_than_the_limit (
		aptos_framework_consenter : signer,
	
		builder_1_consenter : signer,
		boar_Producer_1_consenter : signer,		
	
		boar_Team_01_consenter : signer,
		boar_Team_02_consenter : signer,
		boar_Team_03_consenter : signer
	) {	
		use std::vector;
		use std::string_utils;
		use std::string::{ utf8 };
		use std::signer;
		use std::debug;

		use aptos_framework::coin;
		use aptos_framework::aptos_coin::AptosCoin;
		use aptos_framework::account;		
	
		use builder_1::Boar_Game_Module; 
		use builder_1::Steady; 
		
		let boar_Producer_position = signer::address_of (& boar_Producer_1_consenter);
		let boar_Team_01_position = signer::address_of (& boar_Team_01_consenter);
		let boar_Team_02_position = signer::address_of (& boar_Team_02_consenter);
		let boar_Team_03_position = signer::address_of (& boar_Team_03_consenter);	
		
		let one_APT : u64 = 100000000; 
		
		////
		//
		//
		//	Prep then send coins to the producer.
		//
		let (burn_cap, freeze_cap, mint_cap) = Steady::origin (& aptos_framework_consenter);
		let coins = coin::mint<AptosCoin>(one_APT * 10000, &mint_cap);
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
		
		
		coin::transfer<AptosCoin>(& boar_Producer_1_consenter, boar_Team_01_position, one_APT * 100);
		if (coin::balance<AptosCoin>(boar_Team_01_position) != one_APT * 100) { abort 1 };
		
		////
		//
		//	The Boar_Game
		//
		//
		let boar_Planet_IVs_for_sale : u256 = 10;
		Boar_Game_Module::Build (& boar_Producer_1_consenter, boar_Planet_IVs_for_sale);
		if (Boar_Game_Module::Boar_Planet_IVs_For_Sale_Left () != 10) { abort 2 };
		
		//	Join_the_Boar_Game
		//
		Boar_Game_Module::Join_the_Boar_Game (& boar_Team_01_consenter);
		Boar_Game_Module::Join_the_Boar_Game (& boar_Team_02_consenter);
		Boar_Game_Module::Join_the_Boar_Game (& boar_Team_03_consenter);
		if (Boar_Game_Module::boar_Team_has_joined_the_sport (boar_Team_01_position) != utf8 (b"yup")) { abort 1 };
		if (Boar_Game_Module::boar_Team_has_joined_the_sport (boar_Team_02_position) != utf8 (b"yup")) { abort 1 };
		if (Boar_Game_Module::boar_Team_has_joined_the_sport (boar_Team_03_position) != utf8 (b"yup")) { abort 1 };
		 
		//
		//
		//	Buy
		//
		Boar_Game_Module::Buy_Boar_Planet_IVs_for_1_APT_each (& boar_Team_01_consenter, 5);
		assert! (coin::balance<AptosCoin>(boar_Team_01_position) == one_APT * 95, 1);
		assert! (Boar_Game_Module::Boar_Planet_IVs_Score (boar_Team_01_position) == 5, 1);
		assert! (Boar_Game_Module::Boar_Planet_IVs_For_Sale_Left () == 5, 1);

		Boar_Game_Module::Buy_Boar_Planet_IVs_for_1_APT_each (& boar_Team_01_consenter, 5);
		assert! (coin::balance<AptosCoin>(boar_Team_01_position) == one_APT * 90, 1);
		assert! (Boar_Game_Module::Boar_Planet_IVs_Score (boar_Team_01_position) == 10, 1);
		assert! (Boar_Game_Module::Boar_Planet_IVs_For_Sale_Left () == 0, 1);
		
		
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