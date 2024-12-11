





module ride::Steady_Tholvi_1 {
	
	use ride::Pergola;
	
	#[test]
    public fun steady_ask_turn_u64 () {
		use std::debug;
		use std::string::utf8;

		use aptos_framework::block;

		use ride::Tholvi;
		
		let estate_1_legacy_address : address = @0x099CABA6E28919A1EF5ADA895A9E0B1093159F823C523EAF5EDDF5CFDC3293E2F;
		let string_1 = Pergola::estate_scout (estate_1_legacy_address);
		debug::print (& string_1);
		
		
		
		
		// let turn_u64 = borrow_global<BlockResource>(@aptos_framework).height;
		// let turn_u64 = Tholvi::ask_board_id ();
		
		// let epoch_interval_secs = block::get_epoch_interval_secs ();
		// turn_u64
		
		// let turn : u64 = Tholvi::ask_turn_u64 ();
        // debug::print (& turn);
		
    }
}