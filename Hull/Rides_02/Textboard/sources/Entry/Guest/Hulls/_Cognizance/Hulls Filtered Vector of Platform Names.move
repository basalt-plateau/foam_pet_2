





module Builder_01::Cognizance__Hulls_filtered_vector_of_names {
	use std::string::{ String };
	use Builder_01::Cognizance__Group::{
		make_group,
		group_acceptor_amp,
		group_address
	};
	
	#[view] public fun Volitions () : String { 
		use Builder_01::Rules_Module;
		Rules_Module::Volitions_01 () 
	}
	
	
	


	
	#[test]
	public fun Vow_01 () {	
		use std::vector;
		use std::string::{ utf8 };
		use std::signer;
		
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
		use Builder_01::Module_Hull_Info_Envelope::{
			Hull_Info_Envelope__retrieve_platform_name
		};
	
		let aptos_framework_acceptor : signer = account::create_account_for_test (@0x1);
		let producer_01_acceptor : signer = account::create_account_for_test (@Producer_01);
	
		let one_APT : u64 = 100000000; 
		let apt_mint : u64 = one_APT * 100;
		
		let producer_address = signer::address_of (& producer_01_acceptor);
		Vow_Parts_01::clock (& aptos_framework_acceptor);
		
		let (burn_cap, freeze_cap, mint_cap) = Vow_Parts_01::origin (& aptos_framework_acceptor);
		let coins = coin::mint<AptosCoin>(apt_mint, & mint_cap);
		account::create_account_for_test (producer_address);
		coin::register<AptosCoin>(& producer_01_acceptor);
		coin::deposit (producer_address, coins);
		
		
		////
		//
		//	Hull Begin
		//
		//
		assert! (Module_Guest_Hulls::are_built () == utf8 (b"no"), 1);
		Module_Producer_Hulls::Begin (& producer_01_acceptor);
		assert! (Module_Guest_Hulls::are_built () == utf8 (b"yup"), 1);
		//
		////
		
		
		
		
		////
		//	
		//	Groups:
		//	
		//	
		let group_01 = make_group (@0x100000);
		let group_01_acceptor_amp = group_acceptor_amp (& group_01);
		let group_01_address = group_address (& group_01);
		//
		let group_02 = make_group (@0x100001);
		let group_02_acceptor_amp = group_acceptor_amp (& group_02);
		let group_02_address = group_address (& group_02);
		//
		coin::transfer<AptosCoin>(& producer_01_acceptor, group_01_address, one_APT * 10);
		coin::transfer<AptosCoin>(& producer_01_acceptor, group_02_address, one_APT * 10);
		//
		////
		
		Module_Guest_Texts::Send_Text (group_01_acceptor_amp, utf8 (b"text 1"), utf8 (b"room 1"), utf8 (b"I accept."));
		Module_Guest_Texts::Send_Text (group_02_acceptor_amp, utf8 (b"text 2"), utf8 (b"room 1"), utf8 (b"I accept."));
		Module_Guest_Texts::Send_Text (group_01_acceptor_amp, utf8 (b"text 1"), utf8 (b"room 2"), utf8 (b"I accept."));
		Module_Guest_Texts::Send_Text (group_01_acceptor_amp, utf8 (b"text 1"), utf8 (b"room 3"), utf8 (b"I accept."));
		Module_Guest_Texts::Send_Text (group_01_acceptor_amp, utf8 (b"text 1"), utf8 (b"ride 1"), utf8 (b"I accept."));
		Module_Guest_Texts::Send_Text (group_01_acceptor_amp, utf8 (b"text 1"), utf8 (b"ride 2"), utf8 (b"I accept."));
		
		let hulls_with_ride = & Module_Guest_Hulls::Retrieve_Screened_Hulls_Info (utf8 (b"ride"));
		assert! (vector::length (hulls_with_ride) == 2, 1);
		assert! (Hull_Info_Envelope__retrieve_platform_name (vector::borrow (hulls_with_ride, 0)) == utf8 (b"ride 1"), 1);
		assert! (Hull_Info_Envelope__retrieve_platform_name (vector::borrow (hulls_with_ride, 1)) == utf8 (b"ride 2"), 1);
		
		
		let hulls_with_room = & Module_Guest_Hulls::Retrieve_Screened_Hulls_Info (utf8 (b"room"));
		assert! (vector::length (hulls_with_room) == 3, 1);
		assert! (Hull_Info_Envelope__retrieve_platform_name (vector::borrow (hulls_with_room, 0)) == utf8 (b"room 1"), 1);
		assert! (Hull_Info_Envelope__retrieve_platform_name (vector::borrow (hulls_with_room, 1)) == utf8 (b"room 2"), 1);
		assert! (Hull_Info_Envelope__retrieve_platform_name (vector::borrow (hulls_with_room, 2)) == utf8 (b"room 3"), 1);
		
		
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