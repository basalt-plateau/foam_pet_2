

module ride_1::Merci_Tienda {
	
	use std::signer;
	use std::vector;
	
	use aptos_std::table::{ Self, Table };

	use aptos_framework::coin::{ Coin };
	use aptos_framework::aptos_coin::{ AptosCoin };
	
	// use aptos_framework::coin::{ Self, Coin, CoinStore };
	// use aptos_framework::aptos_coin::{ AptosCoin, Self };
	
	/*	
		possibly:
			expiration
	*/
	struct Mercy_Sale has store {
		advertiser_spot : address,
		mercy_for_sale: u256,
		octas_price: u64
	}
	
	struct Octas_Sale has store {
		advertiser_spot : address,
		APT_for_sale: Coin<AptosCoin>,
		mercy_price: u256
	}
	
	
	/*
		address, 
		Mercy_Sale
		octas_price, 
		Mercy_Sale
	*/
	struct Sales has key {
		mercy_sales : vector<Mercy_Sale>,
		octas_sales : vector<Octas_Sale>		
	}
	
	
	// Advertise_Mercy
	
	public entry fun Establish_Sales (mall_flourisher : & signer)  {
		let sales = Sales {
            mercy_sales: vector::empty<Mercy_Sale>(),
			octas_sales: vector::empty<Octas_Sale>()
        };
		
		move_to (mall_flourisher, sales);
	}
	
	
	public entry fun Advertise_Mercy (
		mall_spot : address,
		
		advertiser_flourisher : & signer,
		mercy_for_sale : u256,
		octas_price : u64
	) acquires Sales {
		let advertiser_spot = signer::address_of (advertiser_flourisher);
		let sales = borrow_global_mut<Sales>(mall_spot);
		
		let mercy_sale = Mercy_Sale {
            advertiser_spot : advertiser_spot,
			mercy_for_sale: mercy_for_sale,
			octas_price : octas_price
        };
		
		vector::push_back (&mut sales.mercy_sales, mercy_sale);
	}

	public entry fun Advertise_Octas () {}
}