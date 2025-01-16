

module Ride_01::Accounts_With_Aptos_01_Create {
	
	use std::string_utils;
	use std::string::{ Self, String, utf8, sub_string };
	use std::debug;
	use std::coin;
	use std::aptos_account::{ create_account };
	use std::account::{ exists_at };
	
	use aptos_framework::aptos_coin::AptosCoin;
	
	#[view] public fun create_one_account_with_Aptos (address_of_account : address) : String {
		let address_string : String = address_as_string (address_of_account);
		
		if (exists_at (address_of_account)) {
			let result = utf8 (b"");
			string::append (&mut result, utf8 (b"Address \""));
			string::append (&mut result, address_string);
			string::append (&mut result, utf8 (b"\" is already an account with Aptos."));
			return result
		};
		
		create_account (address_of_account);
		
		if (exists_at (address_of_account)) {
			debug::print (& address_as_string (address_of_account));
			debug::print (& address_of_account);
			
			let result = utf8 (b"");
			string::append (&mut result, utf8 (b"Address \""));
			string::append (&mut result, address_string);
			string::append (&mut result, utf8 (b"\" is now an account with Aptos."));
			return result
		};
		
		return utf8 (b"For some reason an account with Aptos at that address was not created.")
	}
	
	/*
		from:
			\"@0xc97b5f08866f28d943e045a52c5235b99c2beec56810f09c3a56d95afe3b3649\"
			
		to:
			"c97b5f08866f28d943e045a52c5235b99c2beec56810f09c3a56d95afe3b3649"
			
			C97B5F08866F28D943E045A52C5235B99C2BEEC56810F09C3A56D95AFE3B3649
	*/
	#[view] public fun address_as_string (address_0001 : address) : String {	
		let canonical_address = string_utils::to_string_with_canonical_addresses (& address_0001);
		let canonical_address_1 = string::sub_string (& canonical_address, 1, 65);
		initialize_address_string (canonical_address_1)
	}
	
	
	//
	//	From: c97b5f08866f28d943e045a52c5235b99c2beec56810f09c3a56d95afe3b3649
	//	To:   C97B5F08866F28D943E045A52C5235B99C2BEEC56810F09C3A56D95AFE3B3649
	//
	//	similar:
	//		capitalize, upper case, majorize, properize
	//		acronymize
	//
	#[view]
	public fun initialize_address_string (address_string : String) : String {
		let result = utf8 (b"");
		
		let last_index = string::length (& address_string);
		for (index in 0..last_index) {
			let emblem = sub_string (& address_string, index, index + 1);
			
			if (emblem == utf8 (b"a")) {
				string::append (&mut result, utf8 (b"A"));
			}
			else if (emblem == utf8 (b"b")) {
				string::append (&mut result, utf8 (b"B"));
			}
			else if (emblem == utf8 (b"c")) {
				string::append (&mut result, utf8 (b"C"));
			}
			else if (emblem == utf8 (b"d")) {
				string::append (&mut result, utf8 (b"D"));
			}
			else if (emblem == utf8 (b"e")) {
				string::append (&mut result, utf8 (b"E"));
			}
			else if (emblem == utf8 (b"f")) {
				string::append (&mut result, utf8 (b"F"));
			}
			else {
				string::append (&mut result, emblem);
			};
		};
		
		result
	}
	
	#[test (
		aptos_framework_wisher = @0x1
	)]
	public fun steady_create_one_account (
		aptos_framework_wisher : & signer
	) {	
		let (burn_cap, freeze_cap, mint_cap) = origin (aptos_framework_wisher);
		let legacy_address : address = @0xC97B5F08866F28D943E045A52C5235B99C2BEEC56810F09C3A56D95AFE3B3649;
		
		if (create_one_account_with_Aptos (legacy_address) != utf8 (
			b"Address \"C97B5F08866F28D943E045A52C5235B99C2BEEC56810F09C3A56D95AFE3B3649\" is now an account with Aptos."
		)) { abort 1 };
		
		if (create_one_account_with_Aptos (legacy_address) != utf8 (
			b"Address \"C97B5F08866F28D943E045A52C5235B99C2BEEC56810F09C3A56D95AFE3B3649\" is already an account with Aptos."
		)) { abort 1 };
		
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
	
	
	
	/*
		let (burn_cap, freeze_cap, mint_cap) = origin (& aptos_framework_consenter);
		
		coin::destroy_mint_cap (mint_cap);
		coin::destroy_freeze_cap (freeze_cap);
		coin::destroy_burn_cap (burn_cap);
	*/
	#[test_only]
	public fun origin (aptos_framework_wisher : & signer) : (
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
			aptos_framework_wisher,
			string::utf8 (b"Swerve"),
			string::utf8 (b"SWE"),
			decimals,
			monitor_supply
		);
		
		(burn_cap, freeze_cap, mint_cap)
	}
	
}