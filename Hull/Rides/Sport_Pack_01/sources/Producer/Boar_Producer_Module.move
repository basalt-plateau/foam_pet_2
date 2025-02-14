


/*
	Boar_Producer:
		
		
	Fonctions:
		position
		ask_if_consenter_is_Boar_Producer
		ask_if_address_is_Boar_Producer
*/
module builder_1::Boar_Producer_Module {	
	friend builder_1::Boar_Game_Module;
	
	use std::string::{ String, utf8 };
	use std::signer;
	
	use aptos_framework::chain_id;
	
	#[view] public fun Volitions () : String { 
		use ride::Rules_10;
		Rules_10::Volitions_01 () 
	}
	
	
	#[view] public fun boar_Producer_position () : address {
		//
		//	Petra:  f5565cc1d71781d6ef766a2a50ed459b9d3b430ceb6f7bbf79393c3626a979cd
		//
		//	Foam 1: 652b8d45aebc4237cb4a4ca1d8b99725d8f973676844fe85eb09286d7f9d3808
		//	Foam 2: af545705ec7dbc1630376fd22313c973e5e8a4edd51343a1ddd05353e72fd5bf
		//
		//	Open 1: 2F75DA076414103C721D195B0376C66897593B1F4E961671099A2DC9A24ADCFD
		//
		
		let board_id : u8 = chain_id::get ();
		if (board_id == 1) {
			return @0x652b8d45aebc4237cb4a4ca1d8b99725d8f973676844fe85eb09286d7f9d3808
		};
		
		let position : address = @0x2F75DA076414103C721D195B0376C66897593B1F4E961671099A2DC9A24ADCFD;
		position
	}
	public fun ask_if_consenter_is_Boar_Producer (consenter : & signer) : String {
		if (signer::address_of (consenter) == boar_Producer_position ()) {
			return utf8 (b"yup")
		};
		
		utf8 (b"no")
	}
	#[view] public fun ask_if_address_is_Boar_Producer (address_1 : address) : String {
		if (address_1 == boar_Producer_position ()) {
			return utf8 (b"yup")
		};
		
		utf8 (b"no")
	}
}