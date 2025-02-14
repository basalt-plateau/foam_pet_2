





module ride::Rhythm_01_Planet_3_Steady_1 {
	

	#[test (aptos_framework_account = @0x1)]
	public fun steady_ask_for_microseconds (
		aptos_framework_account: & signer,
	) {
		use std::debug;
		use std::string_utils;
		
		use aptos_framework::timestamp;
		use aptos_framework::genesis;
		
		use ride::Rhythm_01_Planet_3_Scroll_01;
		
				
		//
		//	Update the Clock
		//		Epoch IX = January 1, 1970
		//		2100 = around 55 * 60 * 60 * 24 * 365 * 1000 
		//
		let year_ms : u64 = 31557600000;
		timestamp::set_time_has_started_for_testing (aptos_framework_account);
		timestamp::update_global_time_for_test (year_ms * 130);
		
		let ending = Rhythm_01_Planet_3_Scroll_01::Epoch_IX_ms_after_years (280);
		debug::print (& string_utils::format1 (& b"Ending Microseconds: {}", ending));
		
		if (ending != 8836128000000) { abort 1 };
    }
}

