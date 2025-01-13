


module ride::Rhythm_01_Planet_3_Scroll_01 {
	
	use std::string::{ String };
	use ride::Rules_09;
	
	#[view]
	public fun Volitions () : String {
		Rules_09::Volitions_01 ()
	}
	
	#[view]
	public fun Epoch_IX_ms_after_years (years : u64) : u64 {	
		// 1000 * 60 * 60 * 24 * 365.25
		let year : u64 = 31557600000;
		year * years
	}
}