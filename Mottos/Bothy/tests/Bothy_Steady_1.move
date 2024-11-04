







module ride::Bothy_Steady_1 {
	
	use std::debug;
	use std::signer;
	use std::string::{ String, utf8 };
	use std::vector;
	
	use aptos_framework::block;

	use ride::Bothy_Guild;

	const PROBLEM : u64 = 0;
	
	
	// #[test(estate_1_private_key = @0xBC8E524371E9DABC8F9EADBC1623548E9CB614370F8CBE94352615448FB916B9)]
	
	

	
	#[test(estate_1_legacy_address = @estate_1_legacy_address)]
    public fun novel_1 (estate_1_legacy_address: signer) {	
		assert! (signer::address_of (& estate_1_legacy_address) == @0x99caba6e28919a1ef5ada895a9e0b1093159f823c523eaf5eddf5cfdc3293e2f, 0);
		
		let vectors : vector<u8> = vector::empty<u8> ();
		let vector_01 : vector<u8> = b"yes";
		vector::append (&mut vectors, vector_01);
		let is_open : String = utf8 (vectors);
		
		
		Bothy_Guild::Establish_Guild (& estate_1_legacy_address)
		
    }
}