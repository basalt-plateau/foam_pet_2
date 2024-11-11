




/*
	fonctions:
		A: ask_for_microseconds_after_duration
		
*/

module ride::Tholvi_Earth {
	use std::string::{ String, utf8 };
	
	use aptos_framework::timestamp;
	
	use ride::Loft;
	use ride::Quarry_u64;

	#[view]
	public fun togetherness () : String {
		Loft::togetherness ()
	}
	
	
	
	/*
		milliseconds in second: 1_000_000
		seconds in minute: 60
		minutes in hour: 60
		hours in solar_day: 24
		
		milliseconds in synodic_rotation_hour:
			1000000 * 60 * 60 = 3600000000
		
		milliseconds in synodic_rotation:
			1000000 * 60 * 60 * 24 = 86400000000
	*/
	#[view]
	public fun A (
		synodic_rotations : u64
	) : u64 {		
		let after = 86400000000 * synodic_rotations;
		let microseconds : u64 = timestamp::now_microseconds ();
		
		let proceeds : String = Quarry_u64::can_increase (microseconds, after);
		if (proceeds != utf8 (b"yes")) {
			abort 57283
		};
		
		microseconds + after
	}
	
	#[view]
	public fun ask_for_microseconds () : u64 {		
		let microseconds : u64 = timestamp::now_microseconds ();
		microseconds
	}
	
}




