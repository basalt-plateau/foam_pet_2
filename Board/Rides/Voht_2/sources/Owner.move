


/*
	Producer:
		
	
	Fonctions:
		position
		ask_if_consenter_is_owner
		ask_if_address_is_owner
*/
module builder_1::Voht_Owner {
	#[view] public fun Volitions () : String { 
		use Ride_01::Rules_10; 
		Rules_10::Volitions_01 ()
	}
	
	friend builder_1::Void_Freight_Group;
	
	use std::string::{ String, utf8 };
	use std::signer;
	
	#[view]
	public (friend) fun owner_position () : address {
		let position : address = @0x2f75da076414103c721d195b0376c66897593b1f4e961671099a2dc9a24adcfd;
		position
	}
	public (friend) fun ask_if_consenter_is_owner (consenter : & signer) : String {
		if (signer::address_of (consenter) == owner_position ()) {
			return utf8 (b"yup")
		};
		
		utf8 (b"no")
	}
	public (friend) fun ask_if_address_is_owner (address_1 : address) : String {
		if (address_1 == owner_position ()) {
			return utf8 (b"yup")
		};
		
		utf8 (b"no")
	}
}