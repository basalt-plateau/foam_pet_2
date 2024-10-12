

/*
	import { ask_convert_APT_to_Octas } from '$lib/taverns/APT/APT_to_Octas.js'
	const Octas = await ask_convert_APT_to_Octas ({ APT })
*/

//
// APT: 1 			=== 1,0000,0000 Octas
// APT: 0.1			===   1000,0000 Octas
// APT: 0.01		===    100,0000 Octas
// APT: 0.001		===     10,0000 Octas
// APT: 0.0001		===      1,0000 Octas
// APT: 0.00001		===        1000 Octas
//

////
//
//	Highest:
//
//
//	Lowest:
//		APT: 0.00000001	-> 1 Octa
//
////

import { is_decimal_digit_string } from '$lib/taverns/numerals/decimal/is_string'
import { assert_is_natural_numeral_string } from '$lib/taverns/numerals/natural/is_string'

import { add_zeroes } from '$lib/taverns/numerals/add_zeroes.js'
import { remove_leading_zeroes } from '$lib/taverns/numerals/remove_leading_zeroes.js'
import { remove_fractional_zeroes } from '$lib/taverns/numerals/remove_fractional_zeroes.js'

export const ask_convert_APT_to_Octas = ({ APT }) => {
	is_decimal_digit_string (APT)
	
	if (APT.includes (".") !== true) {
		return remove_leading_zeroes ({
			Digits: APT + "00000000"
		})
	}
	
	const pair = APT.split (".")
	if (pair.length !== 2) {
		throw new Error (`The APT amount wasn't two parts after gettings the parts around the decimal.`)
	}
	
	
	const pair_fractional = add_zeroes ({ fractional: pair [1] })
	if (pair_fractional.length >= 9) {
		throw new Error (`The APT amount after the decimal can't be more than 8 digits.`)
	}
	
	//
	//	Add zeroes should ensure that 
	//
	//
	
	if (pair_fractional.length !== 8) {
		throw new Error (`The APT amount after the decimal was not 8 digits.`)
	}
	console.log ({ pair, pair_fractional })
	
	const squeeze = pair [0] + pair_fractional;
	console.log ({ squeeze });
	
	
	const without_leading_zeroes = remove_leading_zeroes ({ Digits: squeeze })
	return without_leading_zeroes;
}


//