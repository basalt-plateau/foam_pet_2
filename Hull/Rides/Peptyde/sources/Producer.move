
/*
	Producer:
		
	
	Fonctions:
		ask_if_consenter_is_producer
		ask_if_address_is_producer
		venue
*/
module builder_1::Peptyde_01_Producer {	
	
	use std::string::{ String, utf8 };
	use std::signer;
	
	use builder_1::Rules_09;
	
	#[view]
	public fun Volitions () : String {
		Rules_09::Volitions_01 ()
	}
	
	#[view]
	public fun venue () : address {
		let producer_venue : address = @0x2f75da076414103c721d195b0376c66897593b1f4e961671099a2dc9a24adcfd;
		producer_venue
	}
	public fun ask_if_consenter_is_producer (consenter : & signer) : String {
		let address_1 = signer::address_of (consenter);
		if (address_1 == venue ()) {
			return utf8 (b"yup")
		};
		
		utf8 (b"no")
	}
	public fun ask_if_address_is_producer (address_1 : address) : String {
		if (address_1 == venue ()) {
			return utf8 (b"yup")
		};
		
		utf8 (b"no")
	}
}