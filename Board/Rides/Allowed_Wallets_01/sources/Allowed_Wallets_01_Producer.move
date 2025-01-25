


module Publisher_01::Allowed_Wallets_01_Producer {
	#[view] public fun Volitions () : String { use Publisher_01::Rules_10; Rules_10::Volitions_01 () }
	
	// use std::vector;
	use std::string::{ String, utf8 };
	use std::signer;
	
	use aptos_framework::chain_id;
	
	const Consenter_must_be_the_producer : u64 = 100001;
	
	#[view] public fun ask_for_address () : address {
		//
		//	Petra:  f5565cc1d71781d6ef766a2a50ed459b9d3b430ceb6f7bbf79393c3626a979cd
		//
		//	Bourgeoisie 1: 652b8d45aebc4237cb4a4ca1d8b99725d8f973676844fe85eb09286d7f9d3808
		//	Bourgeoisie 2: af545705ec7dbc1630376fd22313c973e5e8a4edd51343a1ddd05353e72fd5bf
		//
		//	Open 1: 2F75DA076414103C721D195B0376C66897593B1F4E961671099A2DC9A24ADCFD
		//
		let board_id : u8 = chain_id::get ();
		if (board_id == 1) {
			return @0x652b8d45aebc4237cb4a4ca1d8b99725d8f973676844fe85eb09286d7f9d3808
		}
		else if (board_id == 2) {
			abort 1
		}
		else {
			return @0xf5565cc1d71781d6ef766a2a50ed459b9d3b430ceb6f7bbf79393c3626a979cd
		}
	}
	public fun ensure_consenter_is_producer (consenter : & signer) {
		if (signer::address_of (consenter) != ask_for_address ()) {
			abort Consenter_must_be_the_producer
		};
	}
	public fun ask_if_consenter_is_producer (consenter : & signer) : String {
		if (signer::address_of (consenter) == ask_for_address ()) {
			return utf8 (b"yup")
		};
		
		utf8 (b"no")
	}
	#[view] public fun ask_if_address_is_producer (address_1 : address) : String {
		if (address_1 == ask_for_address ()) {
			return utf8 (b"yup")
		};
		
		utf8 (b"no")
	}
	
	#[test (
		aptos_framework_consenter = @0x1,
		producer_01_consenter = @0x652b8d45aebc4237cb4a4ca1d8b99725d8f973676844fe85eb09286d7f9d3808
	)]
	public fun steady (
		aptos_framework_consenter: & signer,
		producer_01_consenter : & signer
	) {
		chain_id::initialize_for_test (aptos_framework_consenter, 1);
		let producer_address = signer::address_of (producer_01_consenter);
		
		assert! (ask_if_address_is_producer (producer_address) == utf8 (b"yup"), 1);
		assert! (ask_if_consenter_is_producer (producer_01_consenter) == utf8 (b"yup"), 1);
	}
}