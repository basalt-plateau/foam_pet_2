


module ride_1::Merci_Sketches {
	
	use std::string::{ utf8, String };
	use std::vector;
	use std::signer;
	
	struct Data has copy, drop {
        value: u64,
        message: String
    }
	
	

	/*
aptos move view \
--function-id 0x2f75da076414103c721d195b0376c66897593b1f4e961671099a2dc9a24adcfd::Merci_Sketches::return_bracket
	*/
	#[view]
	public fun return_bracket () : vector<Data> {
		let data_vec = vector::empty<Data>();

        let data1 = Data { value: 1, message: utf8 (b"1st") };
        let data2 = Data { value: 2, message: utf8 (b"2nd") };

        vector::push_back (&mut data_vec, data1);
        vector::push_back (&mut data_vec, data2);

        data_vec
	}
	
	
	struct Estate has key {
        address: address
    }
	public entry fun save_estate_address (estate_flourisher : & signer) {
		let le_estate = Estate {
			address : signer::address_of (estate_flourisher)
		};
		
		move_to (estate_flourisher, le_estate);
	}
	
	
	#[view]
	public fun search_novelist_spot () : address {
		let novelist_spot : address = @0x2f75da076414103c721d195b0376c66897593b1f4e961671099a2dc9a24adcfd;
		novelist_spot
	}
	
	#[view]
	public fun is_novestlist (estate_address : address) : String acquires Estate {
		let le_estate = borrow_global<Estate>(estate_address);
		if (le_estate.address == search_novelist_spot ()) {
			return utf8 (b"yeah")
		};
		
		utf8 (b"no")
	}
	
}