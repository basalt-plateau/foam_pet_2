

module ride_1::Merci_Tienda {
	
	use std::signer;
	use std::vector;
	
	use aptos_std::table::{ Self, Table };
	
	use aptos_framework::coin::{ Self, Coin, CoinStore };	
	
	
	/*
		Mercy Sale {
			address : address
			mercy_for_sale: u256,
			octas_price: u64
		}
		
		APT Sale {
			address : address
			APT_for_sale: Coin<AptosCoin>,
			mercy_price: u256
		}
		
		possibly:
			expiration
	*/
	struct Mercy_Sale has store {
		address : address,
		mercy_for_sale: u256,
		octas_price: u64
	}
	
	
	/*
		address, Mercy_Sale
		octas_price, Mercy_Sale
	*/
	struct Mercy_Sales has key {
		addresses : Table<address, Mercy_Sale>,
		octas_price : Table<u64, Mercy_Sale>		
	}
	

	// apt_sales : table<address, Coin<AptosCoin>, u256>
	// aptos_coins : Coin<AptosCoin>
	
	
	public entry fun Establish_Sales (estate_flourisher : & signer)  {
		let mercy_sales = Mercy_Sales {
            addresses : table::new<address, Mercy_Sale>(),
			octas_price: table::new<u64, Mercy_Sale>()
        };
		
		move_to (estate_flourisher, mercy_sales);
	}
	
	
	public entry fun List_Mercy_for_Sale (
		vendor_flourisher : & signer,
		mercy_for_sale : u256,
		octas_price : u64
	) acquires Mercy_Sales {
		let vendor_spot = signer::address_of (vendor_flourisher);
		let mercy_sales = borrow_global_mut<Mercy_Sales>(vendor_spot);
		
		let mercy_sale = Mercy_Sale {
            address : vendor_spot,
			mercy_for_sale: mercy_for_sale,
			octas_price : octas_price
        };
		
		table::add (&mut mercy_sales.addresses, vendor_spot, mercy_sale);
	}
	
	
	/*
	use std::signer;
	
	public entry fun Buy_Mercy (
		estate_flourisher : & signer,
		mercy_to_buy : u256,
		octas_price : u256
	)  {
		
		
		
	}
	*/
	
	public entry fun Sell_Mercy (
		estate_flourisher : & signer,
		mercy_to_sell : u256,
		octas_price : u256
	)  {
		
		
		
	}
}