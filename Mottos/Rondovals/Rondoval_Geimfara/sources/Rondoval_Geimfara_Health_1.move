



module ride::Rondoval_Geimfara_Health_1 {
	
	use std::debug;
	use std::signer;
	use std::string::{ String, utf8 };
	
	use ride::Rondoval_Geimfara;
	use ride::Rondoval_Geimfara::{ G1, Geimfara };
	
	const Problem : u64 = 0;
	
    public fun novel_1 (
		estate_1_signer : signer,
		estate_2_signer : signer		
	) {			
		let estate_1_legacy_address = signer::address_of (& estate_1_signer);
		let estate_2_legacy_address = signer::address_of (& estate_2_signer);
		
		let geimfara_1 : Geimfara = G1 (estate_1_legacy_address);
		let geimfara_2 : Geimfara = G1 (estate_2_legacy_address);
		
		//
		//	check geimfara_1
		//		* address
		//		* thermoplastic_sheets_count
		//
		let geimfara_1_address : address = Rondoval_Geimfara::G2 (& geimfara_1);
		assert! (geimfara_1_address == estate_1_legacy_address, Problem);
		let geimfara_1_thermoplastic_sheets_count = Rondoval_Geimfara::G3 (& geimfara_1);
		assert! (geimfara_1_thermoplastic_sheets_count == 0, Problem);
		
		
		//
		//	give sheets to geimfara_1
		//
		//
		let add_sheets_1 : u64 = 1;
		let geimfara_1_thermoplastic_sheets_count_1 : u64 = Rondoval_Geimfara::G4 (
			&mut geimfara_1, 
			add_sheets_1
		);
		debug::print (& geimfara_1_thermoplastic_sheets_count_1);
		assert! (geimfara_1_thermoplastic_sheets_count_1 == add_sheets_1, Problem);
		debug::print (& Rondoval_Geimfara::G3 (& geimfara_1));
		assert! (Rondoval_Geimfara::G3 (& geimfara_1) == add_sheets_1, Problem);
		
		
		//
		//	give sheets to geimfara_2
		//
		//
		let add_sheets_2 : u64 = 18_446_744_073_709_551_615;
		let geimfara_2_thermoplastic_sheets_count_1 : u64 = Rondoval_Geimfara::G4 (
			&mut geimfara_2, 
			add_sheets_2
		);
		debug::print (& geimfara_2_thermoplastic_sheets_count_1);
		assert! (geimfara_2_thermoplastic_sheets_count_1 == add_sheets_2, Problem);
		debug::print (& Rondoval_Geimfara::G3 (& geimfara_2));
		assert! (Rondoval_Geimfara::G3 (& geimfara_2) == add_sheets_2, Problem);
		

		//
		//
		//	attempt send thermoplastic sheets from geimfara_1 to geimfara_2
		//
		//
		let to_send_1 : u64 = 10;
		let receipt_1 : String = Rondoval_Geimfara::ask_to_send_thermoplastic_sheets (
			&mut geimfara_1, 
			&mut geimfara_2,
			to_send_1
		);
		debug::print (& receipt_1);
		assert! (receipt_1 == utf8 (b"Mtumaji does not have enough thermoplastic sheets for that ask."), Problem);
	
		
		//
		//
		//	attempt send thermoplastic sheets from geimfara_1 to geimfara_2
		//
		//
		let to_send_2 : u64 = 1;
		let receipt_2 : String = Rondoval_Geimfara::ask_to_send_thermoplastic_sheets (
			&mut geimfara_1, 
			&mut geimfara_2,
			to_send_2
		);
		debug::print (& receipt_2);
		assert! (receipt_2 == utf8 (b"Mpokeaji does not have room for those additional thermoplastic sheets."), Problem);
		
		
		//
		//
		//	actually send thermoplastic sheets from geimfara_2 to geimfara_1
		//
		//
		let to_send_3 : u64 = 1;
		let receipt_3 : String = Rondoval_Geimfara::ask_to_send_thermoplastic_sheets (
			&mut geimfara_2, 
			&mut geimfara_1,
			to_send_3
		);
		debug::print (& receipt_3);
		assert! (receipt_3 == utf8 (b"The thermoplastic sheets were sent."), Problem);
	}
	
}