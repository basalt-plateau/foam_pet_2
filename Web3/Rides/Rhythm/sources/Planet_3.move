


module ride::Rhythm_Planet_3 {
	
	use std::string::{ String, utf8 };
	
	use aptos_framework::timestamp;
	
	use ride::Loft;
	use ride::Quarry_u64;

	#[view]
	public fun togetherness () : String {
		Loft::togetherness ()
	}
	
	
	
	/*
		Epoch IX:
			Rhythm_Planet_3::Epoch_IX_microseconds ()
	*/
	#[view]
	public fun Epoch_IX_microseconds () : u64 {		
		timestamp::now_microseconds ()
	}
	
	
	/*
		Epoch IX:
			Rhythm_Planet_3::Epoch_IX_microseconds_after_synodic_rotations (1)
			
		Notes:
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
	public fun Epoch_IX_microseconds_after_synodic_rotations (
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
	

	
	
}