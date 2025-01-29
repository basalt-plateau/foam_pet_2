

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


describe ('from_mnemonic', () => {
	it ('1', async () => {

		assert.equal (
			await BIP_39_English_String_is_legit (
				"nation sorry clock vacant whisper visual art topic scene where decade sweet excess usage tuna close search behind theory barely sorry guitar badge frame"
			), 
			"yup"
		);

		
	});
	
	it ('throws (perhaps invalid entropy)', async () => {
		assert.equal (
			await guarantee_throws ("clerk improve push disorder bunker tank flight pave window zero absurd media bless adjust unknown feature pact rely add quote deny excite height wonder"),
			`That is not a valid mnemonic.`
		);
		
		assert.equal (
			await guarantee_throws ("clerk improve push disorder bunker tank flight pave window zero absurd media bless adjust unknown feature pact rely add quote deny excite height wonder"),
			`That is not a valid mnemonic.`
		);
	});
	
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
			await guarantee_throws (1),
			`The English BIP 39 field isn't a string.`
		);
	});
});

