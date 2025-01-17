


module Ride_01::APT_Catches_01 {
	#[view] public fun Volitions () : String { use Ride_01::Rules_10; Rules_10::Volitions_01 () }

	use std::vector;
	use std::string::{ String, utf8 };
	use std::signer;
	
	/*
		Wishes {
			amount_octas: u64,
			to_address: 
			client_address: address
		}
	*/
	struct Catch has store, drop {
		amount_octas: u64,
		thrower_address: address,
		catcher_address: address,
		
		// "asked", "caught"
		status: String
	}
	
	struct APT_Catch_Asks has key, drop {
		catches : vector <Catch> 
	}
	
	
	public entry fun ask_to_catch (
		consenter : & signer
	) {
		let catches = Catches {
			catches : vector::empty<Catch>()
		};
		
		move_to<Catches>(consenter, catches)
	}
	
	public entry fun ask_for_pass (
		consenter : & signer,
		amount_octas : u64,
		thrower_address : address,
		catcher_address : address
	) {
		let catches = Catches {
			catches : vector::empty<Catch>()
		};
		
		let catch = Catch {
			amount_octas : amount_octas,
			thrower_address: thrower_address,
			catcher_address: catcher_address,
			status: utf8 (b"asked")
		};
		
		move_to<Catches>(consenter, catches)
	}
}