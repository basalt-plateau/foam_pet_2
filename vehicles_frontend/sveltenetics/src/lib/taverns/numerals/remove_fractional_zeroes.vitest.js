

// vitest "lib/taverns/numerals/remove_fractional_zeroes.vitest.js"


import { remove_fractional_zeroes } from '$lib/taverns/numerals/remove_fractional_zeroes.js'

import { describe, it, expect } from 'vitest';
import assert from 'assert'

describe ("remove_fractional_zeroes", () => {
	it ("returns zero if every digit is a zero", async () => {
		assert.equal (remove_fractional_zeroes ({ Digits: "0000" }), "0")
	});
	
	it ("1", async () => {
		assert.equal (remove_fractional_zeroes ({ Digits: "1000" }), "1")
		assert.equal (remove_fractional_zeroes ({ Digits: "100000000" }), "1")
		
		assert.equal (remove_fractional_zeroes ({ Digits: "100000000000" }), "1")
	});
})