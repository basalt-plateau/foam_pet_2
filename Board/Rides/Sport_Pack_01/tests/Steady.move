


module builder_1::Steady {
	
	use aptos_framework::aptos_coin::AptosCoin;
	use aptos_framework::coin;
	
	#[test (aptos_framework_consenter = @0x1)]
	public fun clock (aptos_framework_consenter: & signer) {
		use aptos_framework::timestamp;
	
	
		timestamp::set_time_has_started_for_testing (aptos_framework_consenter);
		
		//
		//	Update the Clock
		//		Epoch IX = January 1, 1970
		//		2100 = around 55 * 60 * 60 * 24 * 365 * 1000 
		//
		let year_ms : u64 = 31557600000;
		timestamp::set_time_has_started_for_testing (aptos_framework_consenter);
		timestamp::update_global_time_for_test (year_ms * 130);
	}
	
	/*
	public fun denim () {
		use aptos_framework::genesis;
		
		// https://aptos.dev/en/build/smart-contracts/reference?page=aptos-framework%2Fdoc%2Fgenesis.md#0x1_genesis_initialize
		let gas_schedule = vector::empty<u8>();
		let chain_id : u8 = 1;
		
		genesis::initialize (
			gas_schedule: vector<u8>, 
			chain_id: u8, 
			initial_version: u64, 
			consensus_config: vector<u8>, 
			execution_config: vector<u8>, 
			epoch_interval_microsecs: u64, 
			minimum_stake: u64, 
			maximum_stake: u64, 
			recurring_lockup_duration_secs: u64, 
			allow_validator_set_change: bool, 
			rewards_rate: u64, 
			rewards_rate_denominator: u64, 
			voting_power_increase_limit: u64
		)
	}
	*/
	
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
		use aptos_framework::chain_id;
		
		chain_id::initialize_for_test (aptos_framework_consenter, 3);
		
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
	
	
	public fun prepare_APT_for_boar_Teams (
		boar_Team_01_consenter : & signer,
		boar_Team_02_consenter : & signer,
		boar_Team_03_consenter : & signer
	) {
		use aptos_framework::coin;
		use aptos_framework::aptos_coin::AptosCoin;
		
		coin::register<AptosCoin>(boar_Team_01_consenter);
		coin::register<AptosCoin>(boar_Team_02_consenter);
		coin::register<AptosCoin>(boar_Team_03_consenter);	
		
		// coin::transfer<AptosCoin>(boar_Producer_1_consenter, boar_Team_01_position, 200000000);
	}
	
	
}

