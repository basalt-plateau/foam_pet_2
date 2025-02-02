







module ride::Quarry_u64_Steady {

	const Problem : u64 = 0;
	
	#[test]
	#[expected_failure (abort_code = 9001)]
    public fun steady_1 () {
		use ride::Quarry_u64;
		
		let u64_upper_limit : u64 = 18_446_744_073_709_551_615;
		let u64_addend : u64 = 1;
		Quarry_u64::increase (u64_upper_limit, u64_addend);
    }
	

	
	#[test]
    public fun steady_2 () {
		use ride::Quarry_u64;

		let u64_1 : u64 = 18_446_744_073_709_551_614;
		let u64_2 : u64 = 1;

		let u64_proceeds : u64 = Quarry_u64::increase (u64_1, u64_2);
		assert! (u64_proceeds == 18_446_744_073_709_551_615, Problem);
    }
	
	
	//
	//	Can Increase
	//
	//
	#[test]
    public fun steady_can_increase_1 () {
		use std::string::{ String, utf8 };
		use ride::Quarry_u64;
		
		let u64_upper_limit : u64 = 18_446_744_073_709_551_615;
		let u64_addend : u64 = 1;
		let proceeds : String = Quarry_u64::can_increase (u64_upper_limit, u64_addend);
		assert! (proceeds == utf8 (b"no"), Problem);
    }
	
	#[test]
    public fun steady_can_increase_2 () {
		use std::string::{ String, utf8 };
		use ride::Quarry_u64;
		
		let u64_upper_limit : u64 = 18_446_744_073_709_551_614;
		let u64_addend : u64 = 1;
		let proceeds : String = Quarry_u64::can_increase (u64_upper_limit, u64_addend);
		assert! (proceeds == utf8 (b"yes"), Problem);
    }
	
	
	/*
	//
	//	create_string_from_u64
	//
	//
	#[test]
    public fun create_string_from_u64_0 () {
		use std::string::{ String, utf8 };
		use ride::Quarry_u64;
		
		let u64_1 : u64 = 0;
		let proceeds : String = Quarry_u64::create_string_from_u64 (u64_1);
		assert! (
			proceeds == utf8 (b"0"), 
			Problem
		);
    }
	
	
	
	#[test]
    public fun create_string_from_u64_1 () {
		use std::debug;
		use ride::Quarry_u64;
		
		let u64_1 : u64 = 0x1;
		let proceeds : String = Quarry_u64::create_string_from_u64 (u64_1);
		
		debug::print (& proceeds);
		
		assert! (
			proceeds == string::utf8 (b"1"), 
			Problem
		);
    }
	*/
}