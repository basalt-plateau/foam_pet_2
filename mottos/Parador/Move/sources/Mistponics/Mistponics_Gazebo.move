



module ride::Mistponics_Gazebo {
	use std::string::{ Self, String };
	use std::signer;
	
	use ride::Loft;
	
	const A_GAZEBO_WAS_NOT_SPOTTED : u64 = 0;
	
	#[view]
	public fun togetherness () : String {
		let togetherness = Loft::togetherness ();
		togetherness
	}
	
	
	////
	
	
	struct Gazebo has key, drop {
        allow_mistponics: String,
		estate_address: address
    }		
	
	#[view]
	public fun mistponics_status (
		estate_address: address
	) : String acquires Gazebo {
		if (estate_has_gazebo (estate_address) == string::utf8 (b"yes")) {
			let gazebo = borrow_global<Gazebo>(estate_address);
			if (gazebo.allow_mistponics == string::utf8 (b"yes")) {
				return string::utf8 (b"allowed")
			};
			
			return string::utf8 (b"denied")
		};
		
		string::utf8 (b"denied, the estate does not have a Gazebo.")		
	}
	
	
	public fun proceed_if_has_gazebo (estate_address: address) {
		if (exists<Gazebo>(estate_address) != true) {
			abort A_GAZEBO_WAS_NOT_SPOTTED
		};
	}
	
	
	#[view]
	public fun estate_has_gazebo (
		estate_address: address
	) : String acquires Gazebo {
		let gazebo = borrow_global<Gazebo>(estate_address);
		if (exists<Gazebo>(estate_address)) {
			return string::utf8 (b"yes")
		};
		
		string::utf8 (b"no")
	}
	
	
	
	public entry fun allow_mistponics (estate : & signer) acquires Gazebo {
		let estate_address = signer::address_of (estate);
		
		proceed_if_has_gazebo (estate_address);
		
		let gazebo = borrow_global_mut<Gazebo>(estate_address);
		gazebo.allow_mistponics = string::utf8 (b"yes")
	}
	
	public entry fun build_gazebo (
		estate : & signer
	) {
		let gazebo = Gazebo {
            allow_mistponics: string::utf8 (b"no"),
            estate_address: signer::address_of (estate)
        };
		
		move_to<Gazebo>(estate, gazebo);
	}
}