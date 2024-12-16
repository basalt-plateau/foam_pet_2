
/*
	 _   _                      _  _       _   
	| \ | |  ___  __   __  ___ | |(_) ___ | |_ 
	|  \| | / _ \ \ \ / / / _ \| || |/ __|| __|
	| |\  || (_) | \ V / |  __/| || |\__ \| |_ 
	|_| \_| \___/   \_/   \___||_||_||___/ \__|
											   

	Fonctions:
		ask_if_signer_is_novelist
		ask_if_address_is_novelist
			if (ask_if_address_is_novelist (estate_1_spot) != utf8 (b"yeah")) { abort 9502 };
		
		ask_for_address_of_novelist
*/
module ride_1::Merci_Novelist {	
	
	
	use std::string::{ String, utf8 };
	use std::signer;

	
	#[view]
	public fun Bayanihan () : String {
		use ride_1::Merci_Bayanihan;
		Merci_Bayanihan::Bayanihan ()
	}
	
	#[view]
	public fun ask_for_address_of_novelist () : address {
		let novelist_spot : address = @0x2f75da076414103c721d195b0376c66897593b1f4e961671099a2dc9a24adcfd;
		novelist_spot
	}
	public fun ask_if_signer_is_novelist (estate_flourisher : & signer) : String {
		let estate_spot = signer::address_of (estate_flourisher);
		if (estate_spot == ask_for_address_of_novelist ()) {
			return utf8 (b"yeah")
		};
		
		utf8 (b"no")
	}
	public fun ask_if_address_is_novelist (estate_address : address) : String {
		if (estate_address == ask_for_address_of_novelist ()) {
			return utf8 (b"yeah")
		};
		
		utf8 (b"no")
	}
}