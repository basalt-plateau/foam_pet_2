


/*
	Chill, Benevolence, Empathy, Altruism, Devotion
	Desk, Bureau
	Vacation, Hobby, 
	Vocation, Career
	Opportunity, Privilege 
	Relationship
	Glamour, Duende, Enchantment, Juju, Irresistibility, Aura
	Reputation, Position, Lobby
	Joke, Confidence
	Permission Slip, [Ticket], License, Passport, Permit
	Harvest
	Essence, 
	Objective, Purpose, Motivation, Navigation
	Business, Franchise, Party, Group, Team
	Show
	Persona, Character
	Venue, Plot
	Boat, Ship
	Account
	Bracelet, Amulet
*/
module Builder_01::Module_Guest_Show {
	friend Builder_01::Module_Hulls;
	
	use std::vector;
	use std::string::{ String };

	#[view] public fun Volitions () : String { 
		use Builder_01::Rules_Module; Rules_Module::Volitions_01 () 
	}




	struct Guest_Show has store, drop {
		address : address
	}
	friend fun create_guest_show (guest_address : address) : Guest_Show {
		let guest_show = Guest_Show {
			address : guest_address
		};
		guest_show
	}
	



	struct Guest_Shows has store, drop {
		shows : vector<Guest_Show>
	}
	friend fun create_guest_shows () : Guest_Shows {
		let guest_shows = Guest_Shows {
			shows : vector::empty<Guest_Show>()
		};
		guest_shows
	}
	friend fun ensure_guest_exists (
		guest_address : address,
		guest_shows : Guest_Shows
	) {
		let shows_leaps = vector::length (& guest_shows.shows);
		for (index in 0..shows_leaps) {
			let amp_show = vector::borrow (& guest_shows.shows, index);
			if (amp_show.address == guest_address) {
				return;
			};
		};		
		
		abort 0xE000000;
	}

	
	
	
	
}