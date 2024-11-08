










module ride::Rondoval_Tivaevae_Health_1 {
	
	#[test (
		estate_1_signer = @ride, 
		estate_2_signer = @ride_2
	)]
    public fun novel_1 (
		estate_1_signer : signer,
		estate_2_signer : signer		
	) {	
		use std::string::{ String, utf8 };
		use std::string_utils;
		use std::signer;
		use std::debug;
		
		use ride::Rondoval_Tivaevae;
		use ride::Rondoval_Tivaevae::{ Tivaevae };
		use ride::Rondoval_Mtembezi;

		let estate_1_address = signer::address_of (& estate_1_signer);
		let tivaevae_address = estate_1_address;
		let mtembezi_1_address = estate_1_address;
		
		let estate_2_address = signer::address_of (& estate_2_signer);
		let mtembezi_2_address = estate_2_address;
		

		//
		//	Novelist: Establish
		//		* Learn if the estate already has a tivaevae.
		//		* Establish a Tivaevae.
		//		* Learn if the estate has a tivaevae.
		//
		assert! (Rondoval_Tivaevae::Ask_if_estate_has_a_Tivaevae (estate_1_address) == utf8 (b"no"), 1);
		Rondoval_Tivaevae::Establish_a_Tivaevae (& estate_1_signer);
		assert! (Rondoval_Tivaevae::Ask_if_estate_has_a_Tivaevae (estate_1_address) == utf8 (b"yes"), 1);

		//
		//	Novelist: Join:
		//		* Learn if the estate has a mtembezi present at the tivaevae.
		//		* Join the Tivaevae as a Mtembezi.
		//
		assert! (Rondoval_Tivaevae::is_mtembezi_at_Tivaevae (tivaevae_address, mtembezi_1_address) == utf8 (b"no"), 1);
		Rondoval_Tivaevae::Join_a_Tivaevae (& estate_1_signer, tivaevae_address);
		assert! (Rondoval_Tivaevae::is_mtembezi_at_Tivaevae (tivaevae_address, mtembezi_1_address) == utf8 (b"yes"), 1);
		
		//
		//
		//	Novelist: Give thermoplastic to Mtembezi 1
		//
		//
		Rondoval_Tivaevae::Establish_thermoplastic (mtembezi_1_address);
		Rondoval_Tivaevae::Ask_mtembezi_thermoplastic_sheet_count (mtembezi_1_address);
		
		
		//
		//
		//	Mtembezi 2: Join:
		//
		//
		debug::print (& utf8 (b"estate 2 joining"));
		debug::print (& mtembezi_1_address);				
		debug::print (& mtembezi_2_address);		
		debug::print (& Rondoval_Tivaevae::is_mtembezi_at_Tivaevae (tivaevae_address, mtembezi_2_address));
		
		assert! (Rondoval_Tivaevae::is_mtembezi_at_Tivaevae (tivaevae_address, mtembezi_2_address) == utf8 (b"no"), 1);
		Rondoval_Tivaevae::Join_a_Tivaevae (& estate_2_signer, tivaevae_address);
		assert! (Rondoval_Tivaevae::is_mtembezi_at_Tivaevae (tivaevae_address, mtembezi_2_address) == utf8 (b"yes"), 1);

		
		
	}
}