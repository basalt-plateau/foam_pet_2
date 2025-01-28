
import {
	mnemonic_numerals_string_to_BIP_39_English_string
} from "./../numerals/string_to_BIP_39_English_string.js"
import { create_account_from_mnemonic } from "./../create_account.js"

export const build_tickets = async ({
	mnemonic_numerals
}) => {
	console.info ({ mnemonic_numerals });
	
	const mnemonic_BIP_39_English_string = mnemonic_numerals_string_to_BIP_39_English_string (mnemonic_numerals)
	
	const accounts = {}
	const public_accounts = {}
	
	let le_account = 0;
	let le_change = 0;
	let le_address_index = 0;
	
	// SECP_256k1
	// EEC_25519
	let le_scheme = "EEC_25519";
	
	while (le_account <= 9) {
		const EEC_derivation_path = (
			`m/44'/637'/` + 
			le_account.toString () + 
			"'/" +
			le_change.toString() +
			"'/" +
			le_address_index.toString () +
			"'"
		);
		
		const {
			private_key_hexadecimal_string,
			public_key_hexadecimal_string,
			legacy_address_hexadecimal_string,
			pristine_address_hexadecimal_string
		} = await create_account_from_mnemonic ({
			derivation_path: EEC_derivation_path,
			scheme: le_scheme,
			mnemonic: mnemonic_BIP_39_English_string
		});
		
		const label = "Harvest " + le_account.toString ();
		
		accounts [ label ] = {
			"derivation path": EEC_derivation_path,
			"private key": private_key_hexadecimal_string,
			"public key": public_key_hexadecimal_string,
			"address legacy": legacy_address_hexadecimal_string,
			"address": pristine_address_hexadecimal_string
		};
		
		public_accounts [ label ] = {
			"derivation path": EEC_derivation_path,
			"public key": public_key_hexadecimal_string,
			"address legacy": legacy_address_hexadecimal_string,
			"address": pristine_address_hexadecimal_string
		}
		
		le_account++;
	};
	
	return {
		wealth: {
			"Aptos Single Key Mnemonic": {
				"Format": "EEC 25519",
				
				"Mnemonic": {
					"Numerals": mnemonic_numerals,
					"BIP 39 English Phrase": mnemonic_BIP_39_English_string
				},
				
				"Harvests": accounts
			}
		},
		boast: {
			"Aptos Single Key Mnemonic": {
				"Format": "EEC 25519",
				"Harvests": public_accounts
			}
		}
	}
};

