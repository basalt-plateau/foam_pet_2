
/*
	import { add_commas } from '$lib/taverns/numerals/commas/add'
	add_commas (1234512345)
*/

/*
	[ ] Comma every 4 like music :)
*/

/*
	TODO: 1,0000,0000
*/

//
//	.123456 = .12345,6
//	.1234567 = .1234567	
//
const parse_decimal_part = (part, { commas_every, with_line_breaks }) => {
	if (!part) return '';

	// Add trailing zeros if less than 5 digits
	// part = part.padEnd (5, '0');

	// Format the decimal part with commas commas_every 3 digits from the end
	let result = '';
	let length = part.length;

	const last_index = part.length - 1;
	for (let i = 0; i <= last_index; i++) {
		let position_from_end = i + 1;

		result = result + part [i];

		if (position_from_end % commas_every === 0 && i !== 0 && i !== last_index) {
			result = result + ',';
		}
	}

	return result;
}

const parse_integer_part = (part, { commas_every, line_break_every, with_line_breaks }) => {
	let result = '';
	let length = part.length;

	const last_index = 0;
	for (let i = length - 1; i >= last_index; i--) {
		let position_from_end = length - i;
		result = part [i] + result;

		if (with_line_breaks === "yes") {
			if (with_line_breaks === "yes" && position_from_end % 25 === 0 && i !== 0) {
				result = '\n' + result;
			}
			else if (position_from_end % commas_every === 0 && i !== 0 && i !== last_index) {
				result = ' ' + result;
			}
		}
		else {
			if (position_from_end % commas_every === 0 && i !== 0 && i !== last_index) {
				result = ',' + result;
			}
		}
	}
	
	return result;
}

export const add_commas = (number, choices = {}) => {
	const with_line_breaks = choices.with_line_breaks || "no";
	const commas_every = choices.commas_every || 5;
	const line_break_every = choices.line_break_every || 25;
	
	let is_negative = "no"
	let actual_number = "";
	if (
		typeof number === "number" ||
		typeof number === "bigint"
	) {
		actual_number = number.toString ()
		
		/*	
			Return the scientific notation if
			has an "e" in it.
		*/
		let lower_case_number = actual_number.toLowerCase ();
		if (lower_case_number.indexOf ("e") >= 0) {
			return actual_number;
		}
	}
	else if (typeof number === "string") {
		actual_number = number
	}
	else {
		throw new Error (`Type "${ typeof number }" of digit "${ number }" was not prepared for.`);
	}
	
	if (actual_number [0] === "-") {
		actual_number = actual_number.substring (1)
		is_negative = "yes"
	}
	
	
	let [ integer_part, decimal_part ] = actual_number.toString ().split('.');
	/* console.log ({
		actual_number,
		integer_part, 
		decimal_part
	}) */

	// Parse both integer and decimal parts
	let parsed_integer_part = parse_integer_part (integer_part, { 
		commas_every, 
		with_line_breaks, 
		line_break_every 
	});
	let parsed_decimal_part = parse_decimal_part (decimal_part, { 
		commas_every, 
		with_line_breaks 
	});

	let flip = is_negative === "yes" ? "-" : "";
	
	if (parsed_decimal_part === '') {
		return flip + parsed_integer_part;
	}

	// Combine integer and decimal parts
	return `${ flip }${ parsed_integer_part }.${ parsed_decimal_part }`;
}

