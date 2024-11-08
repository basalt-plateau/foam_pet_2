

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
	
	use std::vector;
	use std::string::{ Self, String, utf8 };
	use std::string_utils;	
	use std::signer;
	use std::debug;
	
	use ride::Loft;

	use ride::Rondoval_Vitrine;
	use ride::Rondoval_Thermoplastic;
	use ride::Rondoval_Geimfara;	
	use ride::Rondoval_Geimfara::{ Geimfara };	

	use ride::Rondoval_Tivaevae;
	use ride::Rondoval_Tivaevae::{ Tivaevae };

	#[view]
	public fun togetherness () : String {
		Loft::togetherness ()
	}
	

	
}