










module ride::Rondoval_Tivaevae_Health_1 {
	
	#[test (
		estate_1_signer = @ride, 
		estate_2_signer = @ride_2
	)]
    public fun novel_1 (
		estate_1_signer : signer,
		estate_2_signer : signer		
	) {	
		use std::string::{ utf8 };
		// use std::string_utils;
		use std::signer;
		// use std::debug;
		
		use ride::Rondoval_Tivaevae;

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

		
		assert! (Rondoval_Tivaevae::F (tivaevae_address, geimfara_1_address) == 900000, 1);
		
		
		
		
		
		
	}
}