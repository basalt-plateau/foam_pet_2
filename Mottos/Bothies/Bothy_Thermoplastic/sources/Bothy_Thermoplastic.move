





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
	
	public fun ask_sheets_count (
		thermoplastic_1 : & Thermoplastic
	) : u64 {
		thermoplastic_1.sheets
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
	
	public fun ask_to_add_thermoplastic_sheets (
		thermoplastic_1 : &mut Thermoplastic,
		to_add: u64
	) {
		thermoplastic_1.sheets = thermoplastic_1.sheets + to_add;
    }

	
	//
	//	Vintage
	//
	//
	public fun ask_for_sheets_count (
		thermoplastic_1 : Thermoplastic
	) : u64 {
		thermoplastic_1.sheets
	}
}







