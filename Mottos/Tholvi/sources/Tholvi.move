




module ride::Tholvi {
	use std::string::{ String };
	
	use aptos_framework::block;
	use aptos_framework::chain_id;
	
	use ride::Loft;

	#[view]
	public fun togetherness () : String {
		Loft::togetherness ()
	}
	
	
	
	/*
		
		scouting
		
	*/
	#[view]
	public fun ask_board_id () : u8 {
		let board_id : u8 = chain_id::get ();
		board_id
	}
	
	//
	//
	//
	#[view]
	public fun ask_turn_u64 () : u64 {		
		let turn_u64 : u64 = block::get_current_block_height ();
		turn_u64
	}
}




