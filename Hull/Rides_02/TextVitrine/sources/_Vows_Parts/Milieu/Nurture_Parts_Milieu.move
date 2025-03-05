

module Builder_01::Nurture__Milieu {

	
	/*
		let (milieu_01_address, milieu_01_acceptance) = Builder_01::Nurture__Milieu::Embark (@0x100000);
	*/
	#[test_only]
	public fun Embark (private_key : address) : (address, signer) {
		use aptos_framework::coin;
		use aptos_framework::aptos_coin::AptosCoin;
		use aptos_framework::account;
		use std::signer;
		
		let acceptance_from_milieu : signer = account::create_account_for_test (private_key);
		let address_of_milieu = signer::address_of (& acceptance_from_milieu);
		account::create_account_for_test (address_of_milieu);
		coin::register<AptosCoin>(& acceptance_from_milieu);
		
		(address_of_milieu, acceptance_from_milieu)
	}

}
