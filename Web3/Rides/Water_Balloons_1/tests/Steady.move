


module builder_1::Steady {
	
	use aptos_framework::aptos_coin::AptosCoin;
	use aptos_framework::coin;
	
	#[test (aptos_framework_consenter = @0x1)]
	public fun clock (
		aptos_framework_consenter: & signer
	) {
		use aptos_framework::timestamp;
		use aptos_framework::genesis;
	
		let one_synodic_rotation = 86400000000;
		let microsends : u64 = 10000; 
		
		timestamp::set_time_has_started_for_testing (aptos_framework_consenter);
		timestamp::update_global_time_for_test (microsends);
	}
	
	/*
		let (burn_cap, freeze_cap, mint_cap) = origin (& aptos_framework_flourisher);
	
	
		coin::destroy_mint_cap (mint_cap);
        coin::destroy_freeze_cap (freeze_cap);
		coin::destroy_burn_cap (burn_cap);
	*/
	public fun origin (
		aptos_framework_consenter: & signer
	) : (
		coin::BurnCapability<AptosCoin>,
		coin::FreezeCapability<AptosCoin>,
		coin::MintCapability<AptosCoin>		
	) {
		use std::string;

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
	
	
	public fun prepare_APT_for_players (
		player_01_consenter : & signer,
		player_02_consenter : & signer,
		player_03_consenter : & signer
	) {
		use aptos_framework::coin;
		use aptos_framework::aptos_coin::AptosCoin;
		
		coin::register<AptosCoin>(player_01_consenter);
		coin::register<AptosCoin>(player_02_consenter);
		coin::register<AptosCoin>(player_03_consenter);	
		
		// coin::transfer<AptosCoin>(owner_1_consenter, player_01_position, 200000000);
		// coin::transfer<AptosCoin>(owner_1_consenter, player_02_position, 0);
		// coin::transfer<AptosCoin>(owner_1_consenter, player_03_position, 0);	
	}
	
	
}

