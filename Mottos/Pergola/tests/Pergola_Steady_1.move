





module ride::Pergola_Steady_1 {
	use std::debug;
	use std::string::utf8;

	use aptos_framework::coin;
	use aptos_framework::aptos_coin;
	
	use ride::Pergola;

	const PROBLEM : u64 = 0;
	
	#[test]
    public fun steady_estate_scout () {
		// let estate_1_legacy_address : address = @0x099CABA6E28919A1EF5ADA895A9E0B1093159F823C523EAF5EDDF5CFDC3293E2F;
		let estate_1_legacy_address : address = @0x99caba6e28919a1ef5ada895a9e0b1093159f823c523eaf5eddf5cfdc3293e2f;
		let estate_1_legacy_address : address = @0x652b8d45aebc4237cb4a4ca1d8b99725d8f973676844fe85eb09286d7f9d3808;
		
        let string_1 = Pergola::estate_scout (estate_1_legacy_address);
        debug::print (& string_1);
		
		assert! (string_1 == utf8 (b"There is not an estate at that address."), PROBLEM);
    }
	
	
	#[test]
    public fun steady_estate_APT_coins () {
		// let estate_1_legacy_address : address = @0x099CABA6E28919A1EF5ADA895A9E0B1093159F823C523EAF5EDDF5CFDC3293E2F;
		let estate_1_legacy_address : address = @0x99caba6e28919a1ef5ada895a9e0b1093159f823c523eaf5eddf5cfdc3293e2f;
		let estate_1_legacy_address : address = @0x652b8d45aebc4237cb4a4ca1d8b99725d8f973676844fe85eb09286d7f9d3808;
		
		let u64_1 : u64 = coin::balance<aptos_framework::aptos_coin::AptosCoin>(estate_1_legacy_address);
		debug::print (& u64_1);
		
        // let u64_1 : u64 = Pergola::APT_scoreboard <aptos_coin::AptosCoin> (estate_1_legacy_address);
        
		
		assert! (u64_1 == 0, PROBLEM);
    }
}