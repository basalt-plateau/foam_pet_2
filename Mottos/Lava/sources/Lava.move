


module ride::Lava {

	use std::option::{Self, Option};
	 
	use aptos_token_objects::collection;
	 
	public entry fun create_collection (estate_1: & signer) {
		let max_supply = 900;
		let royalty = option::none ();
	 
		collection::create_fixed_collection (
			estate_1,
			"Accounts that aren't clones, reflections, or abstractions of self.",
			max_supply,
			"Pets!",
			royalty,
			"https://foam.pet"
		);
	}
	
}