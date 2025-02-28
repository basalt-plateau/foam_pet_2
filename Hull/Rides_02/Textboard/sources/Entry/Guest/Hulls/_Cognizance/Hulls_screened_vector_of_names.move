





module Builder_01::Cognizance__Hulls_screened_vector_of_names {
	use std::string::{ String };
	
	#[view] public fun Volitions () : String { 
		use Builder_01::Rules_Module;
		Rules_Module::Volitions_01 () 
	}
	
	// producer_01_consenter : signer
	struct Group has drop {
		consenter : signer,
		address : address
	}
	
	
	fun form_groups (
		private_keys : vector<address>
	) {
		use aptos_framework::account;
		use std::signer;
		
		
	}
	
	
	/*
		form_group (@0x100000);
	*/
	fun form_group (
		group_private_key : address
	) : Group {
		use aptos_framework::coin;
		use aptos_framework::aptos_coin::AptosCoin;
		use aptos_framework::account;
		use std::signer;
		
		let group_consenter : signer = account::create_account_for_test (group_private_key);
		let group_address = signer::address_of (& group_consenter);
		account::create_account_for_test (group_address);
		coin::register<AptosCoin>(& group_consenter);
		
		let group = Group {
			consenter : group_consenter,
			address : group_address
		};
		
		group
	}
	
	#[test]
	public fun Vow_01 () {	
		use std::vector;
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
		
		
		
		
		////
		//	
		//	Groups:
		//	
		//	
		let group_01 = form_group (@0x100000);
		let group_02 = form_group (@0x100001);
		//
		coin::transfer<AptosCoin>(& producer_01_consenter, group_01.address, one_APT * 10);
		coin::transfer<AptosCoin>(& producer_01_consenter, group_02.address, one_APT * 10);
		//
		////
		
		
		Module_Guest_Texts::Send_Text (& group_01.consenter, utf8 (b"text 1"), utf8 (b"platform 1"), utf8 (b"I consent."));
		Module_Guest_Texts::Send_Text (& group_02.consenter, utf8 (b"text 2"), utf8 (b"platform 1"), utf8 (b"I consent."));
		
		Module_Guest_Texts::Send_Text (& group_01.consenter, utf8 (b"text 1"), utf8 (b"platform 2"), utf8 (b"I consent."));
		Module_Guest_Texts::Send_Text (& group_01.consenter, utf8 (b"text 1"), utf8 (b"platform 3"), utf8 (b"I consent."));
		
		Module_Guest_Texts::Send_Text (& group_01.consenter, utf8 (b"text 1"), utf8 (b"mall 1"), utf8 (b"I consent."));
		Module_Guest_Texts::Send_Text (& group_01.consenter, utf8 (b"text 1"), utf8 (b"mall 2"), utf8 (b"I consent."));
		
		
		let hulls_with_group = & Module_Guest_Hulls::Retrieve_Screened_Hulls_Info (utf8 (b"group"));
		assert! (vector::length (hulls_with_group) == 2, 1);
		assert! (vector::borrow (hulls_with_group, 0).platform_name == utf8 (b"mall 1"), 1);
		assert! (vector::borrow (hulls_with_group, 1).platform_name == utf8 (b"mall 2"), 1);
		
		/*
		let hulls_with_group = & Module_Guest_Hulls::Retrieve_Screened_Hulls_Info (utf8 (b"platform"));
		assert! (vector::length (hulls_with_group) == 3, 1);
		assert! (vector::borrow (hulls_with_group, 0) == & utf8 (b"platform 1"), 1);
		assert! (vector::borrow (hulls_with_group, 0) == & utf8 (b"platform 2"), 1);
		assert! (vector::borrow (hulls_with_group, 0) == & utf8 (b"platform 3"), 1);
		*/
		
		
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