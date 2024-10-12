

/*
	import { assert_is_natural_numeral_string } from '$lib/taverns/numerals/natural/is_string'
	assert_is_natural_numeral_string ("987654321")
*/

/*
	This asserts that a string is a natural numeral.
*/

const valid_characters = "01234567890"

export const assert_is_natural_numeral_string = (digit) => {
	if (typeof digit !== "string") {
		throw new Error (`Natural numeral amount needs to be a string, however received: "${ typeof digit }".`)
	}
	
	if (digit.length === 0) {
		throw new Error (`Natural numeral amount needs to be a string of length >= 1`)
	}
	
	//
	//
	//	Assert has exclusively characters: 01234567890
	//
	//
	const last = digit.length - 1;
	for (let E = 0; E <= last; E++) {
		if (valid_characters.includes (digit [E]) !== true) {
			throw new Error (`Natural numeral glyphs need to be one of ${ valid_characters }, however at index ${ E }, received: "${ digit [E] }".`)
		}
	}
}
export const is_natural_numeral_string = assert_is_natural_numeral_string;