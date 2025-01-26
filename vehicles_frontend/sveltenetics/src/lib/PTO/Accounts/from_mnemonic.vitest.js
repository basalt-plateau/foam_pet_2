

/*
	(cd /Metro/vehicles_frontend/sveltenetics && pnpm vitest "lib/PTO/Accounts/from_mnemonic.vitest.js")
*/

import { describe, it, expect } from 'vitest';
import assert from 'assert'

import * as AptosSDK from "@aptos-labs/ts-sdk";

import { create_account_from_mnemonic } from '$lib/PTO/Accounts/from_mnemonic'

import { string_from_Uint8Array } from '$lib/taverns/hexadecimal/string_from_Uint8Array'
import { Uint8Array_from_string } from '$lib/taverns/hexadecimal/Uint8Array_from_string'

import * as bip39 from '@scure/bip39';
import { wordlist } from '@scure/bip39/wordlists/english';
import { Account_from_private_key } from '$lib/PTO/Accounts/from_private_key'
	
export const wallet = {
	address: "0x07968dab936c1bad187c60ce4082f307d030d780e91e694ae03aef16aba73f30",
	mnemonic: "shoot island position soft burden budget tooth cruel issue economy destroy above",
	path: "m/44'/637'/0'/0'/0'",
	privateKey: "ed25519-priv-0x5d996aa76b3212142792d9130796cd2e11e3c445a93118c08414df4f66bc60ec",
	publicKey: "0xea526ba1710343d953461ff68641f1b7df5f23b9042ffa2d2a798d3adb3f3d6c"
};

export const Ed25519WalletTestObject = {
	address: "0x28b829b524d7c24aa7fd8916573c814df766dae542f724e1cf8914536232c346",
	mnemonic: "shoot island position soft burden budget tooth cruel issue economy destroy above",
	path: "m/44'/637'/0'/0'/0'",
	privateKey: "ed25519-priv-0x5d996aa76b3212142792d9130796cd2e11e3c445a93118c08414df4f66bc60ec",
	publicKey: "0xea526ba1710343d953461ff68641f1b7df5f23b9042ffa2d2a798d3adb3f3d6c"
};

export const secp256k1WalletTestObject = {
	address: "0x4b4aa8759fcef40ba49e999409eb73a98252f44f6612a4de2b23bad5c37b15a6",
	mnemonic: "shoot island position soft burden budget tooth cruel issue economy destroy above",
	path: "m/44'/637'/0'/0/0",
	privateKey: "secp256k1-priv-0x1eec55afc2f72c4ab7b46c84d761739035ac420a2b6b22cef3411adaf91ce1f7",
	publicKey:
	"0x04913871f1d6cb7b867e8671cf63cf7b4c43819539fa0074ff933434bf20bab825b335535251f720fff72fd8b567e414af84aacf2f26ec804562081f2e0b0c9478",
};


/*
	Locking Mechanism:
		* Seed Phrase:
			* BIP 39 English Wordlist
			* Path: m/44'/637'/0'/0'/0'
			* Elliptic Algorithm: EEC 25519
*/
describe ('from_mnemonic', () => {
	describe ("legacy", () => {
		it ('1', async () => {
			
			// const derivation_path = "m/44'/637'/0'/0'/0'";
			
			const mnemonic = "nation sorry clock vacant whisper visual art topic scene where decade sweet excess usage tuna close search behind theory barely sorry guitar badge frame";
			
			const search_for_public_key = "C65B24FF1FE0F0DC23333912BE4BB4D921A93CDF113744BD7BE56031A23AAFEC";
			const search_for_address = "886CF9F5F098372D5602EE9603DF2662B33753A464C45342990A698F677F5194";
			
			let le_account = 0;
			let le_change = 0;
			let le_address_index = 0;
			
			
			// SECP_256k1
			// EEC_25519
			let le_scheme = "EEC_25519";
			
			
			
			while (le_account <= 10) {
				le_change = 0;
				
				while (le_change <= 0) {
					le_address_index = 0;
					
					while (le_address_index <= 0) {
						
						// const EEC_derivation_path = `m/44'/637'/${ le_account }'/${ le_change }'/${ address_index }'";
						const EEC_derivation_path = (
							`m/44'/637'/` + 
							le_account.toString () + 
							"'/" +
							le_change.toString() +
							"'/" +
							le_address_index.toString () +
							"'"
						);
						
						const SECP_derivation_path = (
							`m/44'/637'/` + 
							le_account.toString () + 
							"'/" +
							le_change.toString() +
							"/" +
							le_address_index.toString () +
							""
						);
						
						// console.log ({ EEC_derivation_path });
						
						const {
							private_key_hexadecimal_string,
							public_key_hexadecimal_string,
							address_hexadecimal_string
						} = await create_account_from_mnemonic ({
							derivation_path: EEC_derivation_path,
							scheme: le_scheme,
							mnemonic
						});
						
						if (public_key_hexadecimal_string === search_for_public_key) {
							throw new Error ("Trophy!");
						}
						
						if (address_hexadecimal_string === search_for_address) {
							throw new Error ("Trophy!");
						}
						
						le_address_index++;
					}
					
					le_change++;
				}
				
				le_account++;
			}
			
			return;
			
			// m / purpose' / coin_type' / account' / change / address_index
			
			
			// EEC 25519 Derivation Pathz
			const derivation_path      = "m/44'/637'/0'/0'/0'";
			const secp_derivation_path = "m/44'/637'/0'/0/0"
			
			// const derivation_path = "m/44'/60'/0'/0'/0'";
			// const derivation_path = "m/44'/60'/0'/0/0";

			

			
			
			/*
				Public Keys
					C65B24FF1FE0F0DC23333912BE4BB4D921A93CDF113744BD7BE56031A23AAFEC
			*/
			
			const addresses = [
				"886cf9f5f098372d5602ee9603df2662b33753a464c45342990a698f677f5194",
				"9d633956b1bc319a194d21373ec30fdc5959b702122757303506afb9e95cb7c1",
				"af3f75e855eceffc6e5713e4de4ea41c327d747dd9a30939b89f5b4c440ca328"
			]
			
			/*
				0DC...69C
				220...E9A
				31E...6C5
				5BD...3B1
				725...731
				84D...06C
				886...194 	886cf9f5f098372d5602ee9603df2662b33753a464c45342990a698f677f5194
				954...6ED
				9D6...7C1
				AF3...328
			*/
			
			
			
			return;
			
			create_account_from_mnemonic ({
				
			});			
		});
	});
});
