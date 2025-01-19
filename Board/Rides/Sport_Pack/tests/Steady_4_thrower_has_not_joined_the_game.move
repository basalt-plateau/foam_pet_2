




module builder_1::votes_1_Steady_4 {
	
	
	
	/*
		Thrower hasn't joined the game.
	*/
	#[test (
		aptos_framework_consenter = @0x1, 
	
		builder_1_consenter = @builder_1,
		formulator_1_consenter = @Formulator_1,
	
		boar_Team_01_consenter = @boar_Team_01, 
		boar_Team_02_consenter = @boar_Team_02,
		boar_Team_03_consenter = @boar_Team_03		
	)]
	#[expected_failure (abort_code = 473890)]
    public fun ending__thrower_has_not_joined_the_game (
		aptos_framework_consenter : signer,
	
		builder_1_consenter : signer,
		formulator_1_consenter : signer,		
	
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
	
		use builder_1::Game_Module; 
		use builder_1::Steady; 
		
		let formulator_position = signer::address_of (& formulator_1_consenter);
		let boar_Team_01_position = signer::address_of (& boar_Team_01_consenter);
		let boar_Team_02_position = signer::address_of (& boar_Team_02_consenter);
		let boar_Team_03_position = signer::address_of (& boar_Team_03_consenter);	
		
		
		let (burn_cap, freeze_cap, mint_cap) = Steady::origin (& aptos_framework_consenter);
		let coins = coin::mint<AptosCoin>(9000000000, &mint_cap);
		account::create_account_for_test (formulator_position);
		coin::register<AptosCoin>(& formulator_1_consenter);
		coin::deposit (formulator_position, coins);
		
		
		account::create_account_for_test (boar_Team_01_position);
		account::create_account_for_test (boar_Team_02_position);
		account::create_account_for_test (boar_Team_03_position);
		
		
		Steady::prepare_APT_for_boar_Teams (
			& boar_Team_01_consenter,
			& boar_Team_02_consenter,
			& boar_Team_03_consenter
		);
		
		coin::transfer<AptosCoin>(& formulator_1_consenter, boar_Team_01_position, 300000000);
		
		////
		//
		//	The Game
		//
		//
		let votes_for_sale : u256 = 10;
		Game_Module::Build (& formulator_1_consenter, votes_for_sale);
		if (Game_Module::Votes_For_Sale_Left () != 10) { abort 2 };
		
		//	Join_the_Game
		//
		Game_Module::Join_the_Game (& boar_Team_01_consenter);
		if (Game_Module::boar_Team_has_joined_the_sport (boar_Team_01_position) != utf8 (b"yup")) { abort 1 };
		Game_Module::Join_the_Game (& boar_Team_02_consenter);
		if (Game_Module::boar_Team_has_joined_the_sport (boar_Team_02_position) != utf8 (b"yup")) { abort 1 };
		

		//	Throw
		//
		Game_Module::Throw_Vote (& boar_Team_03_consenter, boar_Team_01_position);
		
		
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