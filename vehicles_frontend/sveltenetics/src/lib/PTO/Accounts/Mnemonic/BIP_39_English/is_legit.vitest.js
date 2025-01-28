

/*
	(cd /Metro/vehicles_frontend/sveltenetics && pnpm vitest "lib/PTO/Accounts/Mnemonic/BIP_39_English/is_legit.vitest.js")
*/

import { describe, it, expect } from 'vitest';
import assert from 'assert'


import { BIP_39_English_String_is_legit } from "./is_legit.js"

const guarantee_throws = (arg1) => {
	try {
		BIP_39_English_String_is_legit (arg1);
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
			BIP_39_English_String_is_legit (
				"nation sorry clock vacant whisper visual art topic scene where decade sweet excess usage tuna close search behind theory barely sorry guitar badge frame"
			), 
			"yup"
		);
	});
	
	
	it ('throws', async () => {
		assert.equal (
			guarantee_throws ("nation sorry clock vacant whisper visual art topic scene where decade sweet excess usage tuna close search behind theory barely sorry guitar badge frames"),
			`Word "frames" is not a BIP 39 English word.`
		);
		assert.equal (
			guarantee_throws (""),
			`Phrase "" isn't 24 words.`
		);
		
		assert.equal (
			guarantee_throws (1),
			`The English BIP 39 field isn't a string.`
		);
	});
});

