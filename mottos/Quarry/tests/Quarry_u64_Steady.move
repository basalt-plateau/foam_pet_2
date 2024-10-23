







module ride::Quarry_u64_Steady {
	use std::string::{ Self, String };
	
	use ride::Quarry_u64;

	const PROBLEM : u64 = 0;
	
	#[test]
	#[expected_failure (abort_code = 1)]
    public fun steady_1 () {
       let u64_upper_limit : u64 = 18_446_744_073_709_551_615;
       let u64_addend : u64 = 1;
	   Quarry_u64::increase (u64_upper_limit, u64_addend);
    }
	
	
	
	
	
	#[test]
    public fun steady_2 () {
       let u64_1 : u64 = 18_446_744_073_709_551_614;
       let u64_2 : u64 = 1;
	   
	   let u64_proceeds : u64 = Quarry_u64::increase (u64_1, u64_2);
	   assert! (u64_proceeds == 18_446_744_073_709_551_615, PROBLEM);
    }
	
	
	//
	//	Can Increase
	//
	//
	#[test]
    public fun steady_can_increase_1 () {
		let u64_upper_limit : u64 = 18_446_744_073_709_551_615;
		let u64_addend : u64 = 1;
		let proceeds : String = Quarry_u64::can_increase (u64_upper_limit, u64_addend);
		assert! (
			proceeds == string::utf8 (b"yes"), 
			PROBLEM
		);
    }
}