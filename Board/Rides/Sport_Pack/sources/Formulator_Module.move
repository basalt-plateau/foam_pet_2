


/*
	Formulator:
		
	
	Fonctions:
		position
		ask_if_consenter_is_Formulator
		ask_if_address_is_Formulator
*/
module builder_1::Formulator_Module {	
	friend builder_1::Game_Module;
	
	use std::string::{ String, utf8 };
	use std::signer;
	
	#[view] public fun Volitions () : String { 
		use ride::Rules_10;
		Rules_10::Volitions_01 () 
	}
	
	#[view]
	public (friend) fun formulator_position () : address {
		let position : address = @0x2f75da076414103c721d195b0376c66897593b1f4e961671099a2dc9a24adcfd;
		position
	}
	public (friend) fun ask_if_consenter_is_Formulator (consenter : & signer) : String {
		if (signer::address_of (consenter) == formulator_position ()) {
			return utf8 (b"yup")
		};
		
		utf8 (b"no")
	}
	public (friend) fun ask_if_address_is_Formulator (address_1 : address) : String {
		if (address_1 == formulator_position ()) {
			return utf8 (b"yup")
		};
		
		utf8 (b"no")
	}
}