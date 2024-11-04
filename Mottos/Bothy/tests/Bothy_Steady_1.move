







module ride::Bothy_Steady_1 {
	
	use std::debug;
	use std::signer;
	use std::string::{ String, utf8 };
	use std::vector;
	
	use aptos_framework::block;

	use ride::Bothy_Guild;

	const PROBLEM : u64 = 0;
	
	
	// #[test(estate_1_private_key = @0xBC8E524371E9DABC8F9EADBC1623548E9CB614370F8CBE94352615448FB916B9)]
	
	#[test(estate_1_private_key = @estate_1_private_key)]
    public fun novel_1 (estate_1_private_key: signer) {			
		let estate_1_address = signer::address_of (& estate_1_private_key);
		
		let vectors : vector<u8> = vector::empty<u8> ();
		let vector_01 : vector<u8> = b"yes";
		vector::append (&mut vectors, vector_01);
		let is_open : String = utf8 (vectors);
		
		
		let addresses : vector<address> = vector::empty<address> ();
		
		debug::print (& estate_1_address);
		
		/*
		Bothy_Guild::Establish_Guild (is_open, addresses)
		*/
    }
}