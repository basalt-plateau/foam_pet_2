


import * as bip39 from '@scure/bip39';
import { wordlist } from '@scure/bip39/wordlists/english';
//
import * as AptosSDK from "@aptos-labs/ts-sdk";	
//
//

import { Account_from_private_key } from '$lib/PTO/Accounts/from_private_key'
import { string_from_Uint8Array } from '$lib/taverns/hexadecimal/string_from_Uint8Array'

/*
	"m/44'/637'/0'/0'/0'"
*/
/*
	Locking Mechanism:
		* Seed Phrase:
			* BIP 39 English Wordlist
			* Path: m/44'/637'/0'/0'/0'
			* Elliptic Algorithm: EEC 25519
*/
export const create_account_from_mnemonic = async ({
	derivation_path,
	scheme,
	mnemonic
}) => {
	const schemes = {
		EEC_25519: AptosSDK.SigningSchemeInput.Ed25519,
		SECP_256k1: AptosSDK.SigningSchemeInput.Secp256k1Ecdsa
	}
	
	const _mnemonic = mnemonic.split (" ");
	for (let i1 = 0; i1 < _mnemonic.length; i1++) {
		if (wordlist.includes (_mnemonic [i1]) !== true) {
			throw new Error (`${ _mnemonic [i1] } was not found.`);
		}
	}
	
	console.log ({ wordlist });
	
	const account = AptosSDK.Account.fromDerivationPath ({
		path: derivation_path,
		mnemonic,
		scheme: schemes [ scheme ],
		
		// irrelevantish
		// this is for address, not private key...
		legacy: true
	});
	
	const retrieve_private_key = () => {
		if (scheme == "SECP_256k1") {
			// console.log (account.privateKey.key.data);
			return string_from_Uint8Array (account.privateKey.key.data);
		}
		
		if (scheme == "EEC_25519") {
			return string_from_Uint8Array (account.privateKey.signingKey.data);
		}
		
		throw new Error ("...");
	}
	
	const retrieve_public_key = () => {
		if (scheme == "SECP_256k1") {
			// console.log (account.publicKey.publicKey.key);
			return string_from_Uint8Array (account.publicKey.publicKey.key.data);
		}
		
		if (scheme == "EEC_25519") {
			// console.log (account.publicKey.key.data);
			return string_from_Uint8Array (account.publicKey.key.data);
		}
		
		throw new Error ("...");
	}
	
	const ask_for_address = () => {
		
		if (scheme == "EEC_25519") {
			// console.log (account.publicKey.key.data);
			return string_from_Uint8Array (account.accountAddress.data);
		}
		
		throw new Error ("...");
	}

	 console.log ({ account });
	
	const private_key_hexadecimal_string = retrieve_private_key ();
	const public_key_hexadecimal_string = retrieve_public_key ();
	const address_hexadecimal_string = ask_for_address ();
	
	console.log ({ 
		private_key_hexadecimal_string, 
		public_key_hexadecimal_string,
		address_hexadecimal_string
	});
	
	/*
	const {
		pristine_account,
		legacy_account,
		
		public_key_hexadecimal_string,	

		pristine_address_hexadecimal_string,
		legacy_address_hexadecimal_string,
	} = await Account_from_private_key ({
		private_key_hexadecimal_string
	});
	*/

	return {
		private_key_hexadecimal_string,
		public_key_hexadecimal_string
	}
}