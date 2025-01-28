

import * as bip39 from '@scure/bip39';
import { wordlist } from '@scure/bip39/wordlists/english';

import { search_for_word } from "./search_for_word.js"


export const BIP_39_English_String_is_legit = (BIP_39_English_String) => {
	if (typeof BIP_39_English_String !== "string") {
		throw new Error (`The English BIP 39 field isn't a string.`);
	}
	
	const BIP_39_English_String_Phrase = BIP_39_English_String.split (" ");
	if (BIP_39_English_String_Phrase.length != 24) {
		throw new Error (`Phrase "${ BIP_39_English_String }" isn't 24 words.`);
	}
	
	for (let i1 = 0; i1 <= BIP_39_English_String_Phrase.length; i1++) {
		search_for_word (BIP_39_English_String_Phrase [i1])
	}
	
	return "yup"
}