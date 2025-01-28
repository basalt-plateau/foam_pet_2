

/*
	import { BIP_39_English_String_to_Numerals_String } from "./string_to_numerals_string.js"
	assert.equal (BIP_39_English_String_to_Numerals_String ("abandon "), []);
*/

/*
	import { search_for_word } from "./string_to_numerals_string.js"
	assert.equal (search_for_word ("abandon"), 1);
	assert.equal (search_for_word ("zoo"), 2048);
*/

import * as bip39 from '@scure/bip39';
import { wordlist } from '@scure/bip39/wordlists/english';

export const search_for_word = (word) => {
	for (let i1 = 0; i1 <= wordlist.length; i1++) {
		if (wordlist [ i1 ] === word) {
			return i1 + 1;
		}
	}
	
	throw new Error ("...");
}

export const BIP_39_English_String_to_Numerals_String = (BIP_39_English_String) => {
	return BIP_39_English_String.split (" ").map (word => {
		return search_for_word (word)
	}).join (" ");
}

