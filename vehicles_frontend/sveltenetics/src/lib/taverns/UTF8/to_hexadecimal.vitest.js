
// pnpm vitest "lib/taverns/UTF8/to_hexadecimal.vitest.js"

import { describe, it, expect } from 'vitest';
import assert from 'assert'

import { UTF8_to_hexadecimal } from "$lib/taverns/UTF8/to_hexadecimal.js"


describe ('UTF8_to_hexadecimal', () => {
	it ('fonction 1', () => {
		assert.equal (
			UTF8_to_hexadecimal ("paused"), 
			"706175736564"
		)
	});
});