

/*
	import { 
		parse_bracket 
	} from '$lib/Les_Talents/APT_Entrust_Mode_1/Screenplays/transaction_petition/bracket/parse.js'
	
	const {
		address_of_sender,
		address_of_recipient,
		
		amount_as_base_16,
		amount_as_base_10,
		
		max_gas_amount,
		gas_unit_price
	} = parse_bracket ({ bracket })
*/

//
//
import { string_from_Uint8Array } from '$lib/taverns/hexadecimal/string_from_Uint8Array'
import { Uint8Array_from_string } from '$lib/taverns/hexadecimal/Uint8Array_from_string'
import { u64_adapter } from '$lib/taverns/u64'
import { parse_with_commas } from '$lib/taverns/numbers/parse_with_commas'
//
//
import _get from 'lodash/get'
//
//


export const parse_bracket = ({ bracket }) => {
	const rawTransaction = _get (bracket, [ 'rawTransaction' ], '')
	const payload = _get (rawTransaction, [ 'payload' ], '')
	const entryFunction = _get (payload, [ 'entryFunction' ], '')
	const args = _get (entryFunction, [ 'args' ], '')
	
	const address_of_sender__u_int_8_array = _get (rawTransaction, [ 'sender', 'data' ], '')
	const address_of_recipient__u_int_8_array = _get (args, [ 0, 'value', 'value' ], '')
	const amount_as_base_16__u_int_8_array = _get (args, [ 1, 'value', 'value' ], '')
	
	const amount_as_base_10 = parse_with_commas (u64_adapter ({
		"entrance": {
			"amount": amount_as_base_16__u_int_8_array,
			"format": "u_int_8_array"
		},
		"exit": {
			"format": "bigint"
		}
	}));
	
	const address_of_sender = string_from_Uint8Array (address_of_sender__u_int_8_array)
	const address_of_recipient = string_from_Uint8Array (address_of_recipient__u_int_8_array)
	const amount_as_base_16 = string_from_Uint8Array (amount_as_base_16__u_int_8_array)
	
	
	return {
		address_of_sender,
		address_of_recipient,
		
		amount_as_base_16,
		amount_as_base_10,
		
		max_gas_amount: parse_with_commas (_get (rawTransaction, [ 'max_gas_amount' ], '')),
		gas_unit_price: parse_with_commas (_get (rawTransaction, [ 'gas_unit_price' ], ''))
	}
}