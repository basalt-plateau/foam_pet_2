




module builder_1::digital_hydro_balloons_1_Steady_5 {
	
	
	
	/*
		Can throw from one player to another.
	*/
	#[test (
		aptos_framework_consenter = @0x1, 
	
		builder_1_consenter = @builder_1,
		owner_1_consenter = @owner_1,
	
		player_01_consenter = @player_01, 
		player_02_consenter = @player_02,
		player_03_consenter = @player_03		
	)]
    public fun can_throw_from_one_player_to_another (
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
	
		use builder_1::Digital_Hydro_Balloons_1_Sport; 
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
		let digital_hydro_balloons_for_sale : u256 = 900000;
		Digital_Hydro_Balloons_1_Sport::Begin (& owner_1_consenter, digital_hydro_balloons_for_sale);
		
		//	Join
		//
		Digital_Hydro_Balloons_1_Sport::Join (& player_01_consenter);
		Digital_Hydro_Balloons_1_Sport::Join (& player_02_consenter);
		Digital_Hydro_Balloons_1_Sport::Join (& player_03_consenter);
		if (Digital_Hydro_Balloons_1_Sport::player_has_joined_the_sport (player_01_position) != utf8 (b"yup")) { abort 89389 };
		if (Digital_Hydro_Balloons_1_Sport::player_has_joined_the_sport (player_02_position) != utf8 (b"yup")) { abort 89389 };
		if (Digital_Hydro_Balloons_1_Sport::player_has_joined_the_sport (player_03_position) != utf8 (b"yup")) { abort 89389 };
		
		//	Buy
		//
		Digital_Hydro_Balloons_1_Sport::Buy_5_digital_hydro_balloons_for_1_APT (& player_01_consenter);
		if (Digital_Hydro_Balloons_1_Sport::Digital_Hydro_Balloons_Score (player_01_position) != 5) { abort 1 };
		
		//	Throw
		//
		Digital_Hydro_Balloons_1_Sport::Throw_Digital_Hydro_Balloon (& player_01_consenter, player_02_position);
		if (Digital_Hydro_Balloons_1_Sport::Digital_Hydro_Balloons_Score (player_01_position) != 4) { abort 1 };
		if (Digital_Hydro_Balloons_1_Sport::Digital_Hydro_Balloons_Score (player_02_position) != 1) { abort 1 };
		
		//	End
		//
		// Digital_Hydro_Balloons_1_Sport::End (& owner_1_consenter);	
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