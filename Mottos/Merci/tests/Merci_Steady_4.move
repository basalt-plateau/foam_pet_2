
/*
	https://aptos.dev/en/build/smart-contracts/move-reference?page=aptos-stdlib%2Fdoc%2Fsimple_map.md#@Specification_1_add
*/

module ride_1::Merci_Steady_4 {
	
	use std::string::{ String };
	
	#[view]
	public fun Bayanihan () : String {
		use ride_1::Merci_Bayanihan;
		Merci_Bayanihan::Bayanihan ()
	}	
	
	use aptos_framework::coin;
	use aptos_framework::aptos_coin::AptosCoin;
	#[test (
		aptos_framework_flourisher = @0x1 
	)]
	fun origin (aptos_framework_flourisher: & signer) : (
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
            aptos_framework_flourisher,
            string::utf8 (b"AptosCoin_Vow"),
            string::utf8 (b"ACV"),
            decimals,
            monitor_supply
        );
		
		// let coins = coin::mint<AptosCoin>(10000, &mint_cap);
        // coin::deposit (estate_1_spot, coins);
		
		(burn_cap, freeze_cap, mint_cap)
	}
	
	/*
	fun end () {
		coin::destroy_mint_cap (mint_cap);
        coin::destroy_freeze_cap (freeze_cap);
		coin::destroy_burn_cap (burn_cap);
	}
	*/
	

	
	#[test (
		aptos_framework_flourisher = @0x1, 
	
		estate_1_flourisher = @ride_1, 
		estate_2_flourisher = @ride_2,
		estate_3_flourisher = @ride_3		
	)]
    public fun novel_1_establish_join_send_leave (
		aptos_framework_flourisher: & signer,
	
		estate_1_flourisher : signer,
		estate_2_flourisher : signer,
		estate_3_flourisher : signer		
	) {	
		use std::debug;
		use std::signer;
		use std::string_utils;
		use std::string::{ utf8 };
		use std::string;

		use aptos_framework::account;
		use aptos_framework::aptos_account;
		use aptos_framework::aptos_coin::AptosCoin;
		use aptos_framework::coin::{ Self, Coin };
		use aptos_framework::timestamp;

		use ride_1::Merci_Novelist;
		use ride_1::Merci_Harvest;
		use ride_1::Merci_Gifts;
		use ride_1::Merci_Parties;
		
		let novelist : address = Merci_Novelist::ask_for_address_of_novelist ();
		
		let estate_1_spot = signer::address_of (& estate_1_flourisher);
		let estate_2_spot = signer::address_of (& estate_2_flourisher);
		let estate_3_spot = signer::address_of (& estate_3_flourisher);
		
		debug::print (& string_utils::format1 (& b"estate_1_spot: {}", estate_1_spot));
		debug::print (& string_utils::format1 (& b"equal: {}", estate_1_spot == novelist));
		
		/*
			Origin

		*/
		let (burn_cap, freeze_cap, mint_cap) = origin (aptos_framework_flourisher);
		

		
		
		/*
			Establishing:
				Estate 1	
				
			Guarantee:
				* Estate AptosCoin Balance
				* Estate 1 joined harvest
				* Estate 1 mercy amount is correct
				* Parties count = 1
		*/
		let mercyverse : u256 = 10000000000000000000000000000000000000000000000000000000000000000000000000000;
		Merci_Harvest::ask_to_establish_harvest (& estate_1_flourisher, mercyverse);
		account::create_account_for_test (estate_1_spot);
        coin::register<AptosCoin>(& estate_1_flourisher);
		if (coin::balance<AptosCoin>(estate_1_spot) != 0) { abort 89389 };
		if (Merci_Harvest::ask_if_a_party_joined_the_harvest (estate_1_spot) != utf8 (b"yup")) { abort 1 };
		if (Merci_Harvest::ask_for_le_amount_of_mercy_that_a_party_has (estate_1_spot) != mercyverse) { abort 2 };
		if (Merci_Harvest::ask_for_party_count () != 1) { abort 7 };
		
		/*
			Joining:
				Estate 2
				
			Guarantee:
				* Estate AptosCoin Balance
		*/
		Merci_Harvest::ask_to_join_harvest (& estate_2_flourisher);
		account::create_account_for_test (estate_2_spot);
		coin::register<AptosCoin>(& estate_2_flourisher);
		if (Merci_Harvest::ask_if_a_party_joined_the_harvest (estate_2_spot) != utf8 (b"yup")) { abort 3 };
		if (Merci_Harvest::ask_for_le_amount_of_mercy_that_a_party_has (estate_2_spot) != 0) { abort 4 };
		if (Merci_Harvest::ask_for_party_count () != 2) { abort 7 };
		if (coin::balance<AptosCoin>(estate_2_spot) != 0) { abort 89389 };
		
		/*
			Joining:
				Estate 3	
				
			Guarantee:
				* Estate AptosCoin Balance
		*/
		Merci_Harvest::ask_to_join_harvest (& estate_3_flourisher);
		if (Merci_Harvest::ask_if_a_party_joined_the_harvest (estate_3_spot) != utf8 (b"yup")) { abort 5 };
		if (Merci_Harvest::ask_for_le_amount_of_mercy_that_a_party_has (estate_3_spot) != 0) { abort 6 };
		if (Merci_Harvest::ask_for_party_count () != 3) { abort 7 };
		
		
		/*
			Mint AptosCoin
		*/
		let coins = coin::mint<AptosCoin>(10000, &mint_cap);
        
		
		/*
			
		*/
		coin::deposit (estate_1_spot, coins);
		if (coin::balance<AptosCoin>(estate_1_spot) != 10000) { abort 89389 };
		if (coin::balance<AptosCoin>(estate_2_spot) != 0) { abort 89389 };
		if (coin::balance<AptosCoin>(estate_3_spot) != 0) { abort 89389 };
		
		
		/*
			
		
		
		*/
		coin::destroy_mint_cap (mint_cap);
        coin::destroy_freeze_cap (freeze_cap);
		coin::destroy_burn_cap (burn_cap);
		
		// burn_cap
	}
}


