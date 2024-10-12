
/*
	import { parse_with_commas } from '$lib/taverns/numbers/parse_with_commas'
	parse_with_commas (1234512345)
*/

/*
	TODO: 1,0000,0000
*/


import { add_commas } from '$lib/taverns/numerals/commas/add'


import { check_roomies_truck } from '$lib/Versies/Trucks'
	

export const parse_with_commas = (number, choices = {}) => {
	const commas_every = check_roomies_truck ().freight.commas_every;
	choices.commas_every = commas_every
	
	return add_commas (number, choices)
}

