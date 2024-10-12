




import { remove_leading_zeroes } from '$lib/taverns/numerals/remove_leading_zeroes.js'

import { describe, it, expect } from 'vitest';
import assert from 'assert'


describe ("remove_leading_zeroes", () => {
	it ("is fortuitous", async () => {
		assert.equal (remove_leading_zeroes ({ Digits: "01234567" }), "1234567")
		assert.equal (remove_leading_zeroes ({ Digits: "0012" }), "12")
		assert.equal (remove_leading_zeroes ({ Digits: "001200" }), "1200")
	});

})
