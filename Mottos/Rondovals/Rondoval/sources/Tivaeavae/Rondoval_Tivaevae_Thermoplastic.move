

/*
	struct Tivaevae has key, drop, store {
        is_open: String,
		geimfaras: vector<Geimfara>
    }
	
	struct Geimfara has key, drop, store {
        address: address,
		thermoplastic: Rondoval_Thermoplastic::Thermoplastic
    }

	struct Thermoplastic has key, drop, store {
        sheets: u64
    }
*/


module ride::Rondoval_Tivaevae_Thermoplastic {
	
	use std::string::{ String };
	use ride::Loft;

	#[view]
	public fun togetherness () : String {
		Loft::togetherness ()
	}
	

	
}