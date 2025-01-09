


module builder_1::Water_Ballons_1_Steady_1 {
	

	
	
	/*
		Ask:
			Sport Begin
			Player Join
			
			Sport End
	*/
	#[test (
		aptos_framework_consenter = @0x1, 
	
		builder_1 = @builder_1,
		owner_1 = @owner_1,
	
		player_01 = @player_01, 
		player_02 = @player_02,
		player_03 = @player_03		
	)]
    public fun steady_1 (
		aptos_framework_consenter : signer,
	
		builder_1 : signer,
		owner_1 : signer,		
	
		player_01 : signer,
		player_02 : signer,
		player_03 : signer
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
		
		
		////
		//
		//	Tailgate: APT Moves
		//
		//
		let owner_position = signer::address_of (& owner_1);
		let player_01_position = signer::address_of (& player_01);
		let player_02_position = signer::address_of (& player_02);
		let player_03_position = signer::address_of (& player_03);		
		//
		let (burn_cap, freeze_cap, mint_cap) = Steady::origin (& aptos_framework_consenter);
		let coins = coin::mint<AptosCoin>(9000000000, &mint_cap);
		//
		account::create_account_for_test (owner_position);
		coin::register<AptosCoin>(& owner_1);
		coin::deposit (owner_position, coins);
		//
		//
		account::create_account_for_test (player_01_position);
		account::create_account_for_test (player_02_position);
		account::create_account_for_test (player_03_position);
		//
		//
		coin::register<AptosCoin>(& player_01);
		coin::register<AptosCoin>(& player_02);
		coin::register<AptosCoin>(& player_03);			
		//
		//
		coin::transfer<AptosCoin>(& owner_1, player_01_position, 200000000);
		coin::transfer<AptosCoin>(& owner_1, player_02_position, 500);
		coin::transfer<AptosCoin>(& owner_1, player_03_position, 500);		
		//
		////
		
		
		////
		//
		//	The Sport
		//
		//
		Water_Balloons_1_Sport::Begin (& owner_1);
		
		//	Join
		//
		Water_Balloons_1_Sport::Join (& player_01);
		Water_Balloons_1_Sport::Join (& player_02);
		Water_Balloons_1_Sport::Join (& player_03);
		if (Water_Balloons_1_Sport::player_has_joined_the_sport (player_01_position) != utf8 (b"yup")) { abort 89389 };
		if (Water_Balloons_1_Sport::player_has_joined_the_sport (player_02_position) != utf8 (b"yup")) { abort 89389 };
		if (Water_Balloons_1_Sport::player_has_joined_the_sport (player_03_position) != utf8 (b"yup")) { abort 89389 };
		
		//	Buy
		//
		Water_Balloons_1_Sport::Buy_5_water_balloons_for_1_APT (& player_01);
		if (Water_Balloons_1_Sport::Water_Balloons_Score (player_01_position) != 5) { abort 1 };
		
		//	Throw
		//
		Water_Balloons_1_Sport::Throw_Water_Balloon (& player_01, player_02_position);
		if (Water_Balloons_1_Sport::Water_Balloons_Score (player_01_position) != 4) { abort 1 };
		if (Water_Balloons_1_Sport::Water_Balloons_Score (player_02_position) != 1) { abort 1 };
		
		//	End
		//
		Water_Balloons_1_Sport::End (& owner_1);	
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