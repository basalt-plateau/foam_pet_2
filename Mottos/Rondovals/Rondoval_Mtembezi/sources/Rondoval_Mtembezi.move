






module ride::Rondoval_Mtembezi {
	
	
	// use std::vector;
	use std::string::{ Self, String, utf8 };
	use std::debug;
	// use std::signer;
	
	use ride::Loft;
	
	use ride::Quarry_u64;
	
	use ride::Rondoval_Thermoplastic;
	

	// const Novelist : address = @0x99caba6e28919a1ef5ada895a9e0b1093159f823c523eaf5eddf5cfdc3293e2f;

	#[view]
	public fun togetherness () : String {
		let togetherness = Loft::togetherness ();
		togetherness
	}
	
	struct Mtembezi has key, drop, store {
        address: address,
		thermoplastic: Rondoval_Thermoplastic::Thermoplastic
    }
	
	//
	//	+ Mtembezi
	//
	//
	public fun accept_mtembezi (
		address_1 : address
	) : Mtembezi {
		let thermoplastic : Rondoval_Thermoplastic::Thermoplastic = Rondoval_Thermoplastic::polymerize_a_thermoplastic_dome ();
		
		Mtembezi {
			address: address_1,
			thermoplastic
		}
	}
	
	public fun ask_for_address (
		mtembezi_1 : & Mtembezi
	) : address {
		mtembezi_1.address	
	}
	
	
	//
	//	? thermoplastic_sheets
	//
	//
	public fun ask_for_thermoplastic_sheets_count (
		mtembezi_1 : & Mtembezi
	) : u64 {
		let sheets : u64 = Rondoval_Thermoplastic::ask_sheets_count (
			& mtembezi_1.thermoplastic
		);
		sheets
	}
	
	//
	//	+ thermoplastic_sheets
	//		Rondoval_Mtembezi::ask_to_add_thermoplastic_sheets (mtembezi_1, to_add_f64);
	//
	public fun ask_to_add_thermoplastic_sheets (
		mtembezi_1 : &mut Mtembezi,
		to_add: u64
	) : u64 {	
		Rondoval_Thermoplastic::ask_to_add_thermoplastic_sheets (
			&mut mtembezi_1.thermoplastic,
			to_add
		);
		
		let sheets : u64 = Rondoval_Thermoplastic::ask_sheets_count (
			& mtembezi_1.thermoplastic
		);
		
		sheets
	}
	
	
	//
	//	thermoplastic sheets logistics:
	//
	//		mpokeaji -> mpokeaji
	//
	public fun ask_to_send_thermoplastic_sheets (
		mtumaji : &mut Mtembezi,
		mpokeaji : &mut Mtembezi,
		to_add : u64
	) : String {	
		
		//
		//	Check 1: Check if mtumaji has enough.
		//
		//		yes if: to_add > mtumaji.thermoplastic
		//
		//
		let mtumaji_sheets_count : u64 = Rondoval_Thermoplastic::ask_sheets_count (& mtumaji.thermoplastic);
		if (mtumaji_sheets_count < to_add) {
			return utf8 (b"Mtumaji does not have enough thermoplastic sheets for that ask.")
		};
		
		
		//
		//	Check 2: Check if mpokeaji has room.
		//		
		//		yes if: mpokeaji.thermoplastic + to_add > u64_limit
		//
		let mpokeaji_sheets_count : u64 = Rondoval_Thermoplastic::ask_sheets_count (& mpokeaji.thermoplastic);
		let mpokeaji_has_capacity : String = Quarry_u64::can_increase (to_add, mpokeaji_sheets_count);
		if (mpokeaji_has_capacity != utf8 (b"yes")) {
			return utf8 (b"Mpokeaji does not have room for those additional thermoplastic sheets.")
		};
		
		
		//
		//
		//
		//
		Rondoval_Thermoplastic::ask_to_differentiate_thermoplastic_sheets_count (
			&mut mtumaji.thermoplastic,
			mtumaji_sheets_count - to_add
		);
		Rondoval_Thermoplastic::ask_to_differentiate_thermoplastic_sheets_count (
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
		mtembezi_1 : & Mtembezi
	) : u64 {
		let sheets : u64 = Rondoval_Thermoplastic::ask_sheets_count (
			& mtembezi_1.thermoplastic
		);
		sheets
	}
	
	
}