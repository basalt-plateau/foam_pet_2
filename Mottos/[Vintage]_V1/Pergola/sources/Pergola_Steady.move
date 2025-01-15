

module ride::Pergola_Steady {
	
	
	use std::string::{ String };
	use std::string::utf8;
	
	
	
	#[view]
    public fun togetherness () : String {
		use ride::Loft;
		Loft::togetherness ()
    }
	
	
	public entry fun origin () {
		/*
		timestamp::set_time_has_started_for_testing (aptos_framework);
		let (burn_cap, freeze_cap, mint_cap) = coin::initialize<AptosCoin>(
            aptos_framework,
            string::utf8 (b"TC"),
            string::utf8 (b"TC"),
            8,
            false
        );
		*/
	}
	
}