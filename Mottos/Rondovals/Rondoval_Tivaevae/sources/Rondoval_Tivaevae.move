







module ride::Rondoval_Tivaevae {
	
	use std::vector;
	use std::string::{ Self, String, utf8 };
	use std::string_utils;	
	use std::signer;
	use std::debug;
	
	use ride::Loft;

	use ride::Rondoval_Vitrine;
	use ride::Rondoval_Thermoplastic;
	use ride::Rondoval_Mtembezi;	
	use ride::Rondoval_Mtembezi::{ Mtembezi };	

	

	#[view]
	public fun togetherness () : String {
		let togetherness = Loft::togetherness ();
		togetherness
	}
	
	
	struct Tivaevae has key, drop {
        is_open: String,
		mtembezis: vector<Mtembezi>
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
		
		let mtembezis : vector<Mtembezi> = vector::empty<Mtembezi> ();
        let le_Tivaevae = Tivaevae {
            is_open: utf8 (b"no"),
            mtembezis
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
		mtembezi_1_address : address
	) {
		let sheets : u64 = 900000;
		
		
    }
	
	public fun Ask_mtembezi_thermoplastic_sheet_count (
		mtembezi_1_address : address
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
			Accept the Mtembezi into the Tivaevae.
			
		*/
		let estate_1_address = signer::address_of (estate);		
		let mtembezi_1 = Rondoval_Mtembezi::accept_mtembezi (
			estate_1_address
        );
		vector::push_back (&mut le_tivaevae.mtembezis, mtembezi_1);
	}

	
	/*
		Rondoval_Tivaevae::is_mtembezi_at_Tivaevae (
			tivaevae_address,
			mtembezi_address
		) == utf8 (b"yes")
		
		proceeds:
			yes
			no
			There is not a Tivaevae at that estate.
	*/
	public fun is_mtembezi_at_Tivaevae (
		tivaevae_address : address,
		mtembezi_address : address		
	) : String acquires Tivaevae {
		if (!exists<Tivaevae>(tivaevae_address)) {
           return utf8 (b"There is not a Tivaevae at that estate.")
        };
		
		let le_tivaevae = borrow_global<Tivaevae>(tivaevae_address);

		if (vector::length (& le_tivaevae.mtembezis) == 0) {
			return utf8 (b"no")
		};

		let last_index : u64 = vector::length (& le_tivaevae.mtembezis) - 1;
		// debug::print (& string_utils::format1 (& b"last_index: {}", last_index));

		let gezegen : u64 = 0;
		while (gezegen <= last_index) {
			debug::print (& string_utils::format1 (& b"gezegen: {}", gezegen));
		
			let mtembezi_1 = vector::borrow (& le_tivaevae.mtembezis, gezegen);
			let this_mtembezi_address : address = Rondoval_Mtembezi::ask_for_address (mtembezi_1);
			debug::print (& string_utils::format1 (& b"mtembezi_address: {}", this_mtembezi_address));
		
			if (this_mtembezi_address == mtembezi_address) {
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
	//	Mtembezi Level
	//
	//		
	//
	//
	public entry fun Attend_Tivaevae (
		estate: & signer
	) acquires Tivaevae {
		let estate_1_address = signer::address_of (estate);
		let thermoplastic_1 = Rondoval_Thermoplastic::polymerize_a_thermoplastic_dome ();
		
		let mtembezi_1 = Rondoval_Mtembezi::accept_mtembezi (
           estate_1_address
        );
		
		//
		//	This is the flourishing estate's Tivaevae.
		//	This should be another estate's Tivaevae though.
		//
		let le_Tivaevae = borrow_global_mut<Tivaevae>(estate_1_address);

		vector::push_back (&mut le_Tivaevae.mtembezis, mtembezi_1);
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
		
		let mtembezi_1 = Rondoval_Mtembezi::accept_mtembezi (
           estate_1_address
        );
		
		//
		//	This is the flourishing estate's Tivaevae.
		//	This should be another estate's Tivaevae though.
		//
		let le_tivaevae = borrow_global_mut<Tivaevae>(estate_1_address);

		vector::push_back (&mut le_tivaevae.mtembezis, mtembezi_1);
	}
}







