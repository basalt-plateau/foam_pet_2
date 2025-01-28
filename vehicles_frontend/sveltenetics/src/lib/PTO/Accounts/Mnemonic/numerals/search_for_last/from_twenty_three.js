


/*
	import {
		search_for_last_from_twenty_three
	} from "$lib/PTO/Accounts/Mnemonic/numerals/search_for_last/from_twenty_three.js"
	const legit_numerals = await search_for_last_from_twenty_three (
		"1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1"
	);
*/

import * as bip39 from '@scure/bip39';
import { wordlist as BIP_39_Word_List } from '@scure/bip39/wordlists/english';
import { sha256 } from 'js-sha256';

import {
	mnemonic_numerals_string_to_BIP_39_English_string
} from "$lib/PTO/Accounts/Mnemonic/numerals/string_to_BIP_39_English_string.js"



export const search_for_last_from_twenty_three = async (twenty_three) => {
	if (typeof twenty_three !== "string") {
		throw new Error (`That phrase isn't a string.`);
	}
	
	if (twenty_three.split (" ").length != 23) {
		throw new Error (`Phrase "${ twenty_three }" isn't 23 words.`);
	}
	
	let split_23 = twenty_three.split (" ");
	for (let i1 = 0; i1 < split_23.length; i1++) {
		const num = Number (split_23 [i1]);
		if (Number.isInteger (num) && num >= 1 && num <= 2048) {
			continue;
		}
		else {
			throw new Error (`String at position "${ i1 + 1 }" is not an integer between 1 and 2048`);
		}
	}
		
	let legit_numerals = [];
	
	let victory = "no";
	for (let i1 = 1; i1 <= 2048; i1++) {
		const mnemonic_BIP_39_English = mnemonic_numerals_string_to_BIP_39_English_string (
			twenty_three + ' ' + i1.toString ()
		);
		
		if (bip39.validateMnemonic (mnemonic_BIP_39_English, BIP_39_Word_List)) {
			legit_numerals.push (i1);
		}
	}
	
	return legit_numerals;
}