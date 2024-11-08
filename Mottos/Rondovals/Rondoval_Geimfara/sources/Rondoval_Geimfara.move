

/*
	fonctions:
		G1: add geimfara
		
		G2: Geimfara:
				ask for address
		
		G3: Thermoplastic:
				ask for sheets count
		
		G4: Thermoplastic:
				+ sheets
				
		G5: Thermoplastic Shipping
	
	
	
		G6: ask_for_measure_of_thermoplastic_sheets
*/




module ride::Rondoval_Geimfara {
	
	
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
	
	struct Geimfara has key, drop, store {
        address: address,
		thermoplastic: Rondoval_Thermoplastic::Thermoplastic
    }
	
	//
	//	+ Geimfara
	//
	//
	public fun G1 (address_1 : address) : Geimfara {
		Geimfara {
			address: address_1,
			thermoplastic: Rondoval_Thermoplastic::T2 ()
		}
	}
	
	//
	//	Geimfara: Address
	//
	//
	public fun G2 (geimfara_1 : & Geimfara) : address {
		geimfara_1.address	
	}
	
	
	//
	//	Geimfara: 
	//		Thermoplastic_sheets:
	//			count
	//
	//		let thermoplastic_sheets_count : u64 = Rondoval_Geimfara::G3 (& geimfara_1);
	//
	public fun G3 (geimfara_1 : & Geimfara) : u64 {
		Rondoval_Thermoplastic::T1 (& geimfara_1.thermoplastic)
	}
	
	
	
	//
	//	Geimfara: 
	//		+ thermoplastic_sheets
	//
	//			Rondoval_Geimfara::G4 (geimfara_1, to_add_f64);
	//
	public fun G4 (geimfara_1 : &mut Geimfara, to_add: u64) : u64 {	
		Rondoval_Thermoplastic::ask_to_add_thermoplastic_sheets (
			&mut geimfara_1.thermoplastic,
			to_add
		);
		
		Rondoval_Thermoplastic::T1 (& geimfara_1.thermoplastic)
	}
	
	
	/*
		Geimfara:
			thermoplastic sheets: logistics:
	
				mpokeaji -> mpokeaji
	*/
	public fun G5 (
		mtumaji : &mut Geimfara,
		mpokeaji : &mut Geimfara,
		to_add : u64
	) : String {	
		
		//
		//	Check 1: Check if mtumaji has enough.
		//
		//		yes if: to_add > mtumaji.thermoplastic
		//
		//
		let mtumaji_sheets_count : u64 = Rondoval_Thermoplastic::T1 (& mtumaji.thermoplastic);
		if (mtumaji_sheets_count < to_add) {
			return utf8 (b"Mtumaji does not have enough thermoplastic sheets for that ask.")
		};
		
		
		//
		//	Check 2: Check if mpokeaji has room.
		//		
		//		yes if: mpokeaji.thermoplastic + to_add > u64_limit
		//
		let mpokeaji_sheets_count : u64 = Rondoval_Thermoplastic::T1 (& mpokeaji.thermoplastic);
		let mpokeaji_has_capacity : String = Quarry_u64::can_increase (to_add, mpokeaji_sheets_count);
		if (mpokeaji_has_capacity != utf8 (b"yes")) {
			return utf8 (b"Mpokeaji does not have room for those additional thermoplastic sheets.")
		};
		
		
		//
		//
		//
		//
		Rondoval_Thermoplastic::T3 (
			&mut mtumaji.thermoplastic,
			mtumaji_sheets_count - to_add
		);
		Rondoval_Thermoplastic::T3 (
			&mut mpokeaji.thermoplastic,
			mpokeaji_sheets_count + to_add
		);
		
		utf8 (b"The thermoplastic sheets were sent.")
	}
}