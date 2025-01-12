





module ride::Rhythm_01_Planet_3_Steady_1 {
	

	/*
		
	*/
	#[test (aptos_framework_account = @0x1)]
	public fun steady_ask_for_microseconds (
		aptos_framework_account: & signer,
	) {
		use std::debug;
		use std::string_utils;
		
		use aptos_framework::timestamp;
		use aptos_framework::genesis;
		
		use ride::Rhythm_01_Planet_3;
		
		//
		//
		//	
		//
		//
		timestamp::set_time_has_started_for_testing (aptos_framework_account);
		let one_synodic_rotation = 86400000000;
				
		let microsends : u64 = 10000; 
		timestamp::update_global_time_for_test (microsends);

		let microseconds : u64 = Rhythm_01_Planet_3::Epoch_IX_microseconds ();
		if (Rhythm_01_Planet_3::Epoch_IX_microseconds () != microsends) { 
			abort 1 
		};
		
		let microsends_next : u64 = Rhythm_01_Planet_3::Epoch_IX_microseconds_after_synodic_rotations (1);
		debug::print (& string_utils::format1 (& b"microsends_next: {}", microsends_next));
		if (microsends_next != 86400010000) { 
			abort 1 
		};
		
		
		
		
		// debug::print (& string_utils::format1 (& b"microsends: {}", microseconds))
		
		
    }
}

