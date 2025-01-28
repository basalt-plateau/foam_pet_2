



/*
	(cd /Metro/vehicles_frontend/sveltenetics && pnpm vitest "lib/PTO/Accounts/Mnemonic/numerals/search_for_last/from_twenty_three.vitest.js")
*/

import { describe, it, expect } from 'vitest';
import assert from 'assert'
import * as bip39 from '@scure/bip39';

import { 
	search_for_last_from_twenty_three 
} from "$lib/PTO/Accounts/Mnemonic/numerals/search_for_last/from_twenty_three.js";

const guarantee_throws = async (arg1) => {
	try {
		await search_for_last_from_twenty_three (arg1);
	}
	catch (imperfection) {
		return imperfection.message;
	}
	
	return ""
}

describe ('from_mnemonic', () => {
	it ('1', async () => {
		const legit_numerals_1 = await search_for_last_from_twenty_three (
			"1179 1660 348 1924 2005 1960 103 1833 1541 2003 453 1758 629 1917 1876 350 1553 165 1795 149 1660 831 140"
		);
		assert.equal (legit_numerals_1.length, 8);
		assert.deepEqual (legit_numerals_1, [
			134,
			265,
			741,
			980,
			1167,
			1299,
			1585,
			1927
		]);
	});
	
	it ('2', async () => {
		const legit_numerals = await search_for_last_from_twenty_three (
			"1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1"
		);
		console.log ({ legit_numerals });
		
		assert.equal (legit_numerals.length, 8);
		assert.deepEqual (legit_numerals, [
			103,  493,  659,
			986, 1252, 1431,
			1746, 1865
		]);
	});
	
	it ('2', async () => {
		const legit_numerals = await search_for_last_from_twenty_three (
			"1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 2"
		);
		console.log ({ legit_numerals });
		
		assert.equal (legit_numerals.length, 8);
		assert.deepEqual (legit_numerals, [
			57,
			393,
			642,
			961,
			1193,
			1323,
			1762,
			1852
		]);
	});
	
	it ('throws 1', async () => {
		assert.equal (
			await guarantee_throws ("1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 2 1"),
			`Phrase "1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 2 1" isn't 23 words.`
		);
	});
	
	it ('throws 2', async () => {
		assert.equal (
			await guarantee_throws (1),
			`That phrase isn't a string.`
		);
	});
	
	it ('throws 3', async () => {
		assert.equal (
			await guarantee_throws ("1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 two"),
			`String at position "23" is not an integer between 1 and 2048`
		);
	});
});

