







module ride::Bothy_Tivaevae {
	
	use std::vector;
	use std::string::{ Self, String, utf8 };
	use std::signer;
	use std::debug;
	
	use ride::Loft;

	use ride::Bothy_Vitrine;
	use ride::Bothy_Thermoplastic;
	use ride::Bothy_Mwanaanga;	

	

	#[view]
	public fun togetherness () : String {
		let togetherness = Loft::togetherness ();
		togetherness
	}
	
	
	struct Tivaevae has key, drop {
        is_open: String,
		mwanaangas: vector<Bothy_Mwanaanga::Mwanaanga>
    }
	
	
	////
	//
	//	Novelist Level
	//		These should be possible if Novelist.
	//
	//		This fonction is the one that creates the Tivaevae resource though.
	//
	public entry fun Establish_a_Tivaevae (
		estate: &signer
	) {
		let estate_1_address = signer::address_of (estate);
		// is_novelist (estate_1_address);
		
		if (exists<Tivaevae>(estate_1_address)) {
            abort (0x1001);
        };
		
		let vectors : vector<u8> = vector::empty<u8> ();
		let vector_01 : vector<u8> = b"yes";
		vector::append (&mut vectors, vector_01);
		let is_open : String = utf8 (vectors);
		
		let mwanaangas : vector<Bothy_Mwanaanga::Mwanaanga> = vector::empty<Bothy_Mwanaanga::Mwanaanga> ();
        let le_Tivaevae = Tivaevae {
            is_open: is_open,
            mwanaangas
        };
		
		move_to (estate, le_Tivaevae);
    }
	
	#[view]
	public fun is_mwanaanga_at_Tivaevae (
		estate_address: address, 
		mwanaanga_address: address
	) : String acquires Tivaevae {
		if (!exists<Tivaevae>(estate_address)) {
           return utf8 (b"There is not a Tivaevae at that estate.")
        };
		
		let le_tivaevae = borrow_global<Tivaevae>(estate_address);
		
		let last_index = vector::length (& le_tivaevae.mwanaangas) - 1;
		let at_Tivaevae = utf8 (b"perhaps");

		/*
		if (vector::length (& le_tivaevae.mwanaangas) == 0) {
			return utf8 (b"no")
		};
		
		let gezegen = 0;
		while (gezegen <= last_index) {
			let mwanaanga = vector::borrow (& le_tivaevae.mwanaangas, gezegen);
			let this_mwanaanga_address : address = Bothy_Mwanaanga::ask_for_address (& mwanaanga);
			
			if (this_mwanaanga_address == mwanaanga_address) {
				at_Tivaevae = utf8 (b"yes");
				break;
			};
		};
		*/

		at_Tivaevae
	}

	
	public entry fun Embark_on_Tivaevae (
		estate: & signer
	) acquires Tivaevae {
		let estate_1_address = signer::address_of (estate);
		
		let mwanaanga_1 = Bothy_Mwanaanga::accept_mwanaanga (
           estate_1_address
        );
		

		
		//
		//	This is the flourishing estate's Tivaevae.
		//	This should be another estate's Tivaevae though.
		//
		let le_tivaevae = borrow_global_mut<Tivaevae>(estate_1_address);

		vector::push_back (&mut le_tivaevae.mwanaangas, mwanaanga_1);
	}
	//
	////
	
	
	////
	//
	//	Mwanaanga Level
	//
	//		
	//
	//
	public entry fun Attend_Tivaevae (
		estate: & signer
	) acquires Tivaevae {
		let estate_1_address = signer::address_of (estate);
		let thermoplastic_1 = Bothy_Thermoplastic::polymerize_a_thermoplastic_dome ();
		
		let mwanaanga_1 = Bothy_Mwanaanga::accept_mwanaanga (
           estate_1_address
        );
		
		//
		//	This is the flourishing estate's Tivaevae.
		//	This should be another estate's Tivaevae though.
		//
		let le_Tivaevae = borrow_global_mut<Tivaevae>(estate_1_address);

		vector::push_back (&mut le_Tivaevae.mwanaangas, mwanaanga_1);
	}
	
	
	
	
	////
	//
	//	Scouting
	//
	//
	#[view]
	public fun is_there_a_Tivaevae (
		estate_1_address : address
	) : String {
		if (exists<Tivaevae>(estate_1_address)) {
           utf8 (b"There is a Tivaevae at that estate.")
        }
		else {
			utf8 (b"There is not a Tivaevae at that estate.")
		}
    }
}







