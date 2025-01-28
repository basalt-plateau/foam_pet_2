

/*
	(cd /Metro/vehicles_frontend/sveltenetics && pnpm vitest "lib/PTO/Accounts/Mnemonic/BIP_39_English/string_to_numerals_string.vitest.js")
*/

import { describe, it, expect } from 'vitest';
import assert from 'assert'


import { BIP_39_English_String_to_Numerals_String } from "./string_to_numerals_string.js"
import { search_for_word } from "./string_to_numerals_string.js"


describe ('from_mnemonic', () => {
	it ('1', async () => {
		const mnemonic = "nation sorry clock vacant whisper visual art topic scene where decade sweet excess usage tuna close search behind theory barely sorry guitar badge frame";
		
		assert.equal (search_for_word ("abandon"), 1);
		assert.equal (search_for_word ("zoo"), 2048);
		
		assert.deepEqual (
			BIP_39_English_String_to_Numerals_String (mnemonic),
			[
				1179,
				1660,
				348,
				1924,
				2005,
				1960,
				
				103,
				1833,
				1541,
				2003,
				453,
				1758,
				
				629,
				1917,
				1876,
				350,
				1553,
				165,
				
				1795,
				149,
				1660,
				831,
				140,
				741
			]
		);
	});
});

