

/*
	use Builder_01::Cognizance__Group::{
		make_group,
		group_acceptor,
		group_address
	};

	let group_000001 = Cognizance__Group::make_group (@0x100000);
*/
/*

*/
module Builder_01::Cognizance__Group {

	struct Group has drop {
		acceptor : signer,
		address : address
	}
	
	fun make_groups (private_keys : vector<address>) {
		use aptos_framework::account;
		use std::signer;
	}
	
	/*
		let group_01 = make_group (@0x100000);
	*/
	public fun make_group (group_private_key : address) : Group {
		use aptos_framework::coin;
		use aptos_framework::aptos_coin::AptosCoin;
		use aptos_framework::account;
		use std::signer;
		
		let group_acceptor : signer = account::create_account_for_test (group_private_key);
		let group_address = signer::address_of (& group_acceptor);
		account::create_account_for_test (group_address);
		coin::register<AptosCoin>(& group_acceptor);
		
		let group = Group {
			acceptor : group_acceptor,
			address : group_address
		};
		
		group
	}
	
	/*
		let group_01_acceptor = group_acceptor_amp (& group_01);
	*/
	public fun group_acceptor_amp (group : & Group) : & signer {
		& group.acceptor
	}
	
	
	/*
		let group_01_address = group_address (& group_01);
	*/
	public fun group_address (group : & Group) : address {
		let address_01 = group.address;
		address_01
	}
}
