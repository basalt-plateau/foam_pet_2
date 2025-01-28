

/*
	import {
		mnemonic_numerals_string_to_BIP_39_English_string
	} from "./string_to_BIP_39_English_string.js"
	const mnemonic_BIP_39_English = mnemonic_numerals_string_to_BIP_39_English_string (mnemonic_numerals_string)
*/


import * as bip39 from '@scure/bip39';
import { wordlist } from '@scure/bip39/wordlists/english';

export const mnemonic_numerals_string_to_BIP_39_English_string = (mnemonic_numerals_string) => {
	
	return mnemonic_numerals_string.split (" ").map (numeral => { return wordlist [ numeral - 1 ] }).join (" ");
	let mnemonic_BIP_39_English = "";
	
	for (let i1 = 0; i1 < mnemonic_numerals_array.length; i1++) {		
		if (wordlist.includes (_mnemonic [i1]) !== true) {
			throw new Error (`${ _mnemonic [i1] } was not found.`);
		}
		
		mnemonic_BIP_39_English += wordlist [ mnemonic_numerals_array [i1] ];
	}
	
	return mnemonic_BIP_39_English
}