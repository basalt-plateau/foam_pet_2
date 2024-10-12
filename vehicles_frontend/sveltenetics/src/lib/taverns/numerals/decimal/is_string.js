

/*
	import { is_decimal_digit_string } from '$lib/taverns/numerals/decimal/is_string'
*/

const valid_characters = "01234567890."

export const is_decimal_digit_string = (digit) => {
	if (typeof digit !== "string") {
		throw new Error (`Digit amount needs to be a string, however received: "${ typeof digit }".`)
	}
	
	if (digit.length === 0) {
		throw new Error (`Digit amount needs to be a string of length >= 1`)
	}
	
	//
	//
	//	Assert has exclusively characters: 01234567890
	//
	//
	const last = digit.length - 1;
	for (let E = 0; E <= last; E++) {
		if (valid_characters.includes (digit [E]) !== true) {
			throw new Error (`Digit glyphs need to be one of ${ valid_characters }, however at index ${ E }, received: "${ digit [E] }".`)
		}
	}
}