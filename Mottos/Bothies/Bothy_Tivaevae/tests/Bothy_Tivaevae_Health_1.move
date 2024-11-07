










module ride::Bothy_Tivaevae_Health_1 {
	
	#[test (
		estate_1_signer = @ride, 
		estate_2_signer = @ride_2
	)]
    public fun novel_1 (
		estate_1_signer : signer,
		estate_2_signer : signer		
	) {	
		use std::string::{ String, utf8 };
		use std::signer;
		use std::debug;
		
		use ride::Bothy_Tivaevae;
		use ride::Bothy_Tivaevae::{ Tivaevae };
		use ride::Bothy_Mwanaanga;

		let estate_1_address = signer::address_of (& estate_1_signer);
		let tivaevae_address = estate_1_address;
		let mwanaanga_1_address = estate_1_address;
		
		let estate_2_address = signer::address_of (& estate_2_signer);
		let mwanaanga_2_address = estate_2_address;
		

		//
		//	Founding:
		//		* Learn if the estate already has a tivaevae.
		//		* Establish a Tivaevae.
		//		* Learn if the estate has a tivaevae.
		//
		assert! (Bothy_Tivaevae::Ask_if_estate_has_a_Tivaevae (estate_1_address) == utf8 (b"no"), 1);
		Bothy_Tivaevae::Establish_a_Tivaevae (& estate_1_signer);
		assert! (Bothy_Tivaevae::Ask_if_estate_has_a_Tivaevae (estate_1_address) == utf8 (b"yes"), 1);

		//
		//	Founding: Join:
		//		* Learn if the estate has a mwanaanga present at the tivaevae.
		//		* Join the Tivaevae as a Mwanaanga.
		//
		assert! (Bothy_Tivaevae::is_mwanaanga_at_Tivaevae (tivaevae_address, mwanaanga_1_address) == utf8 (b"no"), 1);
		Bothy_Tivaevae::Join_a_Tivaevae (& estate_1_signer);
		assert! (Bothy_Tivaevae::is_mwanaanga_at_Tivaevae (tivaevae_address, mwanaanga_1_address) == utf8 (b"yes"), 1);
		
		
		//
		//
		//	Estate 2: Join:
		//
		//
		debug::print (& utf8 (b"estate 2 joining"));
		debug::print (& Bothy_Tivaevae::is_mwanaanga_at_Tivaevae (tivaevae_address, mwanaanga_2_address));
		
		assert! (Bothy_Tivaevae::is_mwanaanga_at_Tivaevae (tivaevae_address, mwanaanga_2_address) == utf8 (b"no"), 1);
		Bothy_Tivaevae::Join_a_Tivaevae (& estate_2_signer);
		assert! (Bothy_Tivaevae::is_mwanaanga_at_Tivaevae (tivaevae_address, mwanaanga_2_address) == utf8 (b"yes"), 1);

		
		
	}
}