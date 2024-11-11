



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
		
		//
		//	Mint 
		//
		//
        let coins = coin::mint<AptosCoin>(2000, &mint_cap);
        coin::deposit (estate_1_spot, coins);
		
		
		
		
		let to_send : u64 = 100;
		coin::transfer<AptosCoin>(estate_1_flourisher, estate_2_spot, to_send);
		
		
		
		Pergola_Taffoni::establish_Taffoni (estate_1_flourisher);
		if (Pergola_Taffoni::has_Taffoni (estate_1_spot) != utf8 (b"yep")) {
			debug::print (& utf8 (b""));
			abort 89319
		};
		if (Pergola_Taffoni::retrieve_Taffoni_AptosCoin_amount (estate_1_flourisher) != 0) {
			abort 89349
		};
	
		//
		//	.. save coins in the taffoni
		//
		//
		let to_send_to_taffoni : u64 = 100;
		Pergola_Taffoni::add_AptosCoin_to_Taffoni (estate_1_flourisher, to_send_to_taffoni);
		
		
        coin::destroy_mint_cap (mint_cap);
        coin::destroy_freeze_cap (freeze_cap);


		burn_cap
    }

	
	/*
		Unfinished:
			
		mint:
			https://aptos.dev/en/build/smart-contracts/move-reference?page=aptos-framework%2Fdoc%2Fcoin.md#0x1_coin_mint
		
		transfer:
			https://aptos.dev/en/build/smart-contracts/move-reference?page=aptos-framework%2Fdoc%2Fcoin.md#0x1_coin_transfer
	*/
	#[test (
		estate_1_signer = @ride,
		estate_2_signer = @ride_2
	)]
    public fun steady_estate_APT_coins (
		estate_1_signer : signer,
		estate_2_signer : signer	
	) {
		use std::debug;
		use std::signer;

		use aptos_framework::aptos_coin::{ Self, AptosCoin };
		use aptos_framework::coin;
		
		let estate_1_spot = signer::address_of (& estate_1_signer);
		let estate_2_spot = signer::address_of (& estate_2_signer);
		
		// let estate_1_legacy_address : address = @0x99caba6e28919a1ef5ada895a9e0b1093159f823c523eaf5eddf5cfdc3293e2f;
		// let estate_1_legacy_address : address = @0x652b8d45aebc4237cb4a4ca1d8b99725d8f973676844fe85eb09286d7f9d3808;
		
		let u64_1 : u64 = coin::balance<AptosCoin>(estate_1_spot);
		if (u64_1 != 0) {
			debug::print (& u64_1);
			abort 947283
		};
		
		

		
		
		
		
		
		
		
		aptos_coin::claim_mint_capability (& estate_1_signer);
		
		if (aptos_coin::has_mint_capability (& estate_1_signer) != true) {
			abort 947284
		};
		
		
		/*
		let found : u64 = 1000;
		coin::mint<AptosCoin>(& estate_1_signer, found);
		*/
		
		let to_send : u64 = 100;
		coin::transfer<AptosCoin>(& estate_1_signer, estate_2_spot, to_send);
		
        // let u64_1 : u64 = Pergola::APT_scoreboard <aptos_coin::AptosCoin> (estate_1_legacy_address);

    }

}