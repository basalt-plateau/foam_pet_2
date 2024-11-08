



module ride::Bothy_Mtembezi_Health_1 {
	
	use std::debug;
	use std::signer;
	use std::string::{ String, utf8 };
	
	use ride::Bothy_Mtembezi;
	use ride::Bothy_Mtembezi::{ accept_mtembezi, Mtembezi };
	
	const Problem : u64 = 0;
	
    public fun novel_1 (
		estate_1_signer : signer,
		estate_2_signer : signer		
	) {			
		let estate_1_legacy_address = signer::address_of (& estate_1_signer);
		let estate_2_legacy_address = signer::address_of (& estate_2_signer);
		
		let mtembezi_1 : Mtembezi = accept_mtembezi (estate_1_legacy_address);
		let mtembezi_2 : Mtembezi = accept_mtembezi (estate_2_legacy_address);
		
		//
		//	check mtembezi_1
		//		* address
		//		* thermoplastic_sheets_count
		//
		let mtembezi_1_address : address = Bothy_Mtembezi::ask_for_address (& mtembezi_1);
		assert! (mtembezi_1_address == estate_1_legacy_address, Problem);
		let mtembezi_1_thermoplastic_sheets_count = Bothy_Mtembezi::ask_for_thermoplastic_sheets_count (& mtembezi_1);
		assert! (mtembezi_1_thermoplastic_sheets_count == 0, Problem);
		
		
		//
		//	give sheets to mtembezi_1
		//
		//
		let add_sheets_1 : u64 = 1;
		let mtembezi_1_thermoplastic_sheets_count_1 : u64 = Bothy_Mtembezi::ask_to_add_thermoplastic_sheets (
			&mut mtembezi_1, 
			add_sheets_1
		);
		debug::print (& mtembezi_1_thermoplastic_sheets_count_1);
		assert! (mtembezi_1_thermoplastic_sheets_count_1 == add_sheets_1, Problem);
		debug::print (& Bothy_Mtembezi::ask_for_thermoplastic_sheets_count (& mtembezi_1));
		assert! (Bothy_Mtembezi::ask_for_thermoplastic_sheets_count (& mtembezi_1) == add_sheets_1, Problem);
		
		
		//
		//	give sheets to mtembezi_2
		//
		//
		let add_sheets_2 : u64 = 18_446_744_073_709_551_615;
		let mtembezi_2_thermoplastic_sheets_count_1 : u64 = Bothy_Mtembezi::ask_to_add_thermoplastic_sheets (
			&mut mtembezi_2, 
			add_sheets_2
		);
		debug::print (& mtembezi_2_thermoplastic_sheets_count_1);
		assert! (mtembezi_2_thermoplastic_sheets_count_1 == add_sheets_2, Problem);
		debug::print (& Bothy_Mtembezi::ask_for_thermoplastic_sheets_count (& mtembezi_2));
		assert! (Bothy_Mtembezi::ask_for_thermoplastic_sheets_count (& mtembezi_2) == add_sheets_2, Problem);
		

		//
		//
		//	attempt send thermoplastic sheets from mtembezi_1 to mtembezi_2
		//
		//
		let to_send_1 : u64 = 10;
		let receipt_1 : String = Bothy_Mtembezi::ask_to_send_thermoplastic_sheets (
			&mut mtembezi_1, 
			&mut mtembezi_2,
			to_send_1
		);
		debug::print (& receipt_1);
		assert! (receipt_1 == utf8 (b"Mtumaji does not have enough thermoplastic sheets for that ask."), Problem);
	
		
		//
		//
		//	attempt send thermoplastic sheets from mtembezi_1 to mtembezi_2
		//
		//
		let to_send_2 : u64 = 1;
		let receipt_2 : String = Bothy_Mtembezi::ask_to_send_thermoplastic_sheets (
			&mut mtembezi_1, 
			&mut mtembezi_2,
			to_send_2
		);
		debug::print (& receipt_2);
		assert! (receipt_2 == utf8 (b"Mpokeaji does not have room for those additional thermoplastic sheets."), Problem);
		
		
		//
		//
		//	actually send thermoplastic sheets from mtembezi_2 to mtembezi_1
		//
		//
		let to_send_3 : u64 = 1;
		let receipt_3 : String = Bothy_Mtembezi::ask_to_send_thermoplastic_sheets (
			&mut mtembezi_2, 
			&mut mtembezi_1,
			to_send_3
		);
		debug::print (& receipt_3);
		assert! (receipt_3 == utf8 (b"The thermoplastic sheets were sent."), Problem);
	}
	
}