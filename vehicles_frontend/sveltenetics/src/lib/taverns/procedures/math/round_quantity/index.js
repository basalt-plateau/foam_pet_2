


/*
	import { round_quantity } from '$lib/taverns/procedures/math/round_quantity'
	round_quantity (91.555) // '91.56'
*/

import round from 'lodash/round'

function get_zeroes (amount) {
	let zeroes = ""
	for (let s = 1; s <= amount; s++) {
		zeroes += "0"
	}
	
	return zeroes
}

export const round_quantity = function (
	quantity, 
	decimal_places = 2
) {		
	if (quantity === '') {
		return ''
	}
	
	var rounded_quantity = round (quantity, decimal_places)
	if (isNaN (rounded_quantity)) {
		return ""
	}
	rounded_quantity = rounded_quantity.toString ()

	// if it equals zero
	if (rounded_quantity == "0") {
		return '0.' + get_zeroes (decimal_places)
	}
	
	// If there's no decimal place
	if (rounded_quantity.indexOf (".") == -1) {
		return rounded_quantity + '.'  + get_zeroes (decimal_places)
	}
	
	const split = rounded_quantity.split ('.')
	const add = decimal_places - split [1].length;
	
	if (add >= 1) {
		return rounded_quantity + get_zeroes (add)
	}
	
	return rounded_quantity;
}