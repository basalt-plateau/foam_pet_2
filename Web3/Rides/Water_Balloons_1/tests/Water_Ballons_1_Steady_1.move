


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

		use aptos_framework::account;

		use builder_1::Water_Balloons_1_Sport; 
		
		////
		//
		//	Tailgate
		//
		//
		let owner_position = signer::address_of (& owner_1);
		account::create_account_for_test (owner_position);
		//
		let (burn_cap, freeze_cap, mint_cap) = origin (& aptos_framework_consenter);
		coin::register<AptosCoin>(& owner_1);
		let coins = coin::mint<AptosCoin>(9000000000, &mint_cap);
		coin::deposit (owner_position, coins);
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