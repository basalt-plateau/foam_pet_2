

/*
	// this always returns a string

	import { obtain_string } from '$lib/taverns/procedures/obtain/string'
	obtain_string ({ 's': '1' }, [ 's' ], '')
	
	obtain_string ('')
*/


import _get from 'lodash/get'

export function obtain_string () {
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
				''
			)
		}
		else if (arguments.length === 1) {
			candidate = arguments [0]
		}
		
		if (typeof candidate === "string") {
			return candidate;
		}
		
		// console.log (arguments);
		throw new Error (`A string could not be obtained from the preceeding arguments.`)		
	}
	catch (exception) {
		//console.warn (exception)
	}
	
	console.warn ("A string could not be obtained from these arguments", arguments)
	
	return ''
}