

/*
	(cd /Metro/vehicles_frontend/sveltenetics && pnpm vitest "lib/PTO/Accounts/Mnemonic/BIP_39_English/search_for_word.vitest.js")
*/

import { describe, it, expect } from 'vitest';
import assert from 'assert'

import { search_for_word } from "./search_for_word.js"

const guarantee_throws = (arg1, arg2) => {
	try {
		search_for_word (arg1);
	}
	catch (imperfection) {
		console.log (imperfection.message);
		
		return imperfection.message;
	}
	
	return ""
}

describe ('from_mnemonic', () => {
	it ('1', async () => {
		assert.deepEqual (search_for_word ("abandon"), 1);
		assert.deepEqual (search_for_word ("zoo"), 2048);
	});
	
	it ('throws', async () => {
		assert.deepEqual (
			guarantee_throws ("abandoned"),
			`Word "abandoned" is not a BIP 39 English word.`
		);
		assert.deepEqual (
			guarantee_throws ("zooed"),
			`Word "zooed" is not a BIP 39 English word.`
		);
	});
});

