




module ride::Bothy_Tivaevae_Novelist {
	
	use std::vector;
	use std::string::{ Self, String, utf8 };
	use std::signer;
	use std::debug;
	
	use ride::Loft;

	use ride::Bothy_Vitrine;
	use ride::Bothy_Thermoplastic;
	use ride::Bothy_Mwanaanga;	
	
	const Novelist : address = @0x99caba6e28919a1ef5ada895a9e0b1093159f823c523eaf5eddf5cfdc3293e2f;
	
	public fun is_novelist (le_address : address) : String {
		/*
		let novelist_1 : address = @0x265b37de65ef8e91d5592c32508673ec9c1ede4b40a2e04598d32ba818102b3e;
		let novelist_1_bytes : vector<u8> = Bothy_Vitrine::address_to_bytes (novelist_1);
		
		debug::print (& utf8 (b"le_address: "));
		debug::print (& le_address);
		debug::print (& utf8 (b"\n"));
		debug::print (& utf8 (b"Novelist: "));
		debug::print (& Novelist);
		
		assert! (le_address == Novelist, 1001);
		*/
		
		utf8 (b"perhaps")
	}
	
	
	
	
}