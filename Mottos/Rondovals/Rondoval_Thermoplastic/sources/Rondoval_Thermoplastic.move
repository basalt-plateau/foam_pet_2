

/*
	Thermoplastic

		T1: Thermoplastic:
			sheets count
		
		T2: polymerize_a_thermoplastic_dome

		T3: ask_to_differentiate_thermoplastic_sheets_count
*/
module ride::Rondoval_Thermoplastic {
	
	use std::string::{ String, utf8 };
	
	use ride::Loft;
	use ride::Quarry_u64;
	

	#[view]
	public fun togetherness () : String {
		let togetherness = Loft::togetherness ();
		togetherness
	}

	struct Thermoplastic has store, drop {
        sheets: u64
    }
	
	public fun T1 (thermoplastic_1 : & Thermoplastic) : u64 {
		thermoplastic_1.sheets
    }
	
	public fun T2 () : Thermoplastic {
        Thermoplastic { sheets: 0 }
    }
	
	
	public fun T3 (thermoplastic_1 : &mut Thermoplastic, sheets_count : u64) : u64 {
		thermoplastic_1.sheets = sheets_count;
		thermoplastic_1.sheets
    }
	
	
	public fun ask_to_add_thermoplastic_sheets (
		thermoplastic_1 : &mut Thermoplastic,
		to_add : u64
	) {
		let thermoplastic_1_sheets : u64 = thermoplastic_1.sheets;
		
		let proceeds : String = Quarry_u64::can_increase (thermoplastic_1_sheets, to_add);
		if (proceeds != utf8 (b"yes")) {
			abort 478932
		};
		
		thermoplastic_1.sheets = thermoplastic_1_sheets + to_add;
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







