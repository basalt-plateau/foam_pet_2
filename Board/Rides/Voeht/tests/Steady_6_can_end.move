




module builder_1::vohts_1_Steady_6 {
	
	
	
	/*
		Can end
	*/
	#[test (
		aptos_framework_consenter = @0x1, 
	
		builder_1_consenter = @builder_1,
		formulator_1_consenter = @Formulator_1,
	
		mascot_01_consenter = @mascot_01, 
		mascot_02_consenter = @mascot_02,
		mascot_03_consenter = @mascot_03		
	)]
    public fun steady (
		aptos_framework_consenter : signer,
	
		builder_1_consenter : signer,
		formulator_1_consenter : signer,		
	
		mascot_01_consenter : signer,
		mascot_02_consenter : signer,
		mascot_03_consenter : signer
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
	
		use builder_1::Venue_Module; 
		use builder_1::Steady; 
		
		let formulator_position = signer::address_of (& formulator_1_consenter);
		let mascot_01_position = signer::address_of (& mascot_01_consenter);
		let mascot_02_position = signer::address_of (& mascot_02_consenter);
		let mascot_03_position = signer::address_of (& mascot_03_consenter);	
		
		Steady::clock (& aptos_framework_consenter);
		
		let (burn_cap, freeze_cap, mint_cap) = Steady::origin (& aptos_framework_consenter);
		let coins = coin::mint<AptosCoin>(9000000000, &mint_cap);
		account::create_account_for_test (formulator_position);
		coin::register<AptosCoin>(& formulator_1_consenter);
		coin::deposit (formulator_position, coins);
		
		
		account::create_account_for_test (mascot_01_position);
		account::create_account_for_test (mascot_02_position);
		account::create_account_for_test (mascot_03_position);
		
		
		Steady::prepare_APT_for_mascots (
			& mascot_01_consenter,
			& mascot_02_consenter,
			& mascot_03_consenter
		);
		
		coin::transfer<AptosCoin>(& formulator_1_consenter, mascot_01_position, 300000000);
		
		////
		//
		//	The Venue
		//
		//
		let vohts_for_sale : u256 = 900000;
		Venue_Module::Begin (& formulator_1_consenter, vohts_for_sale);
		
		//	Join_the_Game
		//
		Venue_Module::Join_the_Game (& mascot_01_consenter);
		Venue_Module::Join_the_Game (& mascot_02_consenter);
		Venue_Module::Join_the_Game (& mascot_03_consenter);
		if (Venue_Module::mascot_has_joined_the_sport (mascot_01_position) != utf8 (b"yup")) { abort 89389 };
		if (Venue_Module::mascot_has_joined_the_sport (mascot_02_position) != utf8 (b"yup")) { abort 89389 };
		if (Venue_Module::mascot_has_joined_the_sport (mascot_03_position) != utf8 (b"yup")) { abort 89389 };
		
		//	Buy
		//
		Venue_Module::Buy_5_vohts_for_1_APT (& mascot_01_consenter);
		if (Venue_Module::Vohts_Score (mascot_01_position) != 5) { abort 1 };
		
		//	Throw
		//
		Venue_Module::Throw_Voht (& mascot_01_consenter, mascot_02_position);
		if (Venue_Module::Vohts_Score (mascot_01_position) != 4) { abort 1 };
		if (Venue_Module::Vohts_Score (mascot_02_position) != 1) { abort 1 };
		
		//	End
		//
		if (Venue_Module::sport_exists () != utf8 (b"yup")) { abort 89389 };
		//		
		let year_ms : u64 = 31557600000;
		timestamp::update_global_time_for_test (year_ms * 281);
		let ending = Venue_Module::End ();	
		debug::print (& string_utils::format1 (& b"Ending: {}", ending));	
		//
		
		//	Check if can access sport
		//
		if (Venue_Module::sport_exists () != utf8 (b"no")) { abort 89389 };
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