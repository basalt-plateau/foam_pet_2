





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
	
	
	/*
		Unfinished:
			
	
	*/
	#[test]
    public fun steady_estate_APT_coins () {
		use std::debug;

		use aptos_framework::aptos_coin::{ AptosCoin };
		use aptos_framework::coin;
		
		
		// let estate_1_legacy_address : address = @0x99caba6e28919a1ef5ada895a9e0b1093159f823c523eaf5eddf5cfdc3293e2f;
		let estate_1_legacy_address : address = @0x652b8d45aebc4237cb4a4ca1d8b99725d8f973676844fe85eb09286d7f9d3808;
		
		let u64_1 : u64 = coin::balance<AptosCoin>(estate_1_legacy_address);
		if (u64_1 != 0) {
			debug::print (& u64_1);
			abort 947283
		}
		
        // let u64_1 : u64 = Pergola::APT_scoreboard <aptos_coin::AptosCoin> (estate_1_legacy_address);

    }


	#[test(estate_1 = @ride)]
    public fun steady_sequence_numerals (estate_1 : signer) {
		// let estate_1_legacy_address = signer::address_of (& estate_1);
    }
}