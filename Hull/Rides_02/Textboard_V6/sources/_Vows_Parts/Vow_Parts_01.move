




module builder_1::Vow_Parts_01 {
	
	use aptos_framework::aptos_coin::AptosCoin;
	use aptos_framework::coin;
	
	#[test (aptos_framework_consenter = @0x1)]
	public fun clock (aptos_framework_consenter: & signer) {
		use aptos_framework::timestamp;
		
		timestamp::set_time_has_started_for_testing (aptos_framework_consenter);
		
		//
		//	Update the Clock
		//		Epoch IX = January 1, 1970
		//
		//		2100 = around 55 * 60 * 60 * 24 * 365 * 1000 
		//			130
		//
		// let year_ms : u64 = 31557600000;
		let begin_ms : u64 = 31557600000 * 30;
		//
		timestamp::set_time_has_started_for_testing (aptos_framework_consenter);
		timestamp::update_global_time_for_test (begin_ms);
	}
	
	/*
	public fun embark () {
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
	
	
	#[test_only]
	public fun create_consenters (_count : u64) : vector<signer> {
		use std::unit_test;
		
		use std::signer;
		use std::vector;

		// use aptos_framework::create_signer;
		use aptos_framework::account;
		
		let vector_of_signers = vector::empty<signer>();
		
		/*
		// let APTOS_FRAMEWORK_ADDRESS : address = 0x1;
		let test_signer : signer = create_signer::create_signer (@0x1);
		// let signer_address = signer::address_of(&test_signer);
		
		// let aptos_framework_signer = signer::borrow_global_mut<signer>(@0x1);
		vector::push_back (&mut signers, test_signer);
		*/
		
		let signers = &mut unit_test::create_signers_for_testing (2);
        let (signer_01, signer_02) = (
			vector::pop_back (signers), 
			vector::pop_back (signers)
		);

        account::create_account_for_test (signer::address_of (& signer_01));
        account::create_account_for_test (signer::address_of (& signer_02));
        // (alice, bob)
		
		vector::push_back (&mut vector_of_signers, signer_01);
		vector::push_back (&mut vector_of_signers, signer_02);
		
		
		// signers
		
		vector_of_signers
	}
	
	/*
		let (burn_cap, freeze_cap, mint_cap) = origin (& aptos_framework_flourisher);
	
		coin::destroy_mint_cap (mint_cap);
		coin::destroy_freeze_cap (freeze_cap);
		coin::destroy_burn_cap (burn_cap);
	*/
	#[test_only]
	public fun origin (
		aptos_framework_consenter: & signer
	) : (
		coin::BurnCapability<AptosCoin>,
		coin::FreezeCapability<AptosCoin>,
		coin::MintCapability<AptosCoin>		
	) {
		use std::string;
		use aptos_framework::chain_id;
		chain_id::initialize_for_test (aptos_framework_consenter, 2);
		
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

