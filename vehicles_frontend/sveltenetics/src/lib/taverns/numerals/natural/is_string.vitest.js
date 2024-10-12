

import { is_natural_numeral_string } from '$lib/taverns/numerals/natural/is_string'

import { describe, it, expect } from 'vitest';

import assert from 'assert'


const assert_throw = async (digit, exception_string) => {
	let proceeds;
	
	try {
		proceeds = is_natural_numeral_string (digit)
	}
	catch (exception) {
		assert.equal (exception.message, exception_string);
		return;
	}
	
	throw new Error (`An exception was not thrown, received: ${ proceeds }`);
}

describe ("natural number is string", () => {
	it ('1', () => {
		is_natural_numeral_string ("1")
		is_natural_numeral_string ("2")
		is_natural_numeral_string ("100")
		is_natural_numeral_string ("1234567890")
	})
	
	it ('assert_throw', () => {
		assert_throw (
			"1.0",
			`Natural numeral glyphs need to be one of 01234567890, however at index 1, received: ".".`
		)
		assert_throw (
			"10!",
			`Natural numeral glyphs need to be one of 01234567890, however at index 2, received: "!".`
		)
		assert_throw (
			1,
			`Natural numeral amount needs to be a string, however received: "number".`
		)
		assert_throw (
			NaN,
			`Natural numeral amount needs to be a string, however received: "number".`
		)
		assert_throw (
			null,
			`Natural numeral amount needs to be a string, however received: "object".`
		)
		assert_throw (
			"",
			`Natural numeral amount needs to be a string of length >= 1`
		)
	})
});