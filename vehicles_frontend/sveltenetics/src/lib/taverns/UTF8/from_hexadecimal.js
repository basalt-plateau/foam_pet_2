
/*
	import { hexadecimal_to_UTF8 } from "$lib/taverns/UTF8/from_hexadecimal.js"
	
*/

export const hexadecimal_to_UTF8 = (hexadecimal) => {
	let str = '';
	for (let i = 0; i < hexadecimal.length; i += 2) {
		str += String.fromCharCode (parseInt (hexadecimal.substr (i, 2), 16));
	}
	
	return str;
}
