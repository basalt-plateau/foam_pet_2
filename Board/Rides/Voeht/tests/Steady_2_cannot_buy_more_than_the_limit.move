


module builder_1::vohts_1_Steady_2 {
	
	
	
	
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
	
		mascot_01_consenter = @mascot_01, 
		mascot_02_consenter = @mascot_02,
		mascot_03_consenter = @mascot_03		
	)]
	#[expected_failure (abort_code = 94734)]
    public fun ending__cannot_buy_more_than_the_limit (
		aptos_framework_consenter : signer,
	
		builder_1_consenter : signer,
		owner_1_consenter : signer,		
	
		mascot_01_consenter : signer,
		mascot_02_consenter : signer,
		mascot_03_consenter : signer
	) {	
		use std::vector;
		use std::string_utils;
		use std::string::{ utf8 };
		use std::signer;
		use std::debug;

		use aptos_framework::coin;
		use aptos_framework::aptos_coin::AptosCoin;
		use aptos_framework::account;		
	
		use builder_1::Mix_Venue_Module; 
		use builder_1::Steady; 
		
		let owner_position = signer::address_of (& owner_1_consenter);
		let mascot_01_position = signer::address_of (& mascot_01_consenter);
		let mascot_02_position = signer::address_of (& mascot_02_consenter);
		let mascot_03_position = signer::address_of (& mascot_03_consenter);	
		
		
		let (burn_cap, freeze_cap, mint_cap) = Steady::origin (& aptos_framework_consenter);
		let coins = coin::mint<AptosCoin>(9000000000, &mint_cap);
		account::create_account_for_test (owner_position);
		coin::register<AptosCoin>(& owner_1_consenter);
		coin::deposit (owner_position, coins);
		
		
		account::create_account_for_test (mascot_01_position);
		account::create_account_for_test (mascot_02_position);
		account::create_account_for_test (mascot_03_position);
		
		
		Steady::prepare_APT_for_mascots (
			& mascot_01_consenter,
			& mascot_02_consenter,
			& mascot_03_consenter
		);
		
		coin::transfer<AptosCoin>(& owner_1_consenter, mascot_01_position, 300000000);
		
		////
		//
		//	The Sport
		//
		//
		let vohts_for_sale : u256 = 10;
		Mix_Venue_Module::Begin (& owner_1_consenter, vohts_for_sale);
		if (Mix_Venue_Module::Vohts_For_Sale_Left () != 10) { abort 2 };
		
		//	Join_the_Game
		//
		Mix_Venue_Module::Join_the_Game (& mascot_01_consenter);
		Mix_Venue_Module::Join_the_Game (& mascot_02_consenter);
		Mix_Venue_Module::Join_the_Game (& mascot_03_consenter);
		if (Mix_Venue_Module::mascot_has_joined_the_sport (mascot_01_position) != utf8 (b"yup")) { abort 1 };
		if (Mix_Venue_Module::mascot_has_joined_the_sport (mascot_02_position) != utf8 (b"yup")) { abort 1 };
		if (Mix_Venue_Module::mascot_has_joined_the_sport (mascot_03_position) != utf8 (b"yup")) { abort 1 };
		
		//	Buy
		//
		Mix_Venue_Module::Buy_5_vohts_for_1_APT (& mascot_01_consenter);
		if (Mix_Venue_Module::Vohts_Score (mascot_01_position) != 5) { abort 1 };
		if (Mix_Venue_Module::Vohts_For_Sale_Left () != 5) { abort 2 };
		
		Mix_Venue_Module::Buy_5_vohts_for_1_APT (& mascot_01_consenter);
		if (Mix_Venue_Module::Vohts_Score (mascot_01_position) != 10) { abort 1 };
		if (Mix_Venue_Module::Vohts_For_Sale_Left () != 0) { abort 2 };
		
		Mix_Venue_Module::Buy_5_vohts_for_1_APT (& mascot_01_consenter);
		
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