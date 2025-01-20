




module builder_1::Steady__Cannot_End {
	

	#[test (
		aptos_framework_consenter = @0x1, 
	
		builder_1_consenter = @builder_1,
		boar_Producer_1_consenter = @Boar_Producer_1,
	
		boar_Team_01_consenter = @boar_Team_01, 
		boar_Team_02_consenter = @boar_Team_02,
		boar_Team_03_consenter = @boar_Team_03		
	)]
	#[expected_failure (abort_code = 943728, location = builder_1::Boar_Game_Module)]
    public fun steady (
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

		use aptos_framework::timestamp;
		use aptos_framework::coin;
		use aptos_framework::aptos_coin::AptosCoin;
		use aptos_framework::account;		
	
		use builder_1::Boar_Game_Module; 
		use builder_1::Steady; 
		
		
		let one_APT : u64 = 100000000; 
		
		let apt_mint : u64 = one_APT * 100;
		let apt_boar_Team_01_position : u64 = one_APT * 5;

		let boar_Plays_for_sale : u256 = 900000;
		
		
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
		//	The Boar_Game
		//
		//
		Boar_Game_Module::Build (& boar_Producer_1_consenter, boar_Plays_for_sale);
		
		//	Join_the_Boar_Game
		//
		Boar_Game_Module::Join_the_Boar_Game (& boar_Team_01_consenter);
		Boar_Game_Module::Join_the_Boar_Game (& boar_Team_02_consenter);
		Boar_Game_Module::Join_the_Boar_Game (& boar_Team_03_consenter);
		if (Boar_Game_Module::boar_Team_has_joined_the_sport (boar_Team_01_position) != utf8 (b"yup")) { abort 89389 };
		if (Boar_Game_Module::boar_Team_has_joined_the_sport (boar_Team_02_position) != utf8 (b"yup")) { abort 89389 };
		if (Boar_Game_Module::boar_Team_has_joined_the_sport (boar_Team_03_position) != utf8 (b"yup")) { abort 89389 };
		
		
		//
		//	Swap: 5 APT -> 5 Plays 
		//
		//
		Boar_Game_Module::Buy_Boar_Plays_for_1_APT_each (& boar_Team_01_consenter, 5);
		assert! (coin::balance<AptosCoin>(boar_Team_01_position) == 0, 1);
		assert! (Boar_Game_Module::Boar_Plays_Score (boar_Team_01_position) == 5, 1);
		assert! (Boar_Game_Module::Boar_Plays_For_Sale_Left () == 900000 - 5, 1);
		
		
		//	Throw
		//
		Boar_Game_Module::Throw_Boar_Play (& boar_Team_01_consenter, boar_Team_02_position);
		if (Boar_Game_Module::Boar_Plays_Score (boar_Team_01_position) != 4) { abort 1 };
		if (Boar_Game_Module::Boar_Plays_Score (boar_Team_02_position) != 1) { abort 1 };
		
		//	End
		//
		let year_ms : u64 = 31557600000;
		timestamp::update_global_time_for_test (year_ms * 279);
		let ending = Boar_Game_Module::End ();	
		debug::print (& string_utils::format1 (& b"Ending: {}", ending));
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