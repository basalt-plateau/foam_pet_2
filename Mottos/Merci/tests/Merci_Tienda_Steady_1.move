


/*
	https://aptos.dev/en/build/smart-contracts/move-reference?page=aptos-stdlib%2Fdoc%2Fsimple_map.md#@Specification_1_add
*/

module ride_1::Merci_Tienda_Steady_1 {
	
	use std::string::{ String, utf8 };
	
	use ride_1::Merci_Bayanihan;
	use ride_1::Merci_Tienda;
	use ride_1::Merci_Harvest;
	
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
		
		
		
		
		
		/*
			Establishing Harvest
		
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
			Establishing Sales
		
		*/
		Merci_Tienda::Establish_Sales (& estate_1_flourisher);
	}
}


