









module Builder_01::Hulls_Paused__while_paused_cannot_text {
	use std::string::{ String };
	
	#[view] public fun Volitions () : String { 
		use Builder_01::Rules_Module;
		Rules_Module::Volitions_01 () 
	}
	
	#[test]
	#[expected_failure (abort_code = 0x706175736564, location = Builder_01::Module_Hulls)]
	public fun Vow () {	
		use std::string::{ utf8 };
		use std::signer;
		
		use aptos_framework::account;		
	
		use Builder_01::Module_Guest_Hulls;
	
		let aptos_framework_consenter : signer = account::create_account_for_test (@0x1);
		let ruler_01_consenter : & signer = & account::create_account_for_test (@Ruler_01);
		let texter_01_acceptor : & signer = & account::create_account_for_test (@0x100000);
	
		let one_APT : u64 = 100000000; 
		let octas_to_mint : u64 = one_APT * 100;
		
		let venue = Builder_01::Vow_Parts_Embark::Produce (
			& aptos_framework_consenter, 
			octas_to_mint,
			ruler_01_consenter
		);
		
		
		
		////
		//
		//	Hulls Begin
		//
		//
		assert! (Module_Guest_Hulls::are_built () == utf8 (b"no"), 1);
		Builder_01::Module_Ruler_Hulls::Begin (ruler_01_consenter);
		assert! (Module_Guest_Hulls::Status () == utf8 (b"playing"), 1);
		assert! (Module_Guest_Hulls::are_built () == utf8 (b"yup"), 1);
		//
		////
		
		
		Builder_01::Module_Ruler_Hulls::Pause (ruler_01_consenter);	
		assert! (Module_Guest_Hulls::Status () == utf8 (b"paused"), 1);
		
		Builder_01::Module_Denizen_Texts::Send_Text (
			texter_01_acceptor, 
			utf8 (b"This is a text."), 
			utf8 (b""), 
			utf8 (b"I accept.")
		);
		
		Builder_01::Vow_Parts_Embark::Expire (& aptos_framework_consenter, venue);
	}
}