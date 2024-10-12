
// vitest "lib/taverns/numerals/add_zeroes.vitest.js"


import { add_zeroes } from '$lib/taverns/numerals/add_zeroes.js'

import { describe, it, expect } from 'vitest';
import assert from 'assert'


describe ("add_zeroes", () => {
	describe ("to back", () => {
		it ("<= 8", async () => {
			assert.equal (add_zeroes ({ fractional: "" }), "00000000")
			assert.equal (add_zeroes ({ fractional: "12" }), "12000000")
			assert.equal (add_zeroes ({ fractional: "1234567" }), "12345670")
			assert.equal (add_zeroes ({ fractional: "12345678" }), "12345678")
		});
		
		it (">= 9", async () => {
			assert.equal (add_zeroes ({ fractional: "123456789" }), "123456789")
		});
	});
	
	describe ("to front", () => {
		it ("8", async () => {
			assert.equal (add_zeroes ({ fractional: "", part: "front" }), "00000000")
			assert.equal (add_zeroes ({ fractional: "12", part: "front" }), "00000012")
			assert.equal (add_zeroes ({ fractional: "12345678", part: "front" }), "12345678")
			assert.equal (add_zeroes ({ fractional: "123456789", part: "front" }), "123456789")
		});

	});
})
