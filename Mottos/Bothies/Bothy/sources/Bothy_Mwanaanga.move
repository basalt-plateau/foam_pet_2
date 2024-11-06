




module ride::Bothy_Mwanaanga {
	use std::vector;
	use std::string::{ Self, String, utf8 };
	use std::signer;
	use std::debug;
	
	use ride::Loft;
	use ride::Bothy_Thermoplastic;

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
	
	
};