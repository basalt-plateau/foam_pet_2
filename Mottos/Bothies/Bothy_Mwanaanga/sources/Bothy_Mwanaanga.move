






module ride::Bothy_Mwanaanga {
	// use std::vector;
	use std::string::{ Self, String, utf8 };
	// use std::signer;
	// use std::debug;
	
	use ride::Loft;
	
	use ride::Quarry_64;
	
	use ride::Bothy_Thermoplastic;
	

	// const Novelist : address = @0x99caba6e28919a1ef5ada895a9e0b1093159f823c523eaf5eddf5cfdc3293e2f;

	#[view]
	public fun togetherness () : String {
		let togetherness = Loft::togetherness ();
		togetherness
	}
	
	struct Mwanaanga has key, drop, store {
        address: address,
		thermoplastic: Bothy_Thermoplastic::Thermoplastic
    }
	
	
	public fun accept_mwanaanga (
		address_1 : address
	) : Mwanaanga {
		let thermoplastic : Bothy_Thermoplastic::Thermoplastic = Bothy_Thermoplastic::polymerize_a_thermoplastic_dome ();
		
		Mwanaanga {
			address: address_1,
			thermoplastic
		}
	}
	
	public fun ask_for_address (
		mwanaanga_1 : & Mwanaanga
	) : address {
		mwanaanga_1.address	
	}
	
	
	//
	//	? thermoplastic_sheets
	//
	//
	public fun ask_for_thermoplastic_sheets_count (
		mwanaanga_1 : & Mwanaanga
	) : u64 {
		let sheets : u64 = Bothy_Thermoplastic::ask_sheets_count (
			& mwanaanga_1.thermoplastic
		);
		sheets
	}
	
	//
	//	+ thermoplastic_sheets
	//
	//
	public fun ask_to_add_thermoplastic_sheets (
		mwanaanga_1 : &mut Mwanaanga,
		to_add: u64
	) : u64 {	
		Bothy_Thermoplastic::ask_to_add_thermoplastic_sheets (
			&mut mwanaanga_1.thermoplastic,
			to_add
		);
		
		let sheets : u64 = Bothy_Thermoplastic::ask_sheets_count (
			& mwanaanga_1.thermoplastic
		);
		
		sheets
	}
	
	
	//
	//	thermoplastic sheets logistics:
	//		from_mwanaanga -> to_mwanaanga
	//
	public fun ask_to_send_thermoplastic_sheets (
		from_mwanaanga : &mut Mwanaanga,
		to_mwanaanga : &mut Mwanaanga,
		to_add : u64
	) : String {	
		//
		//	Check if from_mwanaanga has enough.
		//
		//
		from_mwanaanga_tp_sheets_count = Bothy_Thermoplastic::ask_sheets_count (& from_mwanaanga);
		if (from_mwanaanga_tp_sheets_count < to_add) {
			utf8 ("Origin does not have enough thermoplastic sheets for that send.")
		}
		
		
		//
		//	Check if to_mwanaanga has capacity.
		//
		//
		to_mwanaanga_tp_sheets_count = Bothy_Thermoplastic::ask_sheets_count (& from_mwanaanga);
		let to_mwanaanga_has_capacity : String = Quarry_u64::can_increase (to_add, to_mwanaanga_tp_sheets_count);
		if (to_mwanaanga_has_capacity != utf8 (b"yes"))) {
			utf8 ("Origin does not have enough thermoplastic sheets for that send.")
		}
		
		
		
	}
	
	
	
	//
	//
	//	Vintage
	//
	//	
	public fun ask_for_measure_of_thermoplastic_sheets (
		mwanaanga_1 : & Mwanaanga
	) : u64 {
		let sheets : u64 = Bothy_Thermoplastic::ask_sheets_count (
			& mwanaanga_1.thermoplastic
		);
		sheets
	}
	
	
}