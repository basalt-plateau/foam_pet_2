


module Builder_01::Vow_Parts_Rhythm {

	/*
		IX = January 1, 1970

		1 Planet 3 Orbit = 31557600000

		2000 is around 31557600000 * 30 = 946728000000
	*/
	/*	
		use Builder_01::Vow_Parts_Rhythm;
		Vow_Parts_Rhythm::Embark_Clock (& aptos_framework_acceptor, 946728000000);
	*/
	#[test_only]
	public fun Embark_Clock (
		aptos_framework_acceptor : & signer,
		ms_IX : u64
	) {
		use aptos_framework::timestamp;
		timestamp::set_time_has_started_for_testing (aptos_framework_acceptor);
		
		// let begin_ms : u64 = 31557600000 * 30;
		// let now = timestamp::now_microseconds ();
		
		timestamp::update_global_time_for_test (ms_IX);
	}
}