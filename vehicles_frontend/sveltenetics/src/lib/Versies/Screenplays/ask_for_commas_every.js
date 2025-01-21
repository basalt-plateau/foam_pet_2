

import { assert_is_natural_numeral_string } from '$lib/taverns/numerals/natural/is_string'

export const ask_for_commas_every = () => {
	let commas_every = 5
	if (typeof localStorage.commas_every === "string") {
		try {
			let LSCE = localStorage.commas_every;

			assert_is_natural_numeral_string (LSCE)
			commas_every = parseInt (LSCE)
		}		
		catch (exception) {
			// Like if the assertion failed.. exception note not important.
			console.info (exception)
		}
	}
	
	return commas_every;
}

