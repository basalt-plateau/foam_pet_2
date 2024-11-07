







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
	const U64_upper_limit : u64 = 18_446_744_073_709_551_615;
	
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
		let add_sheets_1 : u64 = 1;
		let mwanaanga_1_thermoplastic_sheets_count_1 : u64 = Bothy_Mwanaanga::ask_to_add_thermoplastic_sheets (
			&mut mwanaanga_1, 
			add_sheets_1
		);
		debug::print (& mwanaanga_1_thermoplastic_sheets_count_1);
		assert! (mwanaanga_1_thermoplastic_sheets_count_1 == add_sheets_1, Problem);
		debug::print (& Bothy_Mwanaanga::ask_for_thermoplastic_sheets_count (& mwanaanga_1));
		assert! (Bothy_Mwanaanga::ask_for_thermoplastic_sheets_count (& mwanaanga_1) == add_sheets_1, Problem);
		
		
		//
		//	give sheets to mwanaanga_2
		//
		//
		let add_sheets_2 : u64 = 18_446_744_073_709_551_615;
		let mwanaanga_2_thermoplastic_sheets_count_1 : u64 = Bothy_Mwanaanga::ask_to_add_thermoplastic_sheets (
			&mut mwanaanga_2, 
			add_sheets_2
		);
		debug::print (& mwanaanga_2_thermoplastic_sheets_count_1);
		assert! (mwanaanga_2_thermoplastic_sheets_count_1 == add_sheets_2, Problem);
		debug::print (& Bothy_Mwanaanga::ask_for_thermoplastic_sheets_count (& mwanaanga_2));
		assert! (Bothy_Mwanaanga::ask_for_thermoplastic_sheets_count (& mwanaanga_2) == add_sheets_2, Problem);
		

		//
		//
		//	attempt send thermoplastic sheets from mwanaanga_1 to mwanaanga_2
		//
		//
		let to_send_1 : u64 = 10;
		let receipt_1 : String = Bothy_Mwanaanga::ask_to_send_thermoplastic_sheets (
			&mut mwanaanga_1, 
			&mut mwanaanga_2,
			to_send_1
		);
		debug::print (& receipt_1);
		assert! (receipt_1 == utf8 (b"Mtumaji does not have enough thermoplastic sheets for that ask."), Problem);
	
		
		//
		//
		//	attempt send thermoplastic sheets from mwanaanga_1 to mwanaanga_2
		//
		//
		let to_send_2 : u64 = 1;
		let receipt_2 : String = Bothy_Mwanaanga::ask_to_send_thermoplastic_sheets (
			&mut mwanaanga_1, 
			&mut mwanaanga_2,
			to_send_2
		);
		debug::print (& receipt_2);
		assert! (receipt_2 == utf8 (b"Mpokeaji does not have room for those additional thermoplastic sheets."), Problem);
		
		
		//
		//
		//	actually send thermoplastic sheets from mwanaanga_2 to mwanaanga_1
		//
		//
		let to_send_3 : u64 = 1;
		let receipt_3 : String = Bothy_Mwanaanga::ask_to_send_thermoplastic_sheets (
			&mut mwanaanga_2, 
			&mut mwanaanga_1,
			to_send_3
		);
		debug::print (& receipt_3);
		assert! (receipt_3 == utf8 (b"The thermoplastic sheets were sent."), Problem);
		
	}
}