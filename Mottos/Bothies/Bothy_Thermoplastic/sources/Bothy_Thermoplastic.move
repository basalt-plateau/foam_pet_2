





module ride::Bothy_Thermoplastic {
	use std::string::{ String };
	use std::signer;
	
	use ride::Loft;

	#[view]
	public fun togetherness () : String {
		let togetherness = Loft::togetherness ();
		togetherness
	}

	struct Thermoplastic has key, drop, store {
        sheets: u64
    }
		
	public fun polymerize_a_thermoplastic_dome () : Thermoplastic {
		let sheets : u64 = 0;
		
        Thermoplastic {
            sheets
        }
    }
	
	public fun polymerize_thermoplastics () : Thermoplastic {
		let sheets : u64 = 10000000000;
		
        Thermoplastic {
            sheets
        }
	}

	
	
}







