


module Publisher_01::Allowed_Wallets_02_Vows {
	
	
	use std::string::{ utf8, String };
	
	use Publisher_01::Allowed_Wallets_02;
	
	#[view] public fun Volitions () : String { use Publisher_01::Rules_10; Rules_10::Volitions_01 () }
	
	#[test (
		producer_01_consenter = @0xfbe0b4eca5928cc51e2a36ef25bc479cf24b22040b5571dd6d0a37283f99a240,
		aptos_framework_consenter = @0x1
	)]
	public fun steady (
		producer_01_consenter : & signer,
		aptos_framework_consenter : & signer
	) {	
		use std::vector;
		use aptos_framework::chain_id;
		
		chain_id::initialize_for_test (aptos_framework_consenter, 1);
		
		//
		//	Establish the allowed wallets: 4 Wallets
		//		
		//		
		let allowed_wallets_01 = vector::empty<String>();
		vector::push_back (&mut allowed_wallets_01, utf8 (b"Petra"));
		vector::push_back (&mut allowed_wallets_01, utf8 (b"Rise"));
		vector::push_back (&mut allowed_wallets_01, utf8 (b"Pontem"));
		vector::push_back (&mut allowed_wallets_01, utf8 (b"Mech"));

		assert! (Allowed_Wallets_02::is_established () == utf8 (b"no"));
		Allowed_Wallets_02::establish (producer_01_consenter, allowed_wallets_01);
		assert! (Allowed_Wallets_02::is_established () == utf8 (b"yup"));
		
		
		let allowed_wallets_02 = Allowed_Wallets_02::retrieve ();
		assert! (vector::borrow (& allowed_wallets_02, 0) == & utf8 (b"Petra"), 1);
		assert! (vector::borrow (& allowed_wallets_02, 1) == & utf8 (b"Rise"), 1);
		assert! (vector::borrow (& allowed_wallets_02, 2) == & utf8 (b"Pontem"), 1);
		assert! (vector::borrow (& allowed_wallets_02, 3) == & utf8 (b"Mech"), 1);
		assert! (vector::length (& allowed_wallets_02) == 4);
		
		
		//
		//	Change the allowed wallets: 3 Wallets
		//		
		//
		let allowed_wallets_03 = vector::empty<String>();
		vector::push_back (&mut allowed_wallets_03, utf8 (b"Petra"));
		vector::push_back (&mut allowed_wallets_03, utf8 (b"Rise"));
		vector::push_back (&mut allowed_wallets_03, utf8 (b"Pontem"));
		Allowed_Wallets_02::change (producer_01_consenter, allowed_wallets_03);
		
		let allowed_wallets_04 = Allowed_Wallets_02::retrieve ();
		assert! (vector::borrow (& allowed_wallets_04, 0) == & utf8 (b"Petra"), 1);
		assert! (vector::borrow (& allowed_wallets_04, 1) == & utf8 (b"Rise"), 1);
		assert! (vector::borrow (& allowed_wallets_04, 2) == & utf8 (b"Pontem"), 1);
		assert! (vector::length (& allowed_wallets_04) == 3);
	
		//
		//	Shred
		//
		//
		Allowed_Wallets_02::shred (producer_01_consenter);
		assert! (Allowed_Wallets_02::is_established () == utf8 (b"no"));
	}
}