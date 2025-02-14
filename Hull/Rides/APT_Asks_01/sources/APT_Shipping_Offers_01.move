




module Ride_01::APT_Asks_01 {
	#[view] public fun Volitions () : String { use Ride_01::Rules_10; Rules_10::Volitions_01 () }

	use std::vector;
	use std::string::{ String, utf8 };
	use std::signer;

	struct APT_Ask has store, drop {
		amount_octas: u64,
		
		origin_address: address,
		destination_address: address,
		
		// "asked", "caught"
		status: String
	}
	
	/*
		This belongs to each person.
	*/
	struct APT_Asks has key, drop {
		imports : vector <Catch> 
	}
	
	public entry fun ask_to_catch (
		consenter : & signer
	) {
		let imports = imports {
			imports : vector::empty<Catch>()
		};
		
		move_to<imports>(consenter, imports)
	}
	
	public entry fun ask_for_APT_Import (
		consenter : & signer,
		amount_octas : u64,
		origin_address : address
	) {
		let consenter_address = signer::address_of (consenter);
		
		let imports = imports {
			imports : vector::empty<Catch>()
		};
		
		let catch = Catch {
			amount_octas : amount_octas,
			thrower_address: thrower_address,
			catcher_address: catcher_address,
			status: utf8 (b"asked")
		};
		
		move_to<imports>(consenter, imports)
	}
}