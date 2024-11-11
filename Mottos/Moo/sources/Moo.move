

module ride::Moo {

	use std::string::{ String };
	use ride::Loft;

	#[view]
	public fun togetherness () : String {
		let togetherness = Loft::togetherness_1 ();
		togetherness
	}
	
	
	struct Pastures has key {
		token_data_id: TokenDataId,
	}
}





