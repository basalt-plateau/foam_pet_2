

/*
	import { ask_convert_Octas_to_APT } from '$lib/taverns/APT/Octas_to_APT.js'
	const APT = ask_convert_Octas_to_APT ({ Octas: "1" })
*/

//
//	Octas: 
//		      1 ->  0.00000001 
//		     10 ->  0.00000010
//		    100 ->  0.00000100
//
//    1000,0000 ->  0.1
//	  9999,9999 ->  0.99999999
//
//	1,0000,0000 ->  1.0
// 11,0000,0000 -> 11.0
//
//

import { add_zeroes } from '$lib/taverns/numerals/add_zeroes.js'
import { assert_is_natural_numeral_string } from '$lib/taverns/numerals/natural/is_string'

const divide_at_eight = (digit) => {
	const part1 = digit.slice (0, digit.length - 8);
    const part2 = digit.slice (digit.length - 8);
    return [ part1, part2 ];
}

export const ask_convert_Octas_to_APT = ({ Octas }) => {
	assert_is_natural_numeral_string (Octas);
	
	//
	//
	//	If length <= 8
	//
	//
	if (Octas.length <= 8) {
		Octas = add_zeroes ({
			fractional: Octas,
			until: 9,
			part: "front"
		})
	}
	
	const divided = divide_at_eight (Octas);
	
	return divided [0] + "." + divided [1];
	
	return Octas;
}