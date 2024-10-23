





module ride::Pergola_Steady_1 {
	use std::debug;
	use std::string::utf8;

	use ride::Pergola;

	const PROBLEM : u64 = 0;
	
	#[test]
    public fun steady_estate_scout () {
		let estate_1_legacy_address : address = @0x099CABA6E28919A1EF5ADA895A9E0B1093159F823C523EAF5EDDF5CFDC3293E2F;
		
        let string_1 = Pergola::estate_scout (estate_1_legacy_address);
        debug::print (& string_1);
		
		assert! (string_1 == utf8 (b"There is not an estate at that address."), PROBLEM);
    }
}