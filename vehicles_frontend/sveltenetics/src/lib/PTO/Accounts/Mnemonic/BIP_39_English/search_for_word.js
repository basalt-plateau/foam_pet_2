



import * as bip39 from '@scure/bip39';
import { wordlist } from '@scure/bip39/wordlists/english';



export const search_for_word = (word) => {
	for (let i1 = 0; i1 <= wordlist.length; i1++) {
		if (wordlist [ i1 ] === word) {
			return i1 + 1;
		}
	}
	
	throw new Error (`Word "${ word }" is not a BIP 39 English word.`);
}