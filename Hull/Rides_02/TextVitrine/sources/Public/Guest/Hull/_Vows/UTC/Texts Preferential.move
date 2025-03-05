




/*
	Picky, Filtered, Choosy
*/
module Builder_01::Texts_Preferential {
	
	
	#[view] public fun Volitions () : std::string::String { 
		Builder_01::Rules_Module::Volitions_01 () 
	}
	
	
	#[test] public fun Vow () {	
		use std::vector;
		use std::string::{ utf8 };
		use std::signer;

		use aptos_framework::coin;
		use aptos_framework::aptos_coin::AptosCoin;
	
		use Builder_01::Module_Guest_Hulls;
		use Builder_01::Module_Guest_Hull;	
		use Builder_01::Module_Hulls; 

		let aptos_framework_acceptance : signer = aptos_framework::account::create_account_for_test (@0x1);
		let ruler_01_acceptance : signer = aptos_framework::account::create_account_for_test (@Ruler_01);
		let ruler_address = signer::address_of (& ruler_01_acceptance);
		
		let one_APT : u64 = 100000000; 
		let octas_to_mint : u64 = one_APT * 100;
		let venue = Builder_01::Vow_Parts_Embark::Produce (
			& aptos_framework_acceptance, 
			octas_to_mint,
			& ruler_01_acceptance
		);
		
		let (texter_01_address, texter_01_acceptance) = Builder_01::Nurture__Milieu::Embark (@0x100000);
		coin::transfer<AptosCoin>(& ruler_01_acceptance, texter_01_address, one_APT * 10);
		
		let (texter_02_address, texter_02_acceptance) = Builder_01::Nurture__Milieu::Embark (@0x100001);
		coin::transfer<AptosCoin>(& ruler_01_acceptance, texter_02_address, one_APT * 10);

		let (texter_03_address, texter_03_acceptance) = Builder_01::Nurture__Milieu::Embark (@0x100002);
		coin::transfer<AptosCoin>(& ruler_01_acceptance, texter_03_address, one_APT * 10);
		
		let (texter_04_address, texter_04_acceptance) = Builder_01::Nurture__Milieu::Embark (@0x100003);
		coin::transfer<AptosCoin>(& ruler_01_acceptance, texter_04_address, one_APT * 10);
		
		////
		//
		//	Hull Begin
		//
		//
		Builder_01::Module_Ruler_Hulls::Begin (& ruler_01_acceptance);
		//
		////
		
		
		////
		//
		//	Send Texts
		//
		//
		//aptos_framework:: timestamp::update_global_time_for_test (31557600000 * 31);
		Builder_01::Module_Denizen_Texts::Send_Text (
			& texter_01_acceptance, 
			utf8 (b"This is text 000001."), 
			utf8 (b""), 
			utf8 (b"I accept.")
		);
		Builder_01::Module_Denizen_Texts::Send_Text (
			& texter_02_acceptance, 
			utf8 (b"This is text 000002."), 
			utf8 (b""), 
			utf8 (b"I accept.")
		);
		
		std::debug::print (& std::string_utils::format1 (
			& b"Hulls Count = {}", 
			Builder_01::Module_Guest_Hulls::Hulls_Count ()
		));
		std::debug::print (& std::string_utils::format1 (
			& b"Texts Count for '' = {}", 
			Builder_01::Module_Guest_Hull::Count_of_Texts (std::string::utf8 (b""))
		));
		
		assert! (Builder_01::Module_Guest_Hull::Count_of_Texts (std::string::utf8 (b"")) == 2, 1);
		
		
		aptos_framework::timestamp::update_global_time_for_test (31557600000 * 50);
		Builder_01::Module_Denizen_Texts::Send_Text (
			& texter_03_acceptance, 
			utf8 (b"This is text 000003."), 
			utf8 (b""), 
			utf8 (b"I accept.")
		);
		Builder_01::Module_Denizen_Texts::Send_Text (
			& texter_04_acceptance, 
			utf8 (b"This is text 000004."), 
			utf8 (b""), 
			utf8 (b"I accept.")
		);
		
		
		std::debug::print (& std::string_utils::format1 (
			& b"Hulls Count = {}", 
			Builder_01::Module_Guest_Hulls::Hulls_Count ()
		));
		std::debug::print (& std::string_utils::format1 (
			& b"Texts Count for '' = {}", 
			Builder_01::Module_Guest_Hull::Count_of_Texts (std::string::utf8 (b""))
		));
		
		assert! (Builder_01::Module_Guest_Hull::Count_of_Texts (std::string::utf8 (b"")) == 4, 1);
		//
		////
			
			
		////
		//
		//	Retrieve Texts 00_40
		//
		//
		let texts_00_40 = Module_Guest_Hull::Retrieve_Texts_Preferential (utf8 (b""), 31557600000 * 0, 31557600000 * 40);
		
		std::debug::print (& std::string_utils::format1 (
			& b"Texts 00 40: {}", 
			vector::length (& texts_00_40)
		));
		
		assert! (vector::length (& texts_00_40) == 2, 1);	
		assert! (
			Builder_01::Module_Text_Envelope::Text_Envelope__retrieve_text (vector::borrow (& texts_00_40, 0)) == utf8 (b"This is text 000001."), 
			1
		);
		assert! (Builder_01::Module_Text_Envelope::Text_Envelope__retrieve_text (vector::borrow (& texts_00_40, 1)) == utf8 (b"This is text 000002."), 1);
		//
		////	
			
		////
		//
		//	Retrieve Texts 40_60
		//
		//
		let texts_40_60 = Module_Guest_Hull::Retrieve_Texts_Preferential (utf8 (b""), 31557600000 * 40, 31557600000 * 60);
		assert! (vector::length (& texts_40_60) == 2, 1);	
		assert! (Builder_01::Module_Text_Envelope::Text_Envelope__retrieve_text (vector::borrow (& texts_40_60, 0)) == utf8 (b"This is text 000003."), 1);
		assert! (Builder_01::Module_Text_Envelope::Text_Envelope__retrieve_text (vector::borrow (& texts_40_60, 1)) == utf8 (b"This is text 000004."), 1);
		//
		////

		Builder_01::Vow_Parts_Embark::Expire (& aptos_framework_acceptance, venue);
	}

	
}


