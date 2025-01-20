


module builder_1::Equality_Vow_01 {
	
	use aptos_framework::aptos_coin::AptosCoin;
	use aptos_framework::coin;
	
	use std::any::{ type_name, Any, pack };
	
	public fun equality_check (
		parameter_1 : & Any,
		parameter_2 : & Any
	) {
		use std::any::{ type_name };
		use std::debug;
		
		if (type_name (parameter_1) != type_name (parameter_2)) {
			debug::print (type_name (parameter_1));
			debug::print (type_name (parameter_2));
			abort 1;
		};
		
		if (parameter_1 != parameter_2) {
			debug::print (parameter_1);
			debug::print (parameter_2);
			abort 2;
		};
	}
	#[test] 
	public fun steady_equality_check_01 () {
		equality_check (& pack (0), & pack (0));
	}
	
	#[test] 
	#[expected_failure (abort_code = 1)]
	public fun steady_equality_check_02 () {
		use std::string::{ utf8 };
		
		equality_check (& pack (utf8 (b"")), & pack (0));
	}
	
	#[test] 
	#[expected_failure (abort_code = 2)]
	public fun steady_equality_check_03 () {
		equality_check (& pack (1), & pack (0));
	}
	
}