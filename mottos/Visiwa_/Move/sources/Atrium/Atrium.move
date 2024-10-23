



module ride::Atrium {
	use aptos_framework::block;
	
	


	/*
		
		scouting
		
	*/
	#[view]
	public fun ask_turn_u64 (): u64 {
		let turn_u64 = block::get_current_block_height ();
		turn_u64
	}
}


