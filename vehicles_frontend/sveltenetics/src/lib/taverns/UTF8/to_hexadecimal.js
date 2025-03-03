
/*
	import { UTF8_to_hexadecimal } from "$lib/taverns/UTF8/to_hexadecimal.js"
		
*/

export const UTF8_to_hexadecimal = (str) => {
	
	let hex = '';
	for (let i = 0; i < str.length; i++) {
		let charCode = str.charCodeAt (i);
		hex += charCode.toString (16).padStart (2, '0');
	}
	
	return hex.toUpperCase ();
}