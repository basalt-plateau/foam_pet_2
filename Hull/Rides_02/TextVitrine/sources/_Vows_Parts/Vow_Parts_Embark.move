


module Builder_01::Vow_Parts_Embark {
	
	use aptos_framework::aptos_coin::AptosCoin;
	use aptos_framework::coin;
	use std::string::{ String };
	use std::signer;
	
	#[view] public fun Volitions () : String { 
		use Builder_01::Rules_Module; Rules_Module::Volitions_01 () 
	}
	
	
	struct Venue has key {
		burn : coin::BurnCapability<AptosCoin>,
		freeze : coin::FreezeCapability<AptosCoin>,
		mint : coin::MintCapability<AptosCoin>
	}

	
	/*
		let venue = Builder_01::Vow_Parts_Embark::Produce (& aptos_framework_acceptor);
		Builder_01::Vow_Parts_Embark::Expire (& aptos_framework_acceptor, venue);
	*/
	#[test_only]
	public fun Expire (acceptor : & signer, venue : Venue) {
		coin::destroy_mint_cap (venue.mint);
		coin::destroy_freeze_cap (venue.freeze);
		coin::destroy_burn_cap (venue.burn);
		
		move_to<Venue>(acceptor, venue);
	} 
	

	#[test_only]
	public fun Produce (
		aptos_framework_acceptor: & signer,
		octas_to_mint : u64,
		ruler_000001 : & signer
	) : Venue {
		use std::string;
		use aptos_framework::chain_id;
		
		use aptos_framework::coin;
		use aptos_framework::aptos_coin::AptosCoin;
		use aptos_framework::account;	
		
		
		chain_id::initialize_for_test (aptos_framework_acceptor, 2);
		
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
			aptos_framework_acceptor,
			string::utf8 (b"Swerve"),
			string::utf8 (b"SWE"),
			decimals,
			monitor_supply
		);
		
		let coins = coin::mint<AptosCoin>(octas_to_mint, & mint_cap);

		
		
		/*
		
		
		*/
		let ruler_address = signer::address_of (ruler_000001);
		account::create_account_for_test (ruler_address);
		coin::register<AptosCoin>(ruler_000001);
		coin::deposit (ruler_address, coins);
		
		
		// coin::deposit (estate_1_spot, coins);
		
		Builder_01::Vow_Parts_Rhythm::Embark_Clock (aptos_framework_acceptor, 946728000000);
		
		
		let venue = Venue {
			burn : burn_cap,
			freeze : freeze_cap,
			mint : mint_cap
		};
		
		venue
	}
}