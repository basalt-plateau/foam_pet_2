

module ride_1::Merci_Tienda {
	
	use std::signer;
	use std::vector;

	use aptos_framework::coin::{ Coin };
	use aptos_framework::aptos_coin::{ AptosCoin };
	
	// use aptos_framework::coin::{ Self, Coin, CoinStore };
	// use aptos_framework::aptos_coin::{ AptosCoin, Self };
	
 
	
	/*	
		possibly:
			expiration
	*/
	struct Advertisement_for_Volition has store, drop {
		advertiser_spot : address,
		mercy_for_sale: u256,
		octas_price: u64
	}
	
	
	
	
	struct Octas_Advertisement has store {
		advertiser_spot : address,
		APT_for_sale: Coin<AptosCoin>,
		mercy_price: u256
	}
	
	
	/*
		address, 
		Advertisement_for_Volition
		octas_price, 
		Advertisement_for_Volition
	*/
	struct Mall has key {
		mercy_advertisements : vector<Advertisement_for_Volition>,
		octas_advertisements : vector<Octas_Advertisement>		
	}
	

	
	// Advertise_Volition
	
	public entry fun Establish_Mall (mall_flourisher : & signer)  {
		let mall_1 = Mall {
            mercy_advertisements: vector::empty<Advertisement_for_Volition>(),
			octas_advertisements: vector::empty<Octas_Advertisement>()
        };
		
		move_to (mall_flourisher, mall_1);
	}
	
	
	public entry fun Advertise_Volition (
		mall_spot : address,
		
		advertiser_flourisher : & signer,
		mercy_for_sale : u256,
		octas_price : u64
	) acquires Mall {
		let advertiser_spot = signer::address_of (advertiser_flourisher);
		let sales = borrow_global_mut<Mall>(mall_spot);
		
		let mercy_advert = Advertisement_for_Volition {
            advertiser_spot : advertiser_spot,
			mercy_for_sale: mercy_for_sale,
			octas_price : octas_price
        };
		
		vector::push_back (&mut sales.mercy_advertisements, mercy_advert);
	}
	
	#[view]
	public fun amount_of_mercy_advertisements (
		mall_spot : address,
	) : u64 acquires Mall {
		let mall = borrow_global<Mall>(mall_spot);
		let size = vector::length (& mall.mercy_advertisements);
		size
	}
	
	/*
	public entry fun number_of_sales (
		mall_spot : address,
		kind : String
	) {
		let mall = borrow_global<Mall>(mall_spot);
		
		if (kind == utf8 (b"mercy")) {
			let size = vector::length (& mall.mercy_advertisements);
			return size;
		};
		
		abort 1; 
	}
	*/
	
	

	
	public entry fun Obtain_Volition (
		obtainer : & signer,	
	
		mall_spot : address,
		
		advertiser_spot : address,
		mercy_for_sale : u256,
		octas_price : u64
	) acquires Mall {
		let mall = borrow_global_mut<Mall>(mall_spot);
		
		let advertisements_count = vector::length (& mall.mercy_advertisements);
		
		for (index_1 in 0..advertisements_count) {
			let mercy_advert = vector::borrow_mut (&mut mall.mercy_advertisements, index_1);
			
			if (mercy_advert.octas_price == octas_price) {
				if (mercy_advert.mercy_for_sale == mercy_for_sale) {
					if (mercy_advert.advertiser_spot == advertiser_spot) {
						/*
							
							Moves:
								* Withdraw mercy from advertiser.
								* Deposit mercy to obtainer.
								
								* Withdraw octas from obtainer.
								* Deposit octas to advertiser.
						*/
						// Merci_Harvest::Send_Volition (& estate_1_flourisher, estate_2_spot, mercy_to_send);
						

						/*
							
						*/
						
						
						vector::remove (&mut mall.mercy_advertisements, index_1);						
					};
				};
			};
		}
	}
	

	public entry fun Advertise_Octas () {}
}