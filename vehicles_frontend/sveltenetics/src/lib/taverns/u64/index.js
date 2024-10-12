

/*
	todo:
		import { u64_adapter } from '$lib/taverns/u64'
		const base_10_amount = u64_adapter ({
			"entrance": {
				"amount": "00E1F50500000000",
				"format": "hexadecimal string"
			},
			"exit": {
				"format": "bigint"
			}
		})
*/

import { has_field } from '$lib/taverns/procedures/object/has_field'


const hexadecimal_string_to_bigint = ({ entrance_amount }) => {
	const u64 = entrance_amount;
	
	if (u64.length !== 16) {
		throw new Error ('The u64 string should be length 16.');
	}
	
	const u_int_8_array = new Uint8Array (8);
	for (let i = 0; i <= 7; i++) {
		u_int_8_array [i] = parseInt (u64.substr (i * 2, 2), 16);
	}
	
	const view = new DataView (u_int_8_array.buffer);
	return view.getBigUint64 (0, true);
}

const integer_to_u_int_8_array = ({ entrance_amount }) => {
	const u_int_8_array = new Uint8Array (8);
	u_int_8_array.set (
		new Uint8Array (
			new BigUint64Array ([
				BigInt (entrance_amount)
			]).buffer
		)
	);
		
	return u_int_8_array;
}

const u_int_8_array_to_hexadecimal_string = ({ entrance_amount }) => {
	const hexadecimal_string_array = Array.from (entrance_amount, byte => 
		byte.toString(16).padStart (2, '0').toUpperCase ()
	);
	
	return hexadecimal_string_array.join ('');
}


const adaptations = {
	"integer": {
		"u_int_8_array": integer_to_u_int_8_array,
		"hexadecimal string": ({ entrance_amount }) => {
			const u_int_8_array = integer_to_u_int_8_array ({ entrance_amount });
			const hexadecimal_string = u_int_8_array_to_hexadecimal_string ({ entrance_amount: u_int_8_array });
			
			return hexadecimal_string;
		}
	},
	
	"u_int_8_array": {
		"hexadecimal string": u_int_8_array_to_hexadecimal_string,
		"bigint": ({ entrance_amount }) => {
			const hexadecimal_string = u_int_8_array_to_hexadecimal_string ({ entrance_amount });
			const bigint_amount = hexadecimal_string_to_bigint ({ entrance_amount: hexadecimal_string });
			
			return bigint_amount		
		}
	},
	
	"hexadecimal string": {
		"bigint": hexadecimal_string_to_bigint,
		"integer": ({ entrance_amount }) => {
			const bigint_amount = hexadecimal_string_to_bigint ({ entrance_amount });
			const integer_amount = parseInt (bigint_amount)
			
			if (bigint_amount != integer_amount) {
				throw new Error (`Adapt "${ entrance_format }" into "${ exit_format }" failed.  Big Int "${ bigint_amount }" != Int "${ integer_amount }"`)
			}
		}	
	}
}


export const u64_adapter = ({ entrance, exit }) => {
	const entrance_amount = entrance.amount;
	const entrance_format = entrance.format;
	const exit_format = exit.format;
	
	if (has_field (adaptations, entrance_format) !== true) {
		throw new Error (`Can't adapt "${ entrance_format }" into "${ exit_format }".  From "${ entrance_format }" isn't possible.`);
	}
	
	const entrance_adaptations = adaptations [ entrance_format ];
	if (has_field (entrance_adaptations, exit_format) !== true) {
		throw new Error (`Can't adapt "${ entrance_format }" into "${ exit_format }".  To "${ exit_format }" isn't possible.`);
	}

	const adapter = entrance_adaptations [ exit_format ];

	return adapter ({ entrance_amount })
}