


module ride::Lava {


	use std::bcs;
    use std::error;
    use std::signer;
    use std::string::{Self, String, utf8};
    use std::vector;
	use std::option::{ Self, Option };

    use aptos_token::token;
    use aptos_token::token::TokenDataId;
	 
	use aptos_token_objects::collection;
	 
	struct ModuleData has key {
		token_data_id: TokenDataId,
	} 
	 
	public entry fun create_collection (estate_1 : & signer) {
		let max_supply : u64 = 2500;
		// let royalty = option::none ();
		
		let collection_name = string::utf8 (b"Pets!");
        let description = string::utf8 (b"Description");
        let collection_uri = string::utf8 (b"https://foam.pets");
        let token_name = string::utf8 (b"Token name");
        let token_uri = string::utf8 (b"Token uri");
		
		/*
			perhaps: max 0 -> supply isn't tracked
		*/
        let maximum_supply = 0;
		
		/*
			toggles for: allow changes to:
				* description
				* URI
				* maximum (limit)
		*/
        let mutate_setting = vector<bool>[ false, false, false ];


		/*
			create_collection:
				creator: &signer,
				name: String,
				description: String,
				uri: String,
				maximum: u64,
				mutate_setting: vector<bool>
		*/
		/*
        token::create_collection (
			estate_1, 
			collection_name, 
			description, 
			collection_uri, 
			maximum_supply, 
			mutate_setting
		);
		*/

		/*
			sends:
				account: & signer,
				collection: String,
					collection_name
				
				name: String,
					token_name
				
				description: String,
				maximum: u64,
				uri: String,
				
				royalty_payee_address: address,
				royalty_points_denominator: u64,
				royalty_points_numerator: u64,
				
				token_mutate_config: TokenMutabilityConfig,
				
				property_keys: vector<String>,
				property_values: vector<vector<u8>>,
				property_types: vector<String>
				
			receives:
				token data id
		*/
		
        let token_data_id = token::create_tokendata (
            estate_1,
            collection_name,
            token_name,
            string::utf8 (b""),
            max_supply,
            token_uri,
			
			
			//
			// royalties
            //
			//
			signer::address_of (estate_1),
            1,
            0,
			
			/*
				toggles for allow mutations to:
					token maximum, 
					uri, 
					royalty, 
					description, 
					properties
			*/
            token::create_token_mutability_config(
                &vector<bool>[ false, false, false, false, true ]
            ),
			
			/*
				property:
			*/
            // We can use property maps to record attributes related to the token.
            // In this example, we are using it to record the receiver's address.
            // We will mutate this field to record the user's address
            // when a user successfully mints a token in the `mint_nft()` function.
            vector<String>[string::utf8 (b"given_to")],
            vector<vector<u8>>[b""],
            vector<String>[ string::utf8 (b"address") ],
        );

        // Store the token data id within the module, so we can refer to it later
        // when we're minting the NFT and updating its property version.
        move_to (estate_1, ModuleData {
            token_data_id
        });
	}
	
}