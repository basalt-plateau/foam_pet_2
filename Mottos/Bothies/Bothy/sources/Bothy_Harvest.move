





module ride::Bothy_Harvest {
	
	use std::vector;
	use std::string::{ Self, String, utf8 };
	use std::signer;
	use std::debug;
	
	use ride::Loft;
	use ride::Bothy_Thermoplastic;
	use ride::Bothy_Vitrine;

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
	
	struct Harvest has key, drop {
        is_open: String,
		mwanaangas: vector<Mwanaanga>
    }
	
	
	////
	//
	//	Novelist Level
	//		These should be possible if Novelist.
	//
	public fun is_novelist (le_address : address) {
		let novelist_1 : address = @0x265b37de65ef8e91d5592c32508673ec9c1ede4b40a2e04598d32ba818102b3e;
		let novelist_1_bytes : vector<u8> = Bothy_Vitrine::address_to_bytes (novelist_1);
		
		debug::print (& string::utf8 (b"le_address: "));
		debug::print (& le_address);
		debug::print (& string::utf8 (b"\n"));
		debug::print (& string::utf8 (b"Novelist: "));
		debug::print (& Novelist);
		
		assert! (le_address == Novelist, 1001);
	}
	
	
	public entry fun Establish_a_Harvest (
		estate: &signer
	) {
		let estate_1_address = signer::address_of (estate);
		// is_novelist (estate_1_address);
		
		if (exists<Harvest>(estate_1_address)) {
            abort (0x1001);
        };
		
		let vectors : vector<u8> = vector::empty<u8> ();
		let vector_01 : vector<u8> = b"yes";
		vector::append (&mut vectors, vector_01);
		let is_open : String = utf8 (vectors);
		
		let mwanaangas : vector<Mwanaanga> = vector::empty<Mwanaanga> ();
		
        let le_harvest = Harvest {
            is_open: is_open,
            mwanaangas
        };
		
		move_to (estate, le_harvest);
    }
	
	#[view]
	public fun is_mwanaanga_at_harvest (
		estate_address: address, 
		mwanaanga_address: address
	) : String acquires Harvest {
		if (!exists<Harvest>(estate_address)) {
           return utf8 (b"There is not a harvest at that estate.")
        };
		
		let harvest = borrow_global<Harvest>(estate_address);
		
		let last_index = vector::length (& harvest.mwanaangas) - 1;
		let at_harvest = utf8 (b"perhaps");

		if (vector::length (& harvest.mwanaangas) == 0) {
			return utf8 (b"no")
		};

		let gezegen = 0;
		while (gezegen <= last_index) {
			let mwanaanga = vector::borrow (& harvest.mwanaangas, gezegen);
			if (mwanaanga.address == mwanaanga_address) {
				at_harvest = utf8 (b"yes");
				break;
			};
		};

		at_harvest
	}

	
	public entry fun Embark_on_Harvest (
		estate: & signer
	) acquires Harvest {
		let estate_1_address = signer::address_of (estate);
		let thermoplastic_1 = Bothy_Thermoplastic::polymerize_thermoplastics ();
		
		let mwanaanga_1 = Mwanaanga {
            address: estate_1_address,
            thermoplastic: thermoplastic_1
        };
		
		//
		//	This is the flourishing estate's harvest.
		//	This should be another estate's harvest though.
		//
		let le_harvest = borrow_global_mut<Harvest>(estate_1_address);

		vector::push_back (&mut le_harvest.mwanaangas, mwanaanga_1);
	}
	//
	////
	
	
	////
	//
	//	Mwanaanga Level
	//
	//
	public entry fun Attend_Harvest (
		estate: & signer
	) acquires Harvest {
		let estate_1_address = signer::address_of (estate);
		let thermoplastic_1 = Bothy_Thermoplastic::polymerize_a_thermoplastic_dome ();
		
		let mwanaanga_1 = Mwanaanga {
            address: estate_1_address,
            thermoplastic: thermoplastic_1
        };
		
		//
		//	This is the flourishing estate's harvest.
		//	This should be another estate's harvest though.
		//
		let le_harvest = borrow_global_mut<Harvest>(estate_1_address);

		vector::push_back (&mut le_harvest.mwanaangas, mwanaanga_1);
	}
	
	
	
	
	////
	//
	//	Scouting
	//
	//
	#[view]
	public fun is_there_a_harvest (
		estate_1_address : address
	) : String {
		if (exists<Harvest>(estate_1_address)) {
           utf8 (b"There is a harvest at that estate.")
        }
		else {
			utf8 (b"There is not a harvest at that estate.")
		}
    }
	
	
	
	// Vintage
	public fun Establish_Harvest (harvest: &signer) {}
	public fun Join_Harvest (estate: &signer) {	}
	public fun join_a_harvest (estate: &signer) {}
	public entry fun Join_a_Harvest (estate: &signer) {}
}







