





module ride::Bothy_Guild {
	use std::string::{ Self, String };
	use std::signer;
	
	use ride::Loft;

	const Novelist : address = @0x99caba6e28919a1ef5ada895a9e0b1093159f823c523eaf5eddf5cfdc3293e2f;

	#[view]
	public fun togetherness () : String {
		let togetherness = Loft::togetherness ();
		togetherness
	}
	
	struct Guild has key, drop {
        is_open: String,
		addresses: vector<address>
    }
	
	struct Mwanaanga has key, drop {
        
    }
	
	////
	//
	//	Novelist Level
	//		These should be possible if Novelist.
	//
	public fun Establish_Guild (
		harvest: &signer,
		is_open: String, 
		addresses: vector<address>
	): Guild {
		// let vectors : vector<u8> = vector::empty<u8> ();
		// let vector_01 : vector<u8> = b"yes";
		// vector::append (&mut vectors, vector_01);
		// let is_open : String = utf8 (vectors);
		
        Guild {
            is_open: is_open,
            addresses
        }
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







