




/*

*/
module Builder_01::Producer_Module {	
	friend Builder_01::Hulls_Module;
	
	use std::string::{ String, utf8 };
	use std::signer;
	
	use aptos_framework::chain_id;
	
	const Imperfection_that_is_not_the_address_of_the_producer : u64 = 9;
	
	#[view] public fun Volitions () : String { 
		use Builder_01::Rules_Module;
		Rules_Module::Volitions_01 () 
	}
	
	
	#[view] public fun obtain_address () : address {
		//
		//	Petra:  f5565cc1d71781d6ef766a2a50ed459b9d3b430ceb6f7bbf79393c3626a979cd
		//
		//	Foam 1: 652b8d45aebc4237cb4a4ca1d8b99725d8f973676844fe85eb09286d7f9d3808
		//	Foam 2: af545705ec7dbc1630376fd22313c973e5e8a4edd51343a1ddd05353e72fd5bf
		//
		//	Bourgeoisie 1: 2F75DA076414103C721D195B0376C66897593B1F4E961671099A2DC9A24ADCFD
		//
		//	Keystone 1: FBE0B4ECA5928CC51E2A36EF25BC479CF24B22040B5571DD6D0A37283F99A240
		//	
		//
		if (chain_id::get () == 1) {
			return @0xFBE0B4ECA5928CC51E2A36EF25BC479CF24B22040B5571DD6D0A37283F99A240
		};
		if (chain_id::get () == 2) {
			return @0x2F75DA076414103C721D195B0376C66897593B1F4E961671099A2DC9A24ADCFD
		};
		
		let position : address = @0x2F75DA076414103C721D195B0376C66897593B1F4E961671099A2DC9A24ADCFD;
		position
	}
	public fun ensure_consenter_is_producer (consenter : & signer) {
		if (signer::address_of (consenter) != obtain_address ()) {
			abort Imperfection_that_is_not_the_address_of_the_producer
		}
	}
	public fun ask_if_consenter_is_producer (consenter : & signer) : String {
		if (signer::address_of (consenter) == obtain_address ()) {
			return utf8 (b"yup")
		};
		
		utf8 (b"no")
	}
	#[view] public fun ask_if_address_is_producer (address_1 : address) : String {
		if (address_1 == obtain_address ()) {
			return utf8 (b"yup")
		};
		
		utf8 (b"no")
	}
}