


module builder_1::Water_Ballons_1_Steady_2 {
	
	
	
	
	/*
		Ensure that can't buy more than the limit.
		
			10 Water Balloons
			Purchases -> Pass
			Purchases -> Pass
			Purchases -> Fail
	*/
	#[test (
		aptos_framework_consenter = @0x1, 
	
		builder_1_consenter = @builder_1,
		owner_1_consenter = @owner_1,
	
		player_01_consenter = @player_01, 
		player_02_consenter = @player_02,
		player_03_consenter = @player_03		
	)]
	#[expected_failure (abort_code = 94734)]
    public fun ending__cannot_buy_more_than_the_limit (
		aptos_framework_consenter : signer,
	
		builder_1_consenter : signer,
		owner_1_consenter : signer,		
	
		player_01_consenter : signer,
		player_02_consenter : signer,
		player_03_consenter : signer
	) {	
		use std::vector;
		use std::string_utils;
		use std::string::{ utf8 };
		use std::signer;
		use std::debug;

		use aptos_framework::coin;
		use aptos_framework::aptos_coin::AptosCoin;
		use aptos_framework::account;		
	
		use builder_1::Water_Balloons_1_Sport; 
		use builder_1::Steady; 
		
		let owner_position = signer::address_of (& owner_1_consenter);
		let player_01_position = signer::address_of (& player_01_consenter);
		let player_02_position = signer::address_of (& player_02_consenter);
		let player_03_position = signer::address_of (& player_03_consenter);	
		
		
		let (burn_cap, freeze_cap, mint_cap) = Steady::origin (& aptos_framework_consenter);
		let coins = coin::mint<AptosCoin>(9000000000, &mint_cap);
		account::create_account_for_test (owner_position);
		coin::register<AptosCoin>(& owner_1_consenter);
		coin::deposit (owner_position, coins);
		
		
		account::create_account_for_test (player_01_position);
		account::create_account_for_test (player_02_position);
		account::create_account_for_test (player_03_position);
		
		
		Steady::prepare_APT_for_players (
			& player_01_consenter,
			& player_02_consenter,
			& player_03_consenter
		);
		
		coin::transfer<AptosCoin>(& owner_1_consenter, player_01_position, 300000000);
		
		////
		//
		//	The Sport
		//
		//
		let water_balloons_for_sale : u256 = 10;
		Water_Balloons_1_Sport::Begin (& owner_1_consenter, water_balloons_for_sale);
		if (Water_Balloons_1_Sport::Water_Balloons_For_Sale_Left () != 10) { abort 2 };
		
		//	Join
		//
		Water_Balloons_1_Sport::Join (& player_01_consenter);
		Water_Balloons_1_Sport::Join (& player_02_consenter);
		Water_Balloons_1_Sport::Join (& player_03_consenter);
		if (Water_Balloons_1_Sport::player_has_joined_the_sport (player_01_position) != utf8 (b"yup")) { abort 1 };
		if (Water_Balloons_1_Sport::player_has_joined_the_sport (player_02_position) != utf8 (b"yup")) { abort 1 };
		if (Water_Balloons_1_Sport::player_has_joined_the_sport (player_03_position) != utf8 (b"yup")) { abort 1 };
		
		//	Buy
		//
		Water_Balloons_1_Sport::Buy_5_water_balloons_for_1_APT (& player_01_consenter);
		if (Water_Balloons_1_Sport::Water_Balloons_Score (player_01_position) != 5) { abort 1 };
		if (Water_Balloons_1_Sport::Water_Balloons_For_Sale_Left () != 5) { abort 2 };
		
		Water_Balloons_1_Sport::Buy_5_water_balloons_for_1_APT (& player_01_consenter);
		if (Water_Balloons_1_Sport::Water_Balloons_Score (player_01_position) != 10) { abort 1 };
		if (Water_Balloons_1_Sport::Water_Balloons_For_Sale_Left () != 0) { abort 2 };
		
		Water_Balloons_1_Sport::Buy_5_water_balloons_for_1_APT (& player_01_consenter);
		
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