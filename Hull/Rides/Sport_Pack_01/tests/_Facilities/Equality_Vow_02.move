


module builder_1::Equality_Vow_02 {
	
	use aptos_framework::aptos_coin::AptosCoin;
	use aptos_framework::coin;
	
	use std::any::{ type_name, Any, pack };
	
	public fun equality_check_2<T1: drop + store, T2: drop + store> (
		parameter_1 : T1,
		parameter_2 : T2
	) {
		use std::any::{ type_name };
		use std::debug;
		
		let packed_envelope_1 = pack (parameter_1);
		let packed_envelope_2 = pack (parameter_2);
		
		if (type_name (& packed_envelope_1) != type_name (& packed_envelope_2)) {
			debug::print (type_name (& packed_envelope_1));
			debug::print (type_name (& packed_envelope_2));
			abort 1;
		};
	}
	
}