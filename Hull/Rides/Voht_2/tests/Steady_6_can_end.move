




module builder_1::Voht_Steady_6 {
	
	
	
	/*
		Can end
	*/
	#[test (
		aptos_framework_consenter = @0x1, 
	
		builder_1_consenter = @builder_1,
		owner_1_consenter = @owner_1,
	
		freighter_01_consenter = @Freighter_01, 
		freighter_02_consenter = @Freighter_02,
		freighter_03_consenter = @Freighter_03		
	)]
    public fun steady (
		aptos_framework_consenter : signer,
	
		builder_1_consenter : signer,
		owner_1_consenter : signer,		
	
		freighter_01_consenter : signer,
		freighter_02_consenter : signer,
		freighter_03_consenter : signer
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
	
		use builder_1::Void_Freight_Group; 
		use builder_1::Steady; 
		
		let owner_position = signer::address_of (& owner_1_consenter);
		let Freighter_01_position = signer::address_of (& freighter_01_consenter);
		let Freighter_02_position = signer::address_of (& freighter_02_consenter);
		let Freighter_03_position = signer::address_of (& freighter_03_consenter);	
		
		Steady::clock (& aptos_framework_consenter);
		
		let (burn_cap, freeze_cap, mint_cap) = Steady::origin (& aptos_framework_consenter);
		let coins = coin::mint<AptosCoin>(9000000000, &mint_cap);
		account::create_account_for_test (owner_position);
		coin::register<AptosCoin>(& owner_1_consenter);
		coin::deposit (owner_position, coins);
		
		
		account::create_account_for_test (Freighter_01_position);
		account::create_account_for_test (Freighter_02_position);
		account::create_account_for_test (Freighter_03_position);
		
		
		Steady::prepare_APT_for_Freighters (
			& freighter_01_consenter,
			& freighter_02_consenter,
			& freighter_03_consenter
		);
		
		coin::transfer<AptosCoin>(& owner_1_consenter, Freighter_01_position, 300000000);
		
		////
		//
		//	The Sport
		//
		//
		let vohts_for_sale : u256 = 900000;
		Void_Freight_Group::Begin (& owner_1_consenter, vohts_for_sale);
		
		//	Join_the_Game
		//
		Void_Freight_Group::Join_the_Game (& freighter_01_consenter);
		Void_Freight_Group::Join_the_Game (& freighter_02_consenter);
		Void_Freight_Group::Join_the_Game (& freighter_03_consenter);
		if (Void_Freight_Group::Freighter_has_joined_the_sport (Freighter_01_position) != utf8 (b"yup")) { abort 89389 };
		if (Void_Freight_Group::Freighter_has_joined_the_sport (Freighter_02_position) != utf8 (b"yup")) { abort 89389 };
		if (Void_Freight_Group::Freighter_has_joined_the_sport (Freighter_03_position) != utf8 (b"yup")) { abort 89389 };
		
		//	Buy
		//
		Void_Freight_Group::Buy_5_Vohts_for_1_APT (& freighter_01_consenter);
		if (Void_Freight_Group::Tiny_Water_Balloons_Score (Freighter_01_position) != 5) { abort 1 };
		
		//	Throw
		//
		Void_Freight_Group::Throw_Tiny_Water_Balloon (& freighter_01_consenter, Freighter_02_position);
		if (Void_Freight_Group::Tiny_Water_Balloons_Score (Freighter_01_position) != 4) { abort 1 };
		if (Void_Freight_Group::Tiny_Water_Balloons_Score (Freighter_02_position) != 1) { abort 1 };
		
		//	End
		//
		if (Void_Freight_Group::sport_exists () != utf8 (b"yup")) { abort 89389 };
		//		
		let year_ms : u64 = 31557600000;
		timestamp::update_global_time_for_test (year_ms * 281);
		let ending = Void_Freight_Group::End ();	
		debug::print (& string_utils::format1 (& b"Ending: {}", ending));	
		//
		
		//	Check if can access sport
		//
		if (Void_Freight_Group::sport_exists () != utf8 (b"no")) { abort 89389 };
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