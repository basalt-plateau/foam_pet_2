
/*
	https://aptos.dev/en/build/smart-contracts/move-reference?page=aptos-stdlib%2Fdoc%2Fsimple_map.md#@Specification_1_add
*/

module ride_1::Merci_Steady_1 {
	
	use std::string::{ String };
	
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
		use std::string::{ utf8 };
		
		use ride_1::Merci_Harvest;
		
		let novelist : address = Merci_Harvest::search_novelist_spot ();
		
		let estate_1_spot = signer::address_of (& estate_1_flourisher);
		let estate_2_spot = signer::address_of (& estate_2_flourisher);
		let estate_3_spot = signer::address_of (& estate_3_flourisher);
		
		debug::print (& string_utils::format1 (& b"estate_1_spot: {}", estate_1_spot));
		debug::print (& string_utils::format1 (& b"equal: {}", estate_1_spot == novelist));
		
		
		/*
			Establishing:
				Estate 1		
		*/
		let mercyverse : u256 = 10000000000000000000000000000000000000000000000000000000000000000000000000000;
		Merci_Harvest::establish_harvest (& estate_1_flourisher, mercyverse);
		if (Merci_Harvest::is_party_at_harvest (estate_1_spot) != utf8 (b"yup")) { abort 1 };
		if (Merci_Harvest::ask_for_party_mercy_volume (estate_1_spot) != mercyverse) { abort 2 };
		
		
		/*
			Joining:
				Estate 2
				Estate 3		
		*/
		Merci_Harvest::join_harvest (& estate_2_flourisher);
		if (Merci_Harvest::is_party_at_harvest (estate_2_spot) != utf8 (b"yup")) { abort 3 };
		if (Merci_Harvest::ask_for_party_mercy_volume (estate_2_spot) != 0) { abort 4 };
		
		Merci_Harvest::join_harvest (& estate_3_flourisher);
		if (Merci_Harvest::is_party_at_harvest (estate_3_spot) != utf8 (b"yup")) { abort 3 };
		if (Merci_Harvest::ask_for_party_mercy_volume (estate_3_spot) != 0) { abort 4 };
		
		
		/*
			Send: 
				Estate 1 Party -> Estate 2 Presents
		*/
		let mercy_to_send : u256 = 1000000000000000000000000000000000000000000000000000000000000000000000000000;
		let expected_estate_1_mercy_after_send : u256 = 9000000000000000000000000000000000000000000000000000000000000000000000000000;
	}
}


