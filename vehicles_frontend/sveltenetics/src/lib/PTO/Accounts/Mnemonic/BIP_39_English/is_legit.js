

/*
	import { BIP_39_English_String_is_legit_2 } from "$lib/PTO/Accounts/Mnemonic/BIP_39_English/is_legit.js"
	if (await BIP_39_English_String_is_legit_2 (BIP_39_English_String) !== "yup") {
		
	}
*/

import * as bip39 from '@scure/bip39';
import { wordlist as BIP_39_Word_List } from '@scure/bip39/wordlists/english';
import { sha256 } from 'js-sha256';

import _get from 'lodash/get'

import { search_for_word } from "./search_for_word.js"


export const BIP_39_English_String_is_legit_2 = async (BIP_39_English_String) => {
	try {
		return await BIP_39_English_String_is_legit (BIP_39_English_String);
	}
	catch (imperfection) {
		console.info ("🚨 BIP_39_English_String_is_legit_2 imperfection:", _get (imperfection, [ "message" ], ""));
	}
	
	return "no"
}


export const BIP_39_English_String_is_legit = async (BIP_39_English_String) => {
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
	
	const is_legit_mnemonic = bip39.validateMnemonic (BIP_39_English_String, BIP_39_Word_List);
    if (!is_legit_mnemonic) {
		throw new Error (`That is not a valid mnemonic.`);
    }
	
	return "yup"
}