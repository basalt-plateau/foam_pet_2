







module ride::Rondoval_Tivaevae {
	
	use std::vector;
	use std::string::{ Self, String, utf8 };
	use std::string_utils;	
	use std::signer;
	use std::debug;
	
	use ride::Loft;

	use ride::Rondoval_Vitrine;
	use ride::Rondoval_Thermoplastic;
	use ride::Rondoval_Geimfara;	
	use ride::Rondoval_Geimfara::{ Geimfara };	

	

	#[view]
	public fun togetherness () : String {
		Loft::togetherness ()
	}
	
	
	struct Tivaevae has key, drop, store {
        is_open: String,
		geimfaras: vector<Geimfara>
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
		
		let geimfaras : vector<Geimfara> = vector::empty<Geimfara> ();
        let le_Tivaevae = Tivaevae {
            is_open: utf8 (b"no"),
            geimfaras
        };
		
		move_to (estate, le_Tivaevae);
    }
	
	
	/*
		
	
	*/
	public fun obtain_Tivaevae (
		tivaevae_address : address
	) : Tivaevae acquires Tivaevae {
		if (!exists<Tivaevae>(tivaevae_address)) {
           abort 1001;
        };

		// borrow_global<Tivaevae>(tivaevae_address)

		let tivaevae = move_from<Tivaevae>(tivaevae_address);
		tivaevae
    }
	
	
	/*
	public fun give_Tivaevae (
		le_tivaevae : Tivaevae,
		tivaevae_address : address
	) acquires Tivaevae {
		move_to (tivaevae_address, le_tivaevae);
    }
	*/
	
	
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
		geimfara_1_address : address
	) {
		let sheets : u64 = 900000;
		
		
    }
	
	public fun Ask_geimfara_thermoplastic_sheet_count (
		geimfara_1_address : address
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
			Accept the Geimfara into the Tivaevae.
			
		*/
		let estate_1_address = signer::address_of (estate);		
		let geimfara_1 = Rondoval_Geimfara::accept_geimfara (
			estate_1_address
        );
		vector::push_back (&mut le_tivaevae.geimfaras, geimfara_1);
	}

	
	
	/*
		let index : u64 = Rondoval_Tivaevae::search_geimfara_index (tivaevae_address, geimfara_address);
		
		let le_tivaevae = borrow_global<Tivaevae>(tivaevae_address);
		let geimfara = vector::borrow (& le_tivaevae.geimfaras, index);
	*/
	public fun search_geimfara_index (
		tivaevae_address : address,
		geimfara_address : address		
	) : u64 acquires Tivaevae {
		if (!exists<Tivaevae>(tivaevae_address)) {
           abort 794
        };
		
		let le_tivaevae = borrow_global<Tivaevae>(tivaevae_address);

		if (vector::length (& le_tivaevae.geimfaras) == 0) {
			abort 79491
		};

		let last_index : u64 = vector::length (& le_tivaevae.geimfaras) - 1;

		let gezegen : u64 = 0;
		while (gezegen <= last_index) {
			let geimfara_1 = vector::borrow (& le_tivaevae.geimfaras, gezegen);
			let this_geimfara_address : address = Rondoval_Geimfara::ask_for_address (geimfara_1);
			if (this_geimfara_address == geimfara_address) {
				return gezegen
			};
			
			gezegen = gezegen + 1;
		};
		

		abort 959
	}
	
	
	public fun search_geimfara_thermoplastic_count (
		tivaevae_address : address,
		geimfara_address : address		
	) : u64 acquires Tivaevae {
		if (!exists<Tivaevae>(tivaevae_address)) {
           abort 794
        };
		
		let le_tivaevae = borrow_global<Tivaevae>(tivaevae_address);

		if (vector::length (& le_tivaevae.geimfaras) == 0) {
			abort 79491
		};

		let last_index : u64 = vector::length (& le_tivaevae.geimfaras) - 1;

		let gezegen : u64 = 0;
		while (gezegen <= last_index) {
			let geimfara_1 = vector::borrow (& le_tivaevae.geimfaras, gezegen);
			let this_geimfara_address : address = Rondoval_Geimfara::ask_for_address (geimfara_1);
			if (this_geimfara_address == geimfara_address) {
				let thermoplastic_sheets_count : u64 = Rondoval_Geimfara::ask_for_thermoplastic_sheets_count (geimfara_1);
				return thermoplastic_sheets_count
			};
			
			gezegen = gezegen + 1;
		};
		

		abort 959
	}
	
	
	/*
		Rondoval_Tivaevae::is_geimfara_at_Tivaevae (
			tivaevae_address,
			geimfara_address
		) == utf8 (b"yes")
		
		proceeds:
			yes
			no
			There is not a Tivaevae at that estate.
	*/
	public fun is_geimfara_at_Tivaevae (
		tivaevae_address : address,
		geimfara_address : address		
	) : String acquires Tivaevae {
		if (!exists<Tivaevae>(tivaevae_address)) {
           return utf8 (b"There is not a Tivaevae at that estate.")
        };
		
		let le_tivaevae = borrow_global<Tivaevae>(tivaevae_address);

		if (vector::length (& le_tivaevae.geimfaras) == 0) {
			return utf8 (b"no")
		};

		let last_index : u64 = vector::length (& le_tivaevae.geimfaras) - 1;
		// debug::print (& string_utils::format1 (& b"last_index: {}", last_index));

		let gezegen : u64 = 0;
		while (gezegen <= last_index) {
			debug::print (& string_utils::format1 (& b"gezegen: {}", gezegen));
		
			let geimfara_1 = vector::borrow (& le_tivaevae.geimfaras, gezegen);
			let this_geimfara_address : address = Rondoval_Geimfara::ask_for_address (geimfara_1);
			debug::print (& string_utils::format1 (& b"geimfara_address: {}", this_geimfara_address));
		
			if (this_geimfara_address == geimfara_address) {
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
	//	Geimfara Level
	//
	//		
	//
	//
	public entry fun Attend_Tivaevae (
		estate: & signer
	) acquires Tivaevae {
		let estate_1_address = signer::address_of (estate);
		let thermoplastic_1 = Rondoval_Thermoplastic::polymerize_a_thermoplastic_dome ();
		
		let geimfara_1 = Rondoval_Geimfara::accept_geimfara (
           estate_1_address
        );
		
		//
		//	This is the flourishing estate's Tivaevae.
		//	This should be another estate's Tivaevae though.
		//
		let le_Tivaevae = borrow_global_mut<Tivaevae>(estate_1_address);

		vector::push_back (&mut le_Tivaevae.geimfaras, geimfara_1);
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
		
		let geimfara_1 = Rondoval_Geimfara::accept_geimfara (
           estate_1_address
        );
		
		//
		//	This is the flourishing estate's Tivaevae.
		//	This should be another estate's Tivaevae though.
		//
		let le_tivaevae = borrow_global_mut<Tivaevae>(estate_1_address);

		vector::push_back (&mut le_tivaevae.geimfaras, geimfara_1);
	}
}







