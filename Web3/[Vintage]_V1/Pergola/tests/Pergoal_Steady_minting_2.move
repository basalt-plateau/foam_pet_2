



/*
	This is probabaly tough.

*/

module ride::Pergola_Steady_minting_2 {

	
	const Problem : u64 = 0;


	use aptos_framework::coin::BurnCapability;
	use aptos_framework::aptos_coin::AptosCoin;
	
	
	/*
		This is from defi/locked_coins.move
		
			sponsor = @0x123
	*/
	#[test (
		aptos_framework = @0x1, 
		
		estate_1_flourisher = @ride,
		estate_2_flourisher = @ride_2
	)]
	fun setup (
		aptos_framework: & signer,
		estate_1_flourisher: & signer,
		estate_2_flourisher : & signer
	): BurnCapability<AptosCoin> {
		use aptos_framework::coin::{Self, Coin};
		use aptos_framework::event;
		use aptos_framework::timestamp;
		use aptos_framework::account;
		
		use aptos_framework::aptos_account;
		
		use aptos_std::table::{Self, Table};
		use std::error;
		use std::signer;
		use std::vector;
		use std::string;
		use std::string::{ utf8 };
		use std::debug;
		use std::string_utils;
		
		use ride::Pergola_Taffoni;
		
        timestamp::set_time_has_started_for_testing (aptos_framework);
		
		//
		//

        let (burn_cap, freeze_cap, mint_cap) = coin::initialize<AptosCoin>(
            aptos_framework,
            string::utf8(b"TC"),
            string::utf8(b"TC"),
            8,
            false,
        );
		
		//
		//	Create Accounts
		//
		//
		let estate_1_spot = signer::address_of (estate_1_flourisher);
        account::create_account_for_test (estate_1_spot);
        coin::register<AptosCoin>(estate_1_flourisher);
		
		let estate_2_spot = signer::address_of (estate_2_flourisher);
		account::create_account_for_test (estate_2_spot);
		coin::register<AptosCoin>(estate_2_flourisher);
		
		let taffoni_address = estate_1_spot;
		
		
		//
		//	Mint 
		//
		//
        let coins = coin::mint<AptosCoin>(10000, &mint_cap);
        coin::deposit (estate_1_spot, coins);
		
		
		//
		//	Establish a Taffoni.
		//
		//
		Pergola_Taffoni::establish_Taffoni (estate_1_flourisher);
		if (Pergola_Taffoni::has_Taffoni (estate_1_spot) != utf8 (b"yep")) {
			debug::print (& utf8 (b""));
			abort 89319
		};
		if (Pergola_Taffoni::retrieve_Taffoni_AptosCoin_amount (estate_1_spot) != 0) {
			abort 89349
		};
	
	
	
		//
		//	Sends coins to the taffoni.
		//
		//
		let to_send_to_taffoni : u64 = 2000;
		Pergola_Taffoni::add_AptosCoin_to_Taffoni (
			estate_1_flourisher, 
			taffoni_address,
			to_send_to_taffoni
		);
		if (Pergola_Taffoni::retrieve_Taffoni_AptosCoin_amount (estate_1_spot) != to_send_to_taffoni) {
			abort 89387
		};
		if (coin::balance<AptosCoin>(estate_1_spot) != 8000) {
			abort 89389
		};
		debug::print (& string_utils::format1 (& b"after send: taffoni_coin_amount: {}", Pergola_Taffoni::retrieve_Taffoni_AptosCoin_amount (estate_1_spot)));
		debug::print (& string_utils::format1 (& b"after send: estate_1_coins: {}", coin::balance<AptosCoin>(estate_1_spot)));
		
		
		//
		//	Take coins from the taffoni.
		//
		//
		let to_ship_from_taffoni : u64 = 1000;
		Pergola_Taffoni::ship_AptosCoin_from_Taffoni (
			estate_1_flourisher, 
			taffoni_address,
			to_ship_from_taffoni
		);
		if (Pergola_Taffoni::retrieve_Taffoni_AptosCoin_amount (estate_1_spot) != to_ship_from_taffoni) {
			abort 89387
		};
		if (coin::balance<AptosCoin>(estate_1_spot) != 9000) {
			abort 89389
		};
		debug::print (& string_utils::format1 (& b"estate_1_coins: {}", coin::balance<AptosCoin>(estate_1_spot)));
		debug::print (& string_utils::format1 (& b"after send: taffoni_coin_amount: {}", Pergola_Taffoni::retrieve_Taffoni_AptosCoin_amount (estate_1_spot)));
		
		
        coin::destroy_mint_cap (mint_cap);
        coin::destroy_freeze_cap (freeze_cap);
		
		burn_cap
    }

	
	/*
		APT Transfer:
		
			important:
				mint:
					https://aptos.dev/en/build/smart-contracts/move-reference?page=aptos-framework%2Fdoc%2Fcoin.md#0x1_coin_mint
		
				transfer:
					https://aptos.dev/en/build/smart-contracts/move-reference?page=aptos-framework%2Fdoc%2Fcoin.md#0x1_coin_transfer
	*/
	#[test (
		aptos_framework = @0x1, 
		
		estate_1_flourisher = @ride,
		estate_2_flourisher = @ride_2
	)]
	fun can_mint (
		aptos_framework: & signer,
		estate_1_flourisher: & signer,
		estate_2_flourisher : & signer
	): BurnCapability<AptosCoin> {
		use aptos_framework::coin::{Self, Coin};
		use aptos_framework::event;
		use aptos_framework::timestamp;
		use aptos_framework::account;
		
		use aptos_framework::aptos_account;
		
		use aptos_std::table::{Self, Table};
		use std::error;
		use std::signer;
		use std::vector;
		use std::string;
		use std::string::{ utf8 };
		use std::debug;
		
        timestamp::set_time_has_started_for_testing (aptos_framework);
		
		//
		//

        let (burn_cap, freeze_cap, mint_cap) = coin::initialize<AptosCoin>(
            aptos_framework,
            string::utf8(b"TC"),
            string::utf8(b"TC"),
            8,
            false,
        );
		
		//
		//	Create Accounts
		//
		//
		let estate_1_spot = signer::address_of (estate_1_flourisher);
        account::create_account_for_test (estate_1_spot);
        coin::register<AptosCoin>(estate_1_flourisher);
		
		let estate_2_spot = signer::address_of (estate_2_flourisher);
		account::create_account_for_test (estate_2_spot);
		coin::register<AptosCoin>(estate_2_flourisher);
		
		//
		//	Mint 
		//
		//
        let coins = coin::mint<AptosCoin>(2000, &mint_cap);
        coin::deposit (estate_1_spot, coins);

		
		//
		//	Send coins to estate 2.
		//
		//
		let to_send : u64 = 100;
		coin::transfer<AptosCoin>(estate_1_flourisher, estate_2_spot, to_send);
		
        coin::destroy_mint_cap (mint_cap);
        coin::destroy_freeze_cap (freeze_cap);
		burn_cap
    }

}