

// vitest "lib/taverns/numerals/decimal/is_string.vitest.js


import { is_decimal_digit_string } from '$lib/taverns/numerals/decimal/is_string'

import { describe, it, expect } from 'vitest';

import assert from 'assert'


const assert_throw = async (digit, exception_string) => {
	let proceeds;
	
	try {
		proceeds = is_decimal_digit_string (digit)
	}
	catch (exception) {
		assert.equal (exception.message, exception_string);
		return;
	}
	
	throw new Error (`An exception was not thrown, received: ${ proceeds }`);
}

describe ("natural number is string", () => {
	it ('1', () => {
		is_decimal_digit_string ("1")
		is_decimal_digit_string ("2")
		is_decimal_digit_string ("100")
		is_decimal_digit_string ("1234567890")
		is_decimal_digit_string ("1234567890.")
		is_decimal_digit_string ("1234567890.0")
	})
	
	it ('assert_throw', () => {
		assert_throw (
			"10!",
			`Digit glyphs need to be one of 01234567890., however at index 2, received: "!".`
		)
		assert_throw (
			1,
			`Digit amount needs to be a string, however received: "number".`
		)
		assert_throw (
			NaN,
			`Digit amount needs to be a string, however received: "number".`
		)
		assert_throw (
			null,
			`Digit amount needs to be a string, however received: "object".`
		)
		assert_throw (
			"",
			`Digit amount needs to be a string of length >= 1`
		)
	})
});