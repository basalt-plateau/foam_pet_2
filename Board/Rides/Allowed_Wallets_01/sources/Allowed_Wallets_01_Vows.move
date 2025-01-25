


module Publisher_01::Allowed_Wallets_01_Vows {
	
	use std::signer;
	use std::vector;
	use std::string::{ utf8, String };
	
	use Publisher_01::Allowed_Wallets_01;
	
	#[view] public fun Volitions () : String { use Publisher_01::Rules_10; Rules_10::Volitions_01 () }
	
	#[test (producer_01_consenter = @Producer_01)]
	public fun steady (
		producer_01_consenter : signer
	) {	
		//
		//	Establish the allowed wallets: 4 Wallets
		//		
		//		
		let allowed_wallets_01 = vector::empty<String>();
		vector::push_back (&mut allowed_wallets_01, utf8 (b"Petra"));
		vector::push_back (&mut allowed_wallets_01, utf8 (b"Rise"));
		vector::push_back (&mut allowed_wallets_01, utf8 (b"Pontem"));
		vector::push_back (&mut allowed_wallets_01, utf8 (b"Mech"));
		
		Allowed_Wallets_01::establish (& producer_01_consenter, allowed_wallets_01);
		
		let consenter_address = signer::address_of (& producer_01_consenter);
		
		let allowed_wallets_02 = Allowed_Wallets_01::retrieve (consenter_address);
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
		Allowed_Wallets_01::change (& producer_01_consenter, allowed_wallets_03);
		
		
		let allowed_wallets_04 = Allowed_Wallets_01::retrieve (consenter_address);
		assert! (vector::borrow (& allowed_wallets_04, 0) == & utf8 (b"Petra"), 1);
		assert! (vector::borrow (& allowed_wallets_04, 1) == & utf8 (b"Rise"), 1);
		assert! (vector::borrow (& allowed_wallets_04, 2) == & utf8 (b"Pontem"), 1);
		assert! (vector::length (& allowed_wallets_04) == 3);
	}
}