


/*
	https://aptos.dev/en/build/smart-contracts/move-reference?page=aptos-stdlib%2Fdoc%2Fsimple_map.md#@Specification_1_add
*/


/*
	* send a gift
	* accept a gift
*/
module ride_1::Merci_Steady_3 {
	
	use std::string::{ String };
	
	
	#[view]
	public fun Bayanihan () : String {
		use ride_1::Merci_Bayanihan;
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
		
		use ride_1::Merci_Novelist;
		use ride_1::Merci_Harvest;
		use ride_1::Merci_Gifts;
		use ride_1::Merci_Parties;
		
		let novelist : address = Merci_Novelist::ask_for_address_of_novelist ();
		
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
		Merci_Harvest::ask_to_establish_harvest (& estate_1_flourisher, mercyverse);
		if (Merci_Harvest::ask_if_a_party_joined_the_harvest (estate_1_spot) != utf8 (b"yup")) { abort 1 };
		if (Merci_Harvest::ask_for_le_amount_of_mercy_that_a_party_has (estate_1_spot) != mercyverse) { abort 2 };
		if (Merci_Harvest::ask_for_party_count () != 1) { abort 7; };
		
		/*
			Joining:
				Estate 2
				Estate 3		
		*/
		Merci_Harvest::ask_to_join_harvest (& estate_2_flourisher);
		if (Merci_Harvest::ask_if_a_party_joined_the_harvest (estate_2_spot) != utf8 (b"yup")) { abort 3 };
		if (Merci_Harvest::ask_for_le_amount_of_mercy_that_a_party_has (estate_2_spot) != 0) { abort 4 };
		if (Merci_Harvest::ask_for_party_count () != 2) { abort 7 };
		
		Merci_Harvest::ask_to_join_harvest (& estate_3_flourisher);
		if (Merci_Harvest::ask_if_a_party_joined_the_harvest (estate_3_spot) != utf8 (b"yup")) { abort 5 };
		if (Merci_Harvest::ask_for_le_amount_of_mercy_that_a_party_has (estate_3_spot) != 0) { abort 6 };
		if (Merci_Harvest::ask_for_party_count () != 3) { abort 7 };
		
		
		/*
			Send: 
				Estate 1 Party -> Estate 2 Gifts
		*/
		let mercy_to_send : u256 = 1000000000000000000000000000000000000000000000000000000000000000000000000000;
		let expected_estate_1_mercy_after_send : u256 = 9000000000000000000000000000000000000000000000000000000000000000000000000000;
		Merci_Harvest::ask_to_add_a_gift_to_gifts (& estate_1_flourisher, estate_2_spot, mercy_to_send);
		if (Merci_Harvest::ask_for_the_gifts_count () != 1) { abort 7 };
		if (Merci_Harvest::ask_for_le_amount_of_mercy_that_a_party_has (estate_1_spot) != expected_estate_1_mercy_after_send) { abort 6 };
		
		
		/*
			Show the gifts.
		*/
		Merci_Harvest::ask_to_show_every_gift ();
		
		
		/*
			Gift Acceptance:
				Gifts, from Estate 1 -> Estate 2 			
		*/
		let gift_acceptance_origin_address = estate_1_spot;
		let gift_acceptance_to_address = estate_2_spot;
		let gift_acceptance_mercy_volume = mercy_to_send;		
		Merci_Harvest::ask_to_accept_gift (
			gift_acceptance_origin_address, 
			gift_acceptance_to_address, 
			gift_acceptance_mercy_volume
		);
		if (Merci_Harvest::ask_for_the_gifts_count () != 0) { abort 7 };
		if (Merci_Harvest::ask_for_le_amount_of_mercy_that_a_party_has (estate_2_spot) != mercy_to_send) { abort 6 };
	}
}




