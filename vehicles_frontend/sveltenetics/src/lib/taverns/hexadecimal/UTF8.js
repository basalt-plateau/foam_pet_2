

/*
	import { hexadecimal_string_from_UTF8 } from '$lib/taverns/hexadecimal/UTF8'
	import { UTF8_from_hexadecimal_string } from '$lib/taverns/hexadecimal/UTF8'
*/


export const hexadecimal_string_from_UTF8 = (UTF8_string) => {	
	const utf8Array = new TextEncoder ().encode (UTF8_string);
	
	let hexString = '';
    utf8Array.forEach(byte => {
        hexString += byte.toString (16).padStart(2, '0'); // Convert to hex and ensure 2 digits
    });
		
	return hexString.toUpperCase ();
}


export const UTF8_from_hexadecimal_string = (hexadecimal_string) => {	
	if (hexadecimal_string.length % 2 !== 0) {
        throw new Error('Hex string must have an even number of characters.');
    }

    // Split the hex string into pairs of characters
    const byteArray = [];
    for (let i = 0; i < hexadecimal_string.length; i += 2) {
        byteArray.push(parseInt(hexadecimal_string.substr(i, 2), 16)); // Convert each hex pair to byte
    }

    // Convert byte array back to a UTF-8 string
    const decodedString = new TextDecoder().decode(new Uint8Array(byteArray));
    return decodedString;
}