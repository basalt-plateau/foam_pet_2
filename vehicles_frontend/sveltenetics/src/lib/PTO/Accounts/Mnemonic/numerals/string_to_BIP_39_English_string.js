

/*
	import {
		mnemonic_numerals_string_to_BIP_39_English_string
	} from "$lib/PTO/Accounts/Mnemonic/numerals/string_to_BIP_39_English_string.js"
	const mnemonic_BIP_39_English = mnemonic_numerals_string_to_BIP_39_English_string (mnemonic_numerals_string)
*/


import * as bip39 from '@scure/bip39';
import { wordlist } from '@scure/bip39/wordlists/english';

export const mnemonic_numerals_string_to_BIP_39_English_string = (mnemonic_numerals_string) => {
	return mnemonic_numerals_string.split (" ").map (numeral => { return wordlist [ numeral - 1 ] }).join (" ");
}