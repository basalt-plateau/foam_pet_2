




module ride_1::Lots {
	
	use std::string::{ utf8, String };
	use std::vector;
	use std::signer;
	

	struct Estate has key {
        address: address,
		is_novelist: String
    }

	#[view]
	public fun novelist () : address {
		let novelist_spot : address = @0x2f75da076414103c721d195b0376c66897593b1f4e961671099a2dc9a24adcfd;
		novelist_spot
	}
	
	#[view]
	public fun is_novestlist (estate_address : address) : String {
		/*
		if (estate_address == novelist ()) {
			return utf8 (b"yeah")
		};
		
		utf8 (b"no")
		*/
		
		utf8 (b"yeah")
	}
	

	
	public entry fun save_estate_address (estate_flourisher : & signer) {
		let estate_address = signer::address_of (estate_flourisher);
		
		let le_estate = Estate {
			address : estate_address,
			is_novelist: is_novestlist (estate_address)
		};
		
		move_to (estate_flourisher, le_estate);
	}
	
	
	
	
	
}