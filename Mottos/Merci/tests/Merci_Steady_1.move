
/*
	https://aptos.dev/en/build/smart-contracts/move-reference?page=aptos-stdlib%2Fdoc%2Fsimple_map.md#@Specification_1_add
*/

module ride_1::Merci_Steady_1 {
	
	use std::string::{ String, utf8 };
	
	use ride_1::Merci_Bayanihan;
	
	#[view]
	public fun Bayanihan () : String {
		Merci_Bayanihan::Bayanihan ()
	}	
	
	#[test (
		estate_1_flourisher = @ride_1, 
		estate_2_flourisher = @ride_2,
		estate_3_flourisher = @ride_3		
	)]
    public fun novel_1_establish_join_send_leave (
		estate_1_flourisher : signer,
		estate_2_flourisher : signer,
		estate_3_flourisher : signer		
	) {	
		use std::debug;
		use std::signer;
		use std::string_utils;
		
		use ride_1::Merci_Harvest;
		
		let novelist : address = Merci_Harvest::search_novelist_spot ();
		
		let estate_1_spot = signer::address_of (& estate_1_flourisher);
		let estate_2_spot = signer::address_of (& estate_2_flourisher);
		let estate_3_spot = signer::address_of (& estate_3_flourisher);
		
		debug::print (& string_utils::format1 (& b"estate_1_spot: {}", estate_1_spot));
		debug::print (& string_utils::format1 (& b"equal: {}", estate_1_spot == novelist));
		
		
		/*
			Establishing
		
		*/
		let mercyverse : u256 = 10000000000000000000000000000000000000000000000000000000000000000000000000000;
		Merci_Harvest::Establish_the_Mercy_Harvest (& estate_1_flourisher);
		if (Merci_Harvest::has_estate (estate_1_spot) != utf8 (b"yup")) { abort 89319 };
		if (Merci_Harvest::ask_estate_mercy_amount (estate_1_spot) != mercyverse) { abort 89320 };
		
		/*
			Joining
		
		*/
		Merci_Harvest::Join_the_Mercy_Harvest (& estate_2_flourisher);
		if (Merci_Harvest::has_estate (estate_2_spot) != utf8 (b"yup")) { abort 89321 };
		if (Merci_Harvest::ask_estate_mercy_amount (estate_2_spot) != 0) { abort 89322 };
		
		Merci_Harvest::Join_the_Mercy_Harvest (& estate_3_flourisher);
		if (Merci_Harvest::has_estate (estate_3_spot) != utf8 (b"yup")) { abort 89321 };
		if (Merci_Harvest::ask_estate_mercy_amount (estate_3_spot) != 0) { abort 89322 };

	
		/*
			Send: 
				Estate 1 -> Estate 2
		*/
		let mercy_to_send : u256 = 1000000000000000000000000000000000000000000000000000000000000000000000000000;
		let expected_estate_1_mercy_after_send : u256 = 9000000000000000000000000000000000000000000000000000000000000000000000000000;
		Merci_Harvest::Send_Mercy (
			& estate_1_flourisher,
			estate_2_spot,
			mercy_to_send
		);
		if (Merci_Harvest::ask_estate_mercy_amount (estate_2_spot) != mercy_to_send) { abort 89323 };
		if (Merci_Harvest::ask_estate_mercy_amount (estate_1_spot) != expected_estate_1_mercy_after_send) { abort 89324 };

		/*
			Leave:
				Estate 2
		*/
		Merci_Harvest::Leave_the_Mercy_Harvest (& estate_2_flourisher);
		if (Merci_Harvest::has_estate (estate_2_spot) == utf8 (b"yup")) { abort 89325 };	


		/*
			Leave:
				Estate 3
		*/
		Merci_Harvest::Leave_the_Mercy_Harvest (& estate_3_flourisher);
		if (Merci_Harvest::has_estate (estate_3_spot) == utf8 (b"yup")) { abort 89325 };		
	}
}


