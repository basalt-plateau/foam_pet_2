




/*
	Fonctions:
		A: Tivaevae: Existstence Check
		
		B [entry]: Tivaevae: Establish
		
		C: Tivaevae: Obtain
		
		D: Tivaevae:Geimfara:
			Search: Geimfara Index
		
		
		E [entry]: Tivaevae: Join
		
		F: Tivaevae:Geimfara:Thermoplastic
			Search: Thermoplastic Sheets Count
		
		G: Tivaevae:Geimfara:Thermoplastic:
			+ Thermoplastic Sheets Count
		
		H: Tivaevae:Geimfara:
			is_geimfara_at_Tivaevae
			
			
		I [entry]: Tivaevae:Geimfara:Thermoplastic
			
			Ship: Thermoplastic
	
		J [entry]: Tivaevae: Destroy

	
	Novelist Level:
		These should be possible if Novelist.
		This fonction is the one that creates the Tivaevae resource though.
		
		B:
	
	Entry:
		Establish Tivaevae
		
		Join Tivaevae
		
		
		
			
	View:
		

	
	
	
	Fonctions that wrench the global storage.

*/
module ride::Rondoval_Tivaevae {
	
	use std::vector;
	use std::string::{ String, utf8 };
	use std::string_utils;	
	use std::signer;
	use std::debug;
	
	use ride::Loft;

	// use ride::Rondoval_Vitrine;
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
	
	#[view]
	public fun A (estate_1_address : address) : String {
		if (exists<Tivaevae>(estate_1_address)) { return utf8 (b"yep") };
		utf8 (b"no")
    }
	

	public entry fun B (
		estate_flourisher : & signer,
		thermoplastic_sheets_to_add : u64
	) acquires Tivaevae {
		/*
			tivaevae_address =
				estate_address
				geimfara_1_address
		*/
		let tivaevae_address = signer::address_of (estate_flourisher);
		let geimfara_1_address = tivaevae_address;
		
		//
		//	Perhaps:
		//		Filters:
		//			[ ] has already been established
		// 			[ ] is_novelist (estate_1_address);
		//		
		//
		
		if (exists<Tivaevae>(tivaevae_address)) {
            abort (1001)
        };
		
		
		//
		//	Tivaevae: Establish
		//
		//
		let geimfaras : vector<Geimfara> = vector::empty<Geimfara> ();
		let le_Tivaevae = Tivaevae {
            is_open: utf8 (b"no"),
            geimfaras
        };
		move_to (estate_flourisher, le_Tivaevae);
		
		
		//
		//	Geimfara 1 (Novelist): Join
		//
		//		* Learn if the estate has a geimfara present at the tivaevae.
		//		* Join the Tivaevae as a Geimfara.
		//		* Learn if the estate has a geimfara present at the tivaevae.
		//
		assert! (H (tivaevae_address, geimfara_1_address) == utf8 (b"no"), 1);
		E (estate_flourisher, tivaevae_address);
		assert! (H (tivaevae_address, geimfara_1_address) == utf8 (b"yes"), 1);
		
		
		//
		//
		//	Geimfara 1 (Novelist): thermoplastic to Geimfara 1
		//	
		//		* Guarantee sheets count = 0
		//		* Build sheets for Geimfara 1
		//		* Guarantee sheets count = 900000
		//
		assert! (F (tivaevae_address, geimfara_1_address) == 0, 1);
		
				
		G (tivaevae_address, geimfara_1_address, thermoplastic_sheets_to_add);
		assert! (F (tivaevae_address, geimfara_1_address) == 900000, 1);
    }
	

	public fun C (tivaevae_address : address) : Tivaevae acquires Tivaevae {
		if (!exists<Tivaevae>(tivaevae_address)) {
           abort 1001
        };

		// borrow_global<Tivaevae>(tivaevae_address)

		let tivaevae = move_from<Tivaevae>(tivaevae_address);
		tivaevae
    }
	

	public entry fun E (
		estate: & signer,
		tivaevae_address : address
	) acquires Tivaevae {
		if (!exists<Tivaevae>(tivaevae_address)) { abort 1001 };
		let le_tivaevae = borrow_global_mut<Tivaevae>(tivaevae_address);
		
		/*
			Accept the Geimfara into the Tivaevae.
			
		*/
		let estate_1_address = signer::address_of (estate);		
		let geimfara_1 = Rondoval_Geimfara::G1 (
			estate_1_address
        );
		vector::push_back (&mut le_tivaevae.geimfaras, geimfara_1);
	}

	
	
	/*
		Search Geimfara Index:
	
			let index : u64 = Rondoval_Tivaevae::D (tivaevae_address, geimfara_address);
			
			let le_tivaevae = borrow_global<Tivaevae>(tivaevae_address);
			let geimfara = vector::borrow (& le_tivaevae.geimfaras, index);
	*/
	public fun D (
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
			let this_geimfara_address : address = Rondoval_Geimfara::G2 (geimfara_1);
			if (this_geimfara_address == geimfara_address) {
				return gezegen
			};
			
			gezegen = gezegen + 1;
		};
		

		abort 959
	}
	
	
	public fun F (
		tivaevae_address : address,
		geimfara_address : address		
	) : u64 acquires Tivaevae {
		let index : u64 = D (tivaevae_address, geimfara_address);
		
		let le_tivaevae = borrow_global<Tivaevae>(tivaevae_address);
		let geimfara = vector::borrow (& le_tivaevae.geimfaras, index);
		let thermoplastic_sheets_count : u64 = Rondoval_Geimfara::G3 (geimfara);
		thermoplastic_sheets_count
	}
	
	
	public fun G (
		tivaevae_address : address,
		geimfara_address : address,
		to_add_f64 : u64
	) : u64 acquires Tivaevae {
		let index : u64 = D (tivaevae_address, geimfara_address);
		
		let le_tivaevae = borrow_global_mut<Tivaevae>(tivaevae_address);
		let geimfara = vector::borrow_mut (&mut le_tivaevae.geimfaras, index);
		
		Rondoval_Geimfara::G4 (geimfara, to_add_f64);
		
		let thermoplastic_sheets_count : u64 = Rondoval_Geimfara::G3 (geimfara);
		thermoplastic_sheets_count
	}
	
	
	/*
		is_geimfara_at_Tivaevae
	
		Rondoval_Tivaevae::H (
			tivaevae_address,
			geimfara_address
		) == utf8 (b"yes")
		
		proceeds:
			yes
			no
			There is not a Tivaevae at that estate.
	*/
	public fun H (
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
			let this_geimfara_address : address = Rondoval_Geimfara::G2 (geimfara_1);
			debug::print (& string_utils::format1 (& b"geimfara_address: {}", this_geimfara_address));
		
			if (this_geimfara_address == geimfara_address) {
				return utf8 (b"yes")
			};
			
			gezegen = gezegen + 1;
		};
		

		utf8 (b"no")
	}
	
	
	/*
	public entry fun I (
		geimfara_1: & signer,
		geimfara_2: address,
		sheets_count_f64 : u64
	) {
		// guarantee that geimfara_1 has enough sheets for the send.		
		
		
		
		
	}
	*/
	

	/*
		This is for destroying a Tivaevae.
	*/
	public entry fun J (tivaevae_spot : address) acquires Tivaevae {
        move_from<Tivaevae> (tivaevae_spot);
	}

}







