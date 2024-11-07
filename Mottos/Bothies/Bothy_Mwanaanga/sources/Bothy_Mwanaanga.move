






module ride::Bothy_Mwanaanga {
	
	
	// use std::vector;
	use std::string::{ Self, String, utf8 };
	use std::debug;
	// use std::signer;
	
	use ride::Loft;
	
	use ride::Quarry_u64;
	
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
	
	//
	//	+ Mwanaanga
	//
	//
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
	//
	//		mpokeaji -> mpokeaji
	//
	public fun ask_to_send_thermoplastic_sheets (
		mtumaji : &mut Mwanaanga,
		mpokeaji : &mut Mwanaanga,
		to_add : u64
	) : String {	
		
		//
		//	Check 1: Check if mtumaji has enough.
		//
		//		yes if: to_add > mtumaji.thermoplastic
		//
		//
		let mtumaji_sheets_count : u64 = Bothy_Thermoplastic::ask_sheets_count (& mtumaji.thermoplastic);
		if (mtumaji_sheets_count < to_add) {
			return utf8 (b"Mtumaji does not have enough thermoplastic sheets for that ask.")
		};
		
		
		//
		//	Check 2: Check if mpokeaji has room.
		//		
		//		yes if: mpokeaji.thermoplastic + to_add > u64_limit
		//
		let mpokeaji_sheets_count : u64 = Bothy_Thermoplastic::ask_sheets_count (& mpokeaji.thermoplastic);
		let mpokeaji_has_capacity : String = Quarry_u64::can_increase (to_add, mpokeaji_sheets_count);
		if (mpokeaji_has_capacity != utf8 (b"yes")) {
			return utf8 (b"Mpokeaji does not have room for those additional thermoplastic sheets.")
		};
		
		
		//
		//
		//
		//
		Bothy_Thermoplastic::ask_to_differentiate_thermoplastic_sheets_count (
			&mut mtumaji.thermoplastic,
			mtumaji_sheets_count - to_add
		);
		Bothy_Thermoplastic::ask_to_differentiate_thermoplastic_sheets_count (
			&mut mpokeaji.thermoplastic,
			mpokeaji_sheets_count + to_add
		);
		
		utf8 (b"The thermoplastic sheets were sent.")
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