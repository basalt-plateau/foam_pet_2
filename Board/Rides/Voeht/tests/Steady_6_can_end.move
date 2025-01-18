




module builder_1::tiny_water_balloons_1_Steady_6 {
	
	
	
	/*
		Can end
	*/
	#[test (
		aptos_framework_consenter = @0x1, 
	
		builder_1_consenter = @builder_1,
		owner_1_consenter = @owner_1,
	
		player_01_consenter = @player_01, 
		player_02_consenter = @player_02,
		player_03_consenter = @player_03		
	)]
    public fun steady (
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

		use aptos_framework::timestamp;
		use aptos_framework::coin;
		use aptos_framework::aptos_coin::AptosCoin;
		use aptos_framework::account;		
	
		use builder_1::Mix_Venue_Module; 
		use builder_1::Steady; 
		
		let owner_position = signer::address_of (& owner_1_consenter);
		let player_01_position = signer::address_of (& player_01_consenter);
		let player_02_position = signer::address_of (& player_02_consenter);
		let player_03_position = signer::address_of (& player_03_consenter);	
		
		Steady::clock (& aptos_framework_consenter);
		
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
		let tiny_water_balloons_for_sale : u256 = 900000;
		Mix_Venue_Module::Begin (& owner_1_consenter, tiny_water_balloons_for_sale);
		
		//	Join_the_Game
		//
		Mix_Venue_Module::Join_the_Game (& player_01_consenter);
		Mix_Venue_Module::Join_the_Game (& player_02_consenter);
		Mix_Venue_Module::Join_the_Game (& player_03_consenter);
		if (Mix_Venue_Module::player_has_joined_the_sport (player_01_position) != utf8 (b"yup")) { abort 89389 };
		if (Mix_Venue_Module::player_has_joined_the_sport (player_02_position) != utf8 (b"yup")) { abort 89389 };
		if (Mix_Venue_Module::player_has_joined_the_sport (player_03_position) != utf8 (b"yup")) { abort 89389 };
		
		//	Buy
		//
		Mix_Venue_Module::Buy_5_tiny_water_balloons_for_1_APT (& player_01_consenter);
		if (Mix_Venue_Module::Tiny_Water_Balloons_Score (player_01_position) != 5) { abort 1 };
		
		//	Throw
		//
		Mix_Venue_Module::Throw_Tiny_Water_Balloon (& player_01_consenter, player_02_position);
		if (Mix_Venue_Module::Tiny_Water_Balloons_Score (player_01_position) != 4) { abort 1 };
		if (Mix_Venue_Module::Tiny_Water_Balloons_Score (player_02_position) != 1) { abort 1 };
		
		//	End
		//
		if (Mix_Venue_Module::sport_exists () != utf8 (b"yup")) { abort 89389 };
		//		
		let year_ms : u64 = 31557600000;
		timestamp::update_global_time_for_test (year_ms * 281);
		let ending = Mix_Venue_Module::End ();	
		debug::print (& string_utils::format1 (& b"Ending: {}", ending));	
		//
		
		//	Check if can access sport
		//
		if (Mix_Venue_Module::sport_exists () != utf8 (b"no")) { abort 89389 };
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