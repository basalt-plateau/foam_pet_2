






/*
	import { remove_leading_zeroes } from '$lib/taverns/numerals/remove_leading_zeroes.js'

*/

/*
	This removes zeroes from the left
	until a non-zero is found.
*/

import { assert_is_natural_numeral_string } from '$lib/taverns/numerals/natural/is_string'


//
//
//	returns "0" if every digit is a zero
//
export const remove_fractional_zeroes = ({ Digits }) => {
	assert_is_natural_numeral_string (Digits)
	
	let integer_as_string_end = Digits.length - 1;
	let found_non_zero_1 = "no";
	
	let proceeds = ""
	for (
		let E = integer_as_string_end; 
		E >= 0;
		E--
	) {
		if (Digits [E] !== "0") {
			found_non_zero_1 = "yes"
		}
		if (found_non_zero_1 === "yes") {
			proceeds += Digits [E]
		}
	}
	
	if (proceeds.length === 0) {
		return "0"
	}
	
	return proceeds;
}