






module ride::Tholvi_Earth {
	use std::string::{ String };
	
	use aptos_framework::timestamp;
	
	use ride::Loft;

	#[view]
	public fun togetherness () : String {
		Loft::togetherness ()
	}
	
	

	
	#[view]
	public fun ask_for_microseconds () : u64 {		
		let microseconds : u64 = timestamp::now_microseconds ();
		microseconds
	}
	
}




