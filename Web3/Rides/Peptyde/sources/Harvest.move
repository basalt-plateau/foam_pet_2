




module builder_1::Peptyde_01_Harvest {

	use std::signer;
	use std::string::{ String, utf8 };
	
	use builder_1::Rules_09;
	use builder_1::Peptyde_01_Producer;
	
	#[view]
	public fun Volitions () : String {
		Rules_09::Volitions_01 ()
	}
	
	struct Harvest has key, drop {}
	
	public entry fun establish (consenter : & signer,
		peptydes : u256
	) {
		let consenter_address = signer::address_of (consenter);
		if (Peptyde_01_Producer::ask_if_consenter_is_producer (consenter) != utf8 (b"yup")) { abort 9502 };

		let harvest_0001 = Harvest {};
		
		move_to<Harvest>(consenter, harvest_0001)
	}
}