





module Builder_01::Ruler_Hull__can_play_and_pause {
	#[view] public fun Volitions () : std::string::String { 
		Builder_01::Rules_Module::Volitions_01 () 
	}
	
	#[test] public fun Vow () {	
		use std::string::{ utf8 };
		
		use aptos_framework::coin;
		use aptos_framework::aptos_coin::AptosCoin;
		use aptos_framework::account;		
		
		use Builder_01::Module_Ruler_Hulls;
		use Builder_01::Module_Ruler_Hull;		
		use Builder_01::Module_Denizen_Texts;
		use Builder_01::Module_Guest_Hulls;
		use Builder_01::Module_Guest_Hull;
		use Builder_01::Module_Guest_Texts;
	
		let one_apt : u64 = 100000000; 
		let octas_to_mint : u64 = one_apt * 10000000000;

		let aptos_framework_acceptance : signer = account::create_account_for_test (@0x1);
		
		let ruler_01_consenter : & signer = & account::create_account_for_test (@Ruler_01);
		
		let texter_01_consenter : & signer = & account::create_account_for_test (@0x100000);
		let texter_02_consenter : & signer = & account::create_account_for_test (@0x100001);

		
		let venue = Builder_01::Vow_Parts_Embark::Produce (
			& aptos_framework_acceptance, 
			octas_to_mint,
			ruler_01_consenter
		);
		
		
		let (texter_01_address, _texter_01_acceptance) = Builder_01::Nurture__Milieu::Embark (@0x100000);
		let (texter_02_address, _texter_02_acceptance) = Builder_01::Nurture__Milieu::Embark (@0x100001);
		coin::transfer<AptosCoin>(ruler_01_consenter, texter_01_address, one_apt * 10);
		coin::transfer<AptosCoin>(ruler_01_consenter, texter_02_address, one_apt * 10);

		
		////
		//
		//	Hull Begin
		//
		//
		assert! (Module_Guest_Hulls::are_built () == utf8 (b"no"), 1);
		Module_Ruler_Hulls::Begin (ruler_01_consenter);
		assert! (Module_Guest_Hulls::are_built () == utf8 (b"yup"), 1);
		//
		////
		
		
		////
		//
		//	Send Text
		//
		//
		Module_Denizen_Texts::Send_Text (texter_01_consenter, utf8 (b"This is a text."), utf8 (b""), utf8 (b"I accept."));
		Module_Guest_Hull::Ensure_Count_of_Texts (utf8 (b""), 1);
		Module_Guest_Texts::Ensure_Text_Exists_at_Vector_Index (
			utf8 (b""), 
			0,
			texter_01_address, 
			utf8 (b"This is a text.")
		);
		//
		////

		Module_Ruler_Hull::Pause (ruler_01_consenter, utf8 (b""));
		Module_Ruler_Hull::Play (ruler_01_consenter, utf8 (b""));

		Module_Denizen_Texts::Send_Text (texter_02_consenter, utf8 (b"This is text 2."), utf8 (b""), utf8 (b"I accept."));	
		Module_Guest_Hull::Ensure_Count_of_Texts (utf8 (b""), 2);
		Module_Guest_Texts::Ensure_Text_Exists_at_Vector_Index (
			utf8 (b""), 
			0,
			texter_01_address, 
			utf8 (b"This is a text.")
		);
		Module_Guest_Texts::Ensure_Text_Exists_at_Vector_Index (
			utf8 (b""), 
			1,
			texter_02_address, 
			utf8 (b"This is text 2.")
		);
		
		
		
		Builder_01::Vow_Parts_Embark::Expire (& aptos_framework_acceptance, venue);
	}

	
}

