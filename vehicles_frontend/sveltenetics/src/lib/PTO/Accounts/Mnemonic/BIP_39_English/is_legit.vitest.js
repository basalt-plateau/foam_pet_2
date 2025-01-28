

/*
	(cd /Metro/vehicles_frontend/sveltenetics && pnpm vitest "lib/PTO/Accounts/Mnemonic/BIP_39_English/is_legit.vitest.js")
*/

import { describe, it, expect } from 'vitest';
import assert from 'assert'
import * as bip39 from '@scure/bip39';
import { BIP_39_English_String_to_Numerals_String } from "./string_to_numerals_string.js"

import { BIP_39_English_String_is_legit } from "./is_legit.js"
import {
	mnemonic_numerals_string_to_BIP_39_English_string
} from "./../numerals/string_to_BIP_39_English_string.js"
	
const guarantee_throws = async (arg1) => {
	try {
		await BIP_39_English_String_is_legit (arg1);
	}
	catch (imperfection) {
		console.log (imperfection.message);
		
		return imperfection.message;
	}
	
	return ""
}


const search_for_valid_23 = async (twenty_three) => {
	let legit_words = [];
	
	let victory = "no";
	for (let i1 = 1; i1 <= 10; i1++) {
		for (let i2 = 1; i2 <= 2048; i2++) {
			const mnemonic_BIP_39_English = mnemonic_numerals_string_to_BIP_39_English_string (
				twenty_three + ' ' + i2.toString ()
			);
			
			try {
				if (await BIP_39_English_String_is_legit (mnemonic_BIP_39_English) == "yup") {
					let victory = "yup";
					console.log ("victorious");
					legit_words.push ([ i1, i2 ]);
				}
			}
			catch (imperfection) {
				// console.error (imperfection);
			}
		}
	}
	
	return legit_words;
}

const search_for_valid = async (twenty_two) => {
	let legit_words = [];
	
	let victory = "no";
	let walks = 0;
	for (let i1 = 1; i1 <= 10; i1++) {
		for (let i2 = 1; i2 <= 2048; i2++) {
			walks++;
			
			const mnemonic_BIP_39_English = mnemonic_numerals_string_to_BIP_39_English_string (
				`1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 ${ i1.toString () } ${ i2.toString () }`
			);
			
			try {
				if (await BIP_39_English_String_is_legit (mnemonic_BIP_39_English) == "yup") {
					let victory = "yup";
					console.log ("victorious");
					legit_words.push ([ i1, i2 ]);
					
					// break;
				}
			}
			catch (imperfection) {
				// console.error (imperfection);
			}
		}
	}
	
	return legit_words;
}


describe ('from_mnemonic', () => {
	it ('1', async () => {
		
		
		console.log (
			BIP_39_English_String_to_Numerals_String (
				"nation sorry clock vacant whisper visual art topic scene where decade sweet excess usage tuna close search behind theory barely sorry guitar badge frame"
			)
		);
		
		/*
			1179 1660 348 1924 2005 1960 103 1833 1541 2003 453 1758 629 1917 1876 350 1553 165 1795 149 1660 831 140 741
		*/
		assert.equal (
			await BIP_39_English_String_is_legit (
				"nation sorry clock vacant whisper visual art topic scene where decade sweet excess usage tuna close search behind theory barely sorry guitar badge frame"
			), 
			"yup"
		);
		
		const legit_words = await search_for_valid (`1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1`);
		console.log ({ legit_words });
		
	});
	
	it ('throws (perhaps invalid entropy)', async () => {
		assert.equal (
			await guarantee_throws ("clerk improve push disorder bunker tank flight pave window zero absurd media bless adjust unknown feature pact rely add quote deny excite height wonder"),
			`That is not a valid mnemonic.`
		);
		
		/*assert.equal (
			await guarantee_throws ("clerk improve push disorder bunker tank flight pave window zero absurd media bless adjust unknown feature pact rely add quote deny excite height wonder"),
			`That is not a valid mnemonic.`
		);*/
	});
	
	/*
	it ('throws', async () => {
		assert.equal (
			await guarantee_throws ("nation sorry clock vacant whisper visual art topic scene where decade sweet excess usage tuna close search behind theory barely sorry guitar badge frames"),
			`Word "frames" is not a BIP 39 English word.`
		);
		assert.equal (
			await guarantee_throws (""),
			`Phrase "" isn't 24 words.`
		);
		
		assert.equal (
			guarantee_throws (1),
			`The English BIP 39 field isn't a string.`
		);
	});
	*/
	
});

