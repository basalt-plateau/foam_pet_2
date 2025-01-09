


module builder_1::Water_Ballons_1_Steady_1 {
	
	
	/*
		let (burn_cap, freeze_cap, mint_cap) = origin (& aptos_framework_flourisher);
	
	
		coin::destroy_mint_cap (mint_cap);
        coin::destroy_freeze_cap (freeze_cap);
		coin::destroy_burn_cap (burn_cap);
	*/
	use aptos_framework::coin;
	use aptos_framework::aptos_coin::AptosCoin;
	#[test (
		aptos_framework_consenter = @0x1 
	)]
	fun origin (
		aptos_framework_consenter: & signer
	) : (
		coin::BurnCapability<AptosCoin>,
		coin::FreezeCapability<AptosCoin>,
		coin::MintCapability<AptosCoin>		
	) {
		use std::string;

		use aptos_framework::aptos_coin::AptosCoin;
		use aptos_framework::coin::{ Self, Coin };
		use aptos_framework::timestamp;
		
		/*
			public fun initialize<CoinType>(
				account: &signer, 
				name: string::String, 
				symbol: string::String, 
				decimals: u8, 
				monitor_supply: bool
			): (
				coin::BurnCapability<CoinType>, 
				coin::FreezeCapability<CoinType>, 
				coin::MintCapability<CoinType>
			)
		*/
		let decimals : u8 = 8;
		let monitor_supply : bool = false;
		let (burn_cap, freeze_cap, mint_cap) = coin::initialize<AptosCoin>(
            aptos_framework_consenter,
            string::utf8 (b"Swerve"),
            string::utf8 (b"SWE"),
            decimals,
            monitor_supply
        );
		
		// let coins = coin::mint<AptosCoin>(10000, &mint_cap);
        // coin::deposit (estate_1_spot, coins);
		
		(burn_cap, freeze_cap, mint_cap)
	}
	
	
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
		use std::debug;
		use std::signer;
		use std::string_utils;
		use std::string::{ utf8 };
		use std::vector;

		use aptos_framework::account;

		use builder_1::Water_Balloons_1_Sport; 
		
		/*
		let players = vector::empty<signer>();
		vector::push_back (&mut players, & player_01);
		vector::push_back (&mut players, & player_02);
		vector::push_back (&mut players, & player_03);
		for (i in 0..vector::length (& players)) {
			
		};
		*/
		
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
		let (burn_cap, freeze_cap, mint_cap) = origin (& aptos_framework_consenter);
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
		coin::transfer<AptosCoin>(& owner_1, player_01_position, 500);
		coin::transfer<AptosCoin>(& owner_1, player_02_position, 500);
		coin::transfer<AptosCoin>(& owner_1, player_03_position, 500);		
		//
		////
		
		
		Water_Balloons_1_Sport::Begin (& owner_1);
		Water_Balloons_1_Sport::Join (& player_01);
		Water_Balloons_1_Sport::Join (& player_02);
		
		
		Water_Balloons_1_Sport::Buy_5_water_balloons_for_1_APT (& player_01);
		
		Water_Balloons_1_Sport::End (& owner_1);	
		
		
		
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