



/*
	Is between UTC span?
*/
module Builder_01::Rhythm {
	#[view] public fun Volitions () : std::string::String { 
		use Builder_01::Rules_Module::{ Volitions_01 }; Volitions_01 ()
	}
	
	friend Builder_01::Module_Hulls;
	
	/*
		IX = January 1, 1970
	
		Seconds__twenty_four_hours: 		86400 		= 60 * 60 * 24
		Seconds__roughly_1_planet_3_orbit:	31557600	= 60 * 60 * 24 * 365.25
		Seconds__IX_roughly_2000:			946728000	= 60 * 60 * 24 * 365.25 * 30
		
		Builder_01::Rhythm::retrieve__Seconds__roughly_1_planet_3_orbit ()
	*/
	const Seconds__twenty_four_hours : u64 = 86400;
	const Seconds__roughly_1_planet_3_orbit : u64 = 31557600;
	const Seconds__IX_roughly_2000 : u64 = 946728000;
	
	public fun retrieve__Seconds__roughly_1_planet_3_orbit () : u64 {
        Seconds__roughly_1_planet_3_orbit
    }
	
	
	public fun orbits_from_now_roughly (orbits : u64) : u64 { 
		Seconds__roughly_1_planet_3_orbit * orbits
	}
	
	
	/*
		Builder_01::Rhythm::Embark_Nurture_Planet_3_Spot ();
	*/
	#[test_only] public fun Embark_Nurture_Planet_3_Spot () {
		let aptos_framework_acceptor : signer = std::account::create_account_for_test (@0x1);
		aptos_framework::timestamp::set_time_has_started_for_testing (& aptos_framework_acceptor);
	}
	
	/*
		// The spot needs to be advanced to a position after where it is now.
		
		Builder_01::Rhythm::Advance_Nurture_Planet_3_Spot (0, 0, 0, 31);
	*/
	#[test_only] public fun Advance_Nurture_Planet_3_Spot (
		seconds : u64,
		minutes : u64,
		hours : u64,
		orbits_roughly : u64			
	) {
		let now_IX_seconds = seconds + (minutes * 60) + (hours * 60 * 60) + (orbits_roughly * 60 * 60 * 24);
		aptos_framework::timestamp::update_global_time_for_test (now_IX_seconds);
	}
}