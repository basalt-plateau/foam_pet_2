

/*
	(cd /Metro/vehicles_frontend/sveltenetics && pnpm vitest "lib/PTO/Accounts/Mnemonic/numerals/to_BIP_39_English.vitest.js")
*/

import { describe, it, expect } from 'vitest';
import assert from 'assert'

import { build_tickets } from "./build.js"

/*
	Locking Mechanism:
		* Seed Phrase:
			* BIP 39 English Wordlist
			* Path: m/44'/637'/0'/0'/0'
			* Elliptic Algorithm: EEC 25519
*/
describe ('from_mnemonic', () => {
	it ('1', async () => {
		
		assert.deepEqual (
			build_tickets ({
				mnemonic_numerals: "2048 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1"
			}),
			{
				wealth: {},
				boast: {}
			}
		);

	});
});


