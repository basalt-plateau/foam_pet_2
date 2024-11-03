


module ride::Mistponics_Steady {
	use std::signer;
	use std::string::utf8;

	use ride::Mistponics_Gazebo;
	use ride::Mistponics_Shed;
	use ride::Mistponics_Maharagwe;

	const PROBLEM : u64 = 0;
	
	#[test(
		estate_1 = @0xBC8E524371E9DABC8F9EADBC1623548E9CB614370F8CBE94352615448FBC16B9,
		estate_2 = @0xBE9DACBF8437061CBE9CBF843706152CBE9DAF8CBE9CBF84370615243F9EADBC
	)]
    public fun steady_1 (estate_1: signer) {
		let estate_1_address = signer::address_of (& estate_1);
		let u64_zero : u64 = 0;
		let u64_200700 : u64 = 200700;
		let u64_1000 : u64 = 1000;
		
		//
		//
		//	Allow Mistponics
		//
		//
		Mistponics_Gazebo::build_gazebo (& estate_1);
		Mistponics_Gazebo::allow_mistponics (& estate_1);
		let mistponics_status = Mistponics_Gazebo::mistponics_status (estate_1_address);
		// print (& mistponics_status);
		assert! (
			mistponics_status == utf8 (b"allowed"), 
			PROBLEM
		);
		
		
		//
		//	Obtain a Shed
		//
		//
		Mistponics_Shed::ask_obtain_mistponics_Sheds (& estate_1);
		assert! (
			Mistponics_Shed::has_mistponics_Sheds (estate_1_address) == utf8 (b"yes"), 
			PROBLEM
		);
		
		//
		//	Prepare the maharagwe
		//
		//
		Mistponics_Maharagwe::ask_prepare_maharagwe (& estate_1);
		assert! (
			Mistponics_Maharagwe::check_maharagwe_amount (estate_1_address) == u64_zero, 
			PROBLEM
		);
		
		Mistponics_Maharagwe::grow_maharagwe (& estate_1, 200700);
		assert! (
			Mistponics_Maharagwe::check_maharagwe_amount (estate_1_address) == u64_200700, 
			PROBLEM
		);
		
		Mistponics_Maharagwe::deplete_maharagwe (& estate_1, 199700);
		assert! (
			Mistponics_Maharagwe::check_maharagwe_amount (estate_1_address) == u64_1000, 
			PROBLEM
		);
		
		Mistponics_Maharagwe::deplete_maharagwe (& estate_1, 1000);
		assert! (
			Mistponics_Maharagwe::check_maharagwe_amount (estate_1_address) == u64_zero, 
			PROBLEM
		);
    }
	
}