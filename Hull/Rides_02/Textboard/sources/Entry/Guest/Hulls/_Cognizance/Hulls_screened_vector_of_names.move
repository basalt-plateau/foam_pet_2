





module Builder_01::Cognizance__Hulls_screened_vector_of_names {
	use std::string::{ String };
	
	#[view] public fun Volitions () : String { 
		use Builder_01::Rules_Module;
		Rules_Module::Volitions_01 () 
	}
	
	// producer_01_consenter : signer
	struct Boat {}
	
	
	fun obtain_boats (
		private_keys : vector<address>
	) {
		use aptos_framework::account;
		use std::signer;
		
		
	}
	
	
	/*
		obtain_boat (@0x100000);
	*/
	fun obtain_boat (
		boat_private_key : address
	) {
		use aptos_framework::coin;
		use aptos_framework::aptos_coin::AptosCoin;
		use aptos_framework::account;
		use std::signer;
		
		let boat_consenter : & signer = & account::create_account_for_test (boat_private_key);
		let boat_address = signer::address_of (boat_consenter);
		account::create_account_for_test (boat_address);
		coin::register<AptosCoin>(boat_consenter);
		
		
	}
	
	#[test]
	public fun Vow_01 () {	
		use std::string_utils;
		use std::string::{ utf8 };
		use std::signer;
		use std::debug;
		
		use aptos_framework::coin;
		use aptos_framework::aptos_coin::AptosCoin;
		use aptos_framework::account;		
		
		use Builder_01::Module_Producer_Hulls;
		use Builder_01::Module_Producer_Texts;
		use Builder_01::Module_Guest_Hulls;
		use Builder_01::Module_Guest_Hull;
		use Builder_01::Module_Guest_Texts;
		use Builder_01::Module_Hulls; 
		use Builder_01::Vow_Parts_01; 
	
		let aptos_framework_consenter : signer = account::create_account_for_test (@0x1);
		let producer_01_consenter : signer = account::create_account_for_test (@Producer_01);
	
		let one_APT : u64 = 100000000; 
		let apt_mint : u64 = one_APT * 100;
		
		let producer_address = signer::address_of (& producer_01_consenter);
		Vow_Parts_01::clock (& aptos_framework_consenter);
		
		let (burn_cap, freeze_cap, mint_cap) = Vow_Parts_01::origin (& aptos_framework_consenter);
		let coins = coin::mint<AptosCoin>(apt_mint, & mint_cap);
		account::create_account_for_test (producer_address);
		coin::register<AptosCoin>(& producer_01_consenter);
		coin::deposit (producer_address, coins);
		
		
		////
		//
		//	Hull Begin
		//
		//
		assert! (Module_Guest_Hulls::are_built () == utf8 (b"no"), 1);
		Module_Producer_Hulls::Begin (& producer_01_consenter);
		assert! (Module_Guest_Hulls::are_built () == utf8 (b"yup"), 1);
		//
		////
		
		
		obtain_boat (@0x100000);
		
		////
		//	
		//	Heiress Boats:
		//	
		//	
		let boat_01_consenter : & signer = & account::create_account_for_test (@0x100000);
		let boat_01_address = signer::address_of (boat_01_consenter);
		account::create_account_for_test (boat_01_address);
		coin::register<AptosCoin>(boat_01_consenter);
		//
		let boat_02_consenter : & signer = & account::create_account_for_test (@0x100001);
		let boat_02_address = signer::address_of (boat_02_consenter);
		account::create_account_for_test (boat_02_address);
		coin::register<AptosCoin>(boat_02_consenter);
		//
		coin::transfer<AptosCoin>(& producer_01_consenter, boat_01_address, one_APT * 10);
		//
		////
		
		
		Module_Guest_Texts::Send_Text (
			boat_01_consenter, 
			utf8 (b""), 
			utf8 (b""), 
			utf8 (b"I consent.")
		);
		
		

		
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