

/*
	// this always returns a string

	import { obtain_array } from '$lib/taverns/procedures/obtain/array'
	obtain_array ({ 's': '1' }, [ 's' ], '')
	
	obtain_array ('')
*/


import _get from 'lodash/get'

export function obtain_dict () {
	let the_exception = ""
	
	try {
		let candidate = undefined;
		if (arguments.length === 3) {
			candidate = _get (
				arguments [0], 
				arguments [1], 
				arguments [2]
			)
		}
		else if (arguments.length === 2) {
			candidate = _get (
				arguments [0], 
				arguments [1], 
				{}
			)
		}
		else if (arguments.length === 1) {
			candidate = arguments [0]
		}
		
		// console.log ({ candidate }, Object.keys (candidate), Array.isArray (candidate))
		
		if (
			typeof candidate === "object" &&
			Object.keys (candidate).length >= 0 && 
			Array.isArray (candidate) == false
		) {
			return candidate;
		}
		
		// console.log (arguments);
		throw new Error (`A dictionary could not be obtained from the preceeding arguments.`)		
	}
	catch (exception) {
		// console.warn ("exception:", exception)
	}
	
	console.warn ("A dictionary could not be obtained from these arguments", arguments)
	
	return {}
}