







module ride::Steady_Bothy_Mwanaanga_1 {
	
	use std::debug;
	use std::signer;
	use std::string::{ String, utf8 };
	use std::vector;
	
	use aptos_framework::block;

	use ride::Bothy_Mwanaanga;
	use ride::Bothy_Mwanaanga::{ accept_mwanaanga };
	use ride::Bothy_Mwanaanga::Mwanaanga;

	const Problem : u64 = 0;
	
	
	
	#[test(estate_1_signer = @ride, estate_2_signer = @ride_2)]
    public fun novel_1 (
		estate_1_signer : signer,
		estate_2_signer : signer		
	) {	
		let estate_1_legacy_address = signer::address_of (& estate_1_signer);
		let estate_2_legacy_address = signer::address_of (& estate_2_signer);
		
		let mwanaanga_1 : Mwanaanga = accept_mwanaanga (estate_1_legacy_address);
		let mwanaanga_2 : Mwanaanga = accept_mwanaanga (estate_2_legacy_address);
		
		//
		//	check mwanaanga_1
		//		* address
		//		* thermoplastic_sheets_count
		//
		let mwanaanga_1_address : address = Bothy_Mwanaanga::ask_for_address (& mwanaanga_1);
		assert! (mwanaanga_1_address == estate_1_legacy_address, Problem);
		let mwanaanga_1_thermoplastic_sheets_count = Bothy_Mwanaanga::ask_for_thermoplastic_sheets_count (& mwanaanga_1);
		assert! (mwanaanga_1_thermoplastic_sheets_count == 0, Problem);
		
		//
		//	give sheets to mwanaanga_1
		//
		//
		let add_sheets : u64 = 900000;
		let mwanaanga_1_thermoplastic_sheets_count_2 : u64 = Bothy_Mwanaanga::ask_to_add_thermoplastic_sheets (
			&mut mwanaanga_1, 
			add_sheets
		);
		assert! (mwanaanga_1_thermoplastic_sheets_count_2 == add_sheets, Problem);
		assert! (Bothy_Mwanaanga::ask_for_thermoplastic_sheets_count (& mwanaanga_1) == add_sheets, Problem);
		
		//
		//	throw sheets from mwanaanga_1 to mwanaanga_2
		//
		//
		
		
	}
}