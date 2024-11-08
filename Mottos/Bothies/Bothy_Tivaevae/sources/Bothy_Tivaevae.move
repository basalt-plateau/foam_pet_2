







module ride::Bothy_Tivaevae {
	
	use std::vector;
	use std::string::{ Self, String, utf8 };
	use std::string_utils;	
	use std::signer;
	use std::debug;
	
	use ride::Loft;

	use ride::Bothy_Vitrine;
	use ride::Bothy_Thermoplastic;
	use ride::Bothy_Mwanaanga;	
	use ride::Bothy_Mwanaanga::{ Mwanaanga };	

	

	#[view]
	public fun togetherness () : String {
		let togetherness = Loft::togetherness ();
		togetherness
	}
	
	
	struct Tivaevae has key, drop {
        is_open: String,
		mwanaangas: vector<Mwanaanga>
    }
	
	
	////
	//
	//	Novelist Level
	//		These should be possible if Novelist.
	//
	//		This fonction is the one that creates the Tivaevae resource though.
	//
	public entry fun Establish_a_Tivaevae (
		estate: & signer
	) {
		let estate_1_address = signer::address_of (estate);
		// is_novelist (estate_1_address);
		
		if (exists<Tivaevae>(estate_1_address)) {
            abort (1001);
        };
		
		let mwanaangas : vector<Mwanaanga> = vector::empty<Mwanaanga> ();
        let le_Tivaevae = Tivaevae {
            is_open: utf8 (b"no"),
            mwanaangas
        };
		
		move_to (estate, le_Tivaevae);
    }
	
	#[view]
	public fun Ask_if_estate_has_a_Tivaevae (
		estate_1_address : address
	) : String {
		if (exists<Tivaevae>(estate_1_address)) {
            return utf8 (b"yes")
        };
		
		utf8 (b"no")
    }
	
	
	public fun Establish_thermoplastic (
		mwanaanga_1_address : address
	) {
		let sheets : u64 = 900000;
		
		
    }
	
	public fun Ask_mwanaanga_thermoplastic_sheet_count (
		mwanaanga_1_address : address
	) : u64 {
		let f64_1 = 0;
		
		f64_1
    }
	
	public entry fun Join_a_Tivaevae (
		estate: & signer,
		tivaevae_address : address
	) acquires Tivaevae {
		if (!exists<Tivaevae>(tivaevae_address)) {
           abort 1001;
        };
		let le_tivaevae = borrow_global_mut<Tivaevae>(tivaevae_address);
		
		/*
			Accept the Mwanaanga into the Tivaevae.
			
		*/
		let estate_1_address = signer::address_of (estate);		
		let mwanaanga_1 = Bothy_Mwanaanga::accept_mwanaanga (
			estate_1_address
        );
		vector::push_back (&mut le_tivaevae.mwanaangas, mwanaanga_1);
	}

	
	/*
		Bothy_Tivaevae::is_mwanaanga_at_Tivaevae (
			tivaevae_address,
			mwanaanga_address
		) == utf8 (b"yes")
		
		proceeds:
			yes
			no
			There is not a Tivaevae at that estate.
	*/
	public fun is_mwanaanga_at_Tivaevae (
		tivaevae_address : address,
		mwanaanga_address : address		
	) : String acquires Tivaevae {
		if (!exists<Tivaevae>(tivaevae_address)) {
           return utf8 (b"There is not a Tivaevae at that estate.")
        };
		
		let le_tivaevae = borrow_global<Tivaevae>(tivaevae_address);

		if (vector::length (& le_tivaevae.mwanaangas) == 0) {
			return utf8 (b"no")
		};

		let last_index : u64 = vector::length (& le_tivaevae.mwanaangas) - 1;
		// debug::print (& string_utils::format1 (& b"last_index: {}", last_index));

		let gezegen : u64 = 0;
		while (gezegen <= last_index) {
			debug::print (& string_utils::format1 (& b"gezegen: {}", gezegen));
		
			let mwanaanga_1 = vector::borrow (& le_tivaevae.mwanaangas, gezegen);
			let this_mwanaanga_address : address = Bothy_Mwanaanga::ask_for_address (mwanaanga_1);
			debug::print (& string_utils::format1 (& b"mwanaanga_address: {}", this_mwanaanga_address));
		
			if (this_mwanaanga_address == mwanaanga_address) {
				return utf8 (b"yes")
			};
			
			gezegen = gezegen + 1;
		};
		

		utf8 (b"no")
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
	
	
	//
	//
	//	Vintage
	//
	public entry fun Embark_on_Tivaevae (estate: & signer) acquires Tivaevae {
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
}







