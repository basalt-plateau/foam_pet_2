


/*
	Boar_Producer:
		
	
	Fonctions:
		position
		ask_if_consenter_is_Boar_Producer
		ask_if_address_is_Boar_Producer
*/
module builder_1::Boar_Producer_Module {	
	friend builder_1::Boar_Game_Module;
	
	use std::string::{ String, utf8 };
	use std::signer;
	
	#[view] public fun Volitions () : String { 
		use ride::Rules_10;
		Rules_10::Volitions_01 () 
	}
	
	#[view]
	public (friend) fun boar_Producer_position () : address {
		let position : address = @0x2f75da076414103c721d195b0376c66897593b1f4e961671099a2dc9a24adcfd;
		position
	}
	public (friend) fun ask_if_consenter_is_Boar_Producer (consenter : & signer) : String {
		if (signer::address_of (consenter) == boar_Producer_position ()) {
			return utf8 (b"yup")
		};
		
		utf8 (b"no")
	}
	public (friend) fun ask_if_address_is_Boar_Producer (address_1 : address) : String {
		if (address_1 == boar_Producer_position ()) {
			return utf8 (b"yup")
		};
		
		utf8 (b"no")
	}
}