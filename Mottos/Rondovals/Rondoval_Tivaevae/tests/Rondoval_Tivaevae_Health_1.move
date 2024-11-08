










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
		use ride::Rondoval_Geimfara;

		let estate_1_address = signer::address_of (& estate_1_signer);
		let tivaevae_address = estate_1_address;
		let geimfara_1_address = estate_1_address;
		
		let estate_2_address = signer::address_of (& estate_2_signer);
		let geimfara_2_address = estate_2_address;
		

		//
		//	Novelist: Establish
		//		* Learn if the estate already has a tivaevae.
		//		* Establish a Tivaevae.
		//		* Learn if the estate has a tivaevae.
		//
		assert! (Rondoval_Tivaevae::A (estate_1_address) == utf8 (b"no"), 1);
		Rondoval_Tivaevae::B (& estate_1_signer);
		assert! (Rondoval_Tivaevae::A (estate_1_address) == utf8 (b"yep"), 1);

		
		
		//
		//
		//	Geimfara 2: Join:
		//
		//
		assert! (Rondoval_Tivaevae::H (tivaevae_address, geimfara_2_address) == utf8 (b"no"), 1);
		Rondoval_Tivaevae::E (& estate_2_signer, tivaevae_address);
		assert! (Rondoval_Tivaevae::H (tivaevae_address, geimfara_2_address) == utf8 (b"yes"), 1);
		
		
		//
		//	Thermoplastic: 100000
		//		Geimfara 1 to Geimfara 2
		//
		
		
		
	}
}