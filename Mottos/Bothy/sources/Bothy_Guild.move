





module ride::Bothy_Guild {
	
	use std::vector;
	use std::string::{ Self, String, utf8 };
	use std::signer;
	use std::debug;
	
	use ride::Loft;
	use ride::Bothy_Thermoplastic;

	const Novelist : address = @0x99caba6e28919a1ef5ada895a9e0b1093159f823c523eaf5eddf5cfdc3293e2f;

	#[view]
	public fun togetherness () : String {
		let togetherness = Loft::togetherness ();
		togetherness
	}
	
	struct Mwanaanga has key, drop, store {
        address: address,
		thermoplastic: Bothy_Thermoplastic::Thermoplastic
    }
	
	struct Guild has key, drop {
        is_open: String,
		mwanaangas: vector<Mwanaanga>
    }
	
	
	////
	//
	//	Novelist Level
	//		These should be possible if Novelist.
	//
	public fun is_novelist (le_address : address) {
		debug::print (& string::utf8 (b"le_address: "));
		debug::print (& le_address);
		debug::print (& string::utf8 (b"\n"));
		debug::print (& string::utf8 (b"Novelist: "));
		debug::print (& Novelist);
		
		assert! (le_address == Novelist, 1);
	}
	
	public fun Establish_Guild (
		harvest: &signer
	) {
		let estate_1_address = signer::address_of (harvest);
		is_novelist (estate_1_address);
		
		let vectors : vector<u8> = vector::empty<u8> ();
		let vector_01 : vector<u8> = b"yes";
		vector::append (&mut vectors, vector_01);
		let is_open : String = utf8 (vectors);
		
		let mwanaangas : vector<Mwanaanga> = vector::empty<Mwanaanga> ();
		
        let guild = Guild {
            is_open: is_open,
            mwanaangas
        };
    }
	//
	////
	
	
	////
	//
	//	Mwanaanga Level
	//
	//
	public fun Join_Guild () {		
       
    }
	

	
}







