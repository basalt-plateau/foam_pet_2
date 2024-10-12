

/*
	import { add_zeroes } from '$lib/taverns/numerals/add_zeroes.js'
	add_zeroes ({
		fractional: "1234567"
	})
*/

/*
	This add zeroes to the back of the number
	until there are 8 zeroes.
*/

//
//
//  1234567 -> 1234570
//	1234 -> 12340000
//
//
export const add_zeroes = ({ 
	fractional,
	part = "back",
	until = 8
}) => {
	console.log ({ fractional, part, until })
	
	if (part === "back") {
		const zeroes = until - fractional.length;
		for (let E = 1; E <= zeroes; E++) {
			fractional = fractional + "0";
		}
		
		return fractional;
	}
	else {
	
		//
		//
		//	Add to beginning
		//
		//
		const zeroes = until - fractional.length;
		
		console.log (`Add ${ zeroes } zeroes`);
		
		for (let E = 1; E <= zeroes; E++) {
			fractional = "0" + fractional;
		}
		
		return fractional;
	}
}