




module ride::Pergola_Butte {
	
	use std::string::{ String };
	
	use aptos_framework::coin;
    use aptos_framework::aptos_coin;
	
	use ride::Loft;
	
	#[view]
    public fun togetherness () : String {
		let togetherness = Loft::togetherness ();
		togetherness
    }
	
	struct Butte {
		
	}
	

	
	
	
}
