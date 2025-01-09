


module builder_1::Water_Balloons_1_Sport {
	
	use std::signer;
	use std::string::{ String, utf8 };
	
	use builder_1::Rules_09;
	
	use builder_1::Water_Balloons_1_Players;
	use builder_1::Water_Balloons_1_Owner;
	
	#[view]
	public fun Volitions () : String {
		Rules_09::Volitions_01 ()
	}
	
	struct Water_Balloon has key, drop {}
	struct Sport has key, drop {}
	
	
	public entry fun Begin (consenter : & signer) {
		if (Water_Balloons_1_Owner::ask_if_consenter_is_owner (consenter) != utf8 (b"yup")) { abort 9502 };
		
		//
		//	Check if the consenter is the producer.
		//
		//
		let sport = Sport {};
		move_to<Sport>(consenter, sport)
	}
	public entry fun End (consenter : & signer) {
		//
		//	Check if is after 2250
		//
		//
		
		
		
		
	}
	
	
	public entry fun Buy_5_water_balloons_for_1_APT (client : & signer) {

		
		
	}
	
	
	
}