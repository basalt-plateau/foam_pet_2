











module Builder_01::Denizen_Text__can_text {
	use std::string::{ String };
	
	#[view] public fun Volitions () : std::string::String { 
		Builder_01::Rules_Module::Volitions_01 () 
	}
	
	#[test]
	public fun Vow () {	
		use std::string::{ utf8 };
		use std::signer;
		
		use Builder_01::Module_Guest_Hulls;
	
		let aptos_framework_consenter : signer = aptos_framework::account::create_account_for_test (@0x1);
		let ruler_01_consenter : & signer = & aptos_framework::account::create_account_for_test (@Ruler_01);
	
		let one_APT : u64 = 100000000; 
		let octas_to_mint : u64 = one_APT * 100;
		
		let venue = Builder_01::Vow_Parts_Embark::Produce (
			& aptos_framework_consenter, 
			octas_to_mint,
			ruler_01_consenter
		);
		
		let (milieu_01_address, milieu_01_acceptance) = Builder_01::Nurture__Milieu::Embark (@0x100000);
		aptos_framework::coin::transfer<aptos_framework::aptos_coin::AptosCoin>(ruler_01_consenter, milieu_01_address, one_APT * 10);

		Builder_01::Module_Ruler_Hulls::Begin (ruler_01_consenter);		
		Builder_01::Module_Denizen_Texts::Send_Text (
			& milieu_01_acceptance, 
			utf8 (b"This is a text."), 
			utf8 (b""), 
			utf8 (b"I accept.")
		);
		
		Builder_01::Vow_Parts_Embark::Expire (& aptos_framework_consenter, venue);
	}
}