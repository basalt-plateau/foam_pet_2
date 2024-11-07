


/*
	
	use ride::Quarry_u64;

*/

module ride::Quarry_u64 {
	
	use std::debug;
	use std::string::{ String, utf8 };
	
	use ride::Loft;
	// use ride::Quarry_u8;


	#[view]
	public fun togetherness () : String {
		Loft::togetherness ()
	}
	
	
	const U64_UPPER_LIMIT : u64 = 18_446_744_073_709_551_615;
	const U64_LOWER_LIMIT : u64 = 0;
	
	const AFTER_U64_UPPER_LIMIT : u64 = 9001;
	const AFTER_U64_LOWER_LIMIT : u64 = 9002;
	
	public fun ask_u64_upper_limit () : u64 {
		U64_UPPER_LIMIT
	}
	
	public fun ask_u64_lower_limit () : u64 {
		U64_LOWER_LIMIT
	}
	

	
	
	
	
	/*
		perhaps:
	
			let proceeds : String = Quarry_u64::can_increase (10, 20);
			if (proceeds != utf8 (b"yes")) {
				abort
			};
	*/
	public fun can_increase (u64_1: u64, u64_2: u64) : String {
		if (u64_1 > (U64_UPPER_LIMIT - u64_2)) {
			return utf8 (b"no")
		};
		
		utf8 (b"yes")
	}
	
	
	
	
	/*
		increase:
			Quarry_u64::increase ();
		
			fomula:
				u64_1 + u64_2
		
			hint:
				let u64_1 : u64 = 1;
				let u64_2 : u64 = 1;
				let u64_proceeds : u64 = Quarry_u64::increase (u64_1, u64_2)
	*/
	public fun increase (u64_1: u64, u64_2: u64) : u64 {
		//
		//	UL: 10
		//	u64_1: 9 
		//	u64_2: 2
		//	
		//	if (9 > 10 - 2) {}
		//
		if (u64_1 > (U64_UPPER_LIMIT - u64_2)) {
			abort AFTER_U64_UPPER_LIMIT
		};
		
		u64_1 + u64_2
	}
	
	
	
	/*
		decrease:
			formula:
				u64_1 - u64_2
			
			hint:
				let u64_1 : u64 = 1;
				let u64_2 : u64 = 1;
				let u64_proceeds : u64 = Quarry_u64::decrease (u64_1, u64_2)
	*/
	public fun decrease (u64_1: u64, u64_2: u64) : u64 {
		if (u64_2 > u64_1) {
			abort AFTER_U64_LOWER_LIMIT
		};
		
		u64_2 - u64_1
	}
	
	
	
	
	
	/*
	
		unfinished
		
	*/
	public fun create_string_from_u64 (f64_1 : u64) : String {
		debug::print (& f64_1);
		utf8 (b"A string could not be created.")
	}
}