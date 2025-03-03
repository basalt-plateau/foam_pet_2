





module Builder_01::Hulls_can_begin {
	use std::string::{ String };
	
	#[view] public fun Volitions () : String { 
		use Builder_01::Rules_Module;
		Rules_Module::Volitions_01 () 
	}
	
	// ruler_01_consenter : signer
	
	#[test_only]
	public fun Vow_01 () {	
		use std::string::{ utf8 };
		use std::signer;
		
		use aptos_framework::coin;
		use aptos_framework::aptos_coin::AptosCoin;
		use aptos_framework::account;		
		
		use Builder_01::Module_Ruler_Hulls;
		use Builder_01::Module_Denizen_Texts;
		use Builder_01::Module_Guest_Hulls;
		use Builder_01::Vow_Parts_01; 
	
		let aptos_framework_consenter : signer = account::create_account_for_test (@0x1);
		let ruler_01_consenter : signer = account::create_account_for_test (@Ruler_01);
	
		let one_APT : u64 = 100000000; 
		let apt_mint : u64 = one_APT * 100;
		
		let ruler_address = signer::address_of (& ruler_01_consenter);
		Vow_Parts_01::clock (& aptos_framework_consenter);
		
		let (burn_cap, freeze_cap, mint_cap) = Vow_Parts_01::origin (& aptos_framework_consenter);
		let coins = coin::mint<AptosCoin>(apt_mint, & mint_cap);
		account::create_account_for_test (ruler_address);
		coin::register<AptosCoin>(& ruler_01_consenter);
		coin::deposit (ruler_address, coins);
		
		
		////
		//
		//	Hull Begin
		//
		//
		assert! (Module_Guest_Hulls::are_built () == utf8 (b"no"), 1);
		Module_Ruler_Hulls::Begin (& ruler_01_consenter);
		assert! (Module_Guest_Hulls::are_built () == utf8 (b"yup"), 1);
		//
		////
		
		

		
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