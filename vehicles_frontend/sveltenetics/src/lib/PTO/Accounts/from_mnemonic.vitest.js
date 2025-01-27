

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
			
			const accounts = []
			
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
					mnemonic
				});
				
				accounts.push ({
					private_key_hexadecimal_string,
					public_key_hexadecimal_string,
					legacy_address_hexadecimal_string,
					pristine_address_hexadecimal_string
				});
				
				le_account++;
			};		
			
			console.info ({ accounts });
			
			assert (accounts [0].legacy_address_hexadecimal_string === "886CF9F5F098372D5602EE9603DF2662B33753A464C45342990A698F677F5194");
			assert (accounts [1].legacy_address_hexadecimal_string === "9D633956B1BC319A194D21373EC30FDC5959B702122757303506AFB9E95CB7C1");
			assert (accounts [2].legacy_address_hexadecimal_string === "AF3F75E855ECEFFC6E5713E4DE4EA41C327D747DD9A30939B89F5B4C440CA328");
			assert (accounts [3].legacy_address_hexadecimal_string === "5BDF69D600956163925BD0158D7E5E9C790EDF45357DE31D417BF986864213B1");
			assert (accounts [4].legacy_address_hexadecimal_string === "84DBD0FD6B4D38B1FE55D64FB322FA569B16B6F18D479B45BBC832E93FF9806C");
			assert (accounts [5].legacy_address_hexadecimal_string === "0DC9C761BB318640574CC46484650854F840B5FB09C9020D79DB4E1E6CCF369C");
			assert (accounts [6].legacy_address_hexadecimal_string === "9544A4123CB199EB2C6857CDB7808F02AD46AA0758AD67E0A0523BEA7A3D76ED");
			assert (accounts [7].legacy_address_hexadecimal_string === "220FE0F05A47A7976B9A45A889B4C39A7B449F8A88E8A5642BAFAC1852723E9A");
			assert (accounts [8].legacy_address_hexadecimal_string === "725EB9A820FE93155A5EA5F77C7223FAC6B44DED140E03351848A7EE95731731");
			assert (accounts [9].legacy_address_hexadecimal_string === "31EBD615370754911E828FFB327BB25A565AFB80EF71D4B7563E7DE5DD5EE6C5");			
		});
	});
});
