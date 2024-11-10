





module ride::Pergola_Steady_1 {

	
	const Problem : u64 = 0;
	
	/*
		This ensures that there is not an estate at an address.
	
	*/
	#[test]
    public fun steady_estate_scout () {
		use std::debug;
		use std::string::utf8;
		
		use ride::Pergola;
		
		// let estate_1_legacy_address : address = @0x99caba6e28919a1ef5ada895a9e0b1093159f823c523eaf5eddf5cfdc3293e2f;
		let estate_1_legacy_address : address = @0x652b8d45aebc4237cb4a4ca1d8b99725d8f973676844fe85eb09286d7f9d3808;
		
        let string_1 = Pergola::estate_scout (estate_1_legacy_address);
		if (string_1 != utf8 (b"There is not an estate at that address.")) {
			debug::print (& string_1);
			abort 89319
		}
    }
	
	


	#[test(estate_1 = @ride)]
    public fun steady_sequence_numerals (estate_1 : signer) {
		// let estate_1_legacy_address = signer::address_of (& estate_1);
    }
}