

/*
	import { address_to_hexadecimal } from "$lib/PTO/Address/to_hexadecimal"
	let address = address_to_hexadecimal (address);
*/
export const address_to_hexadecimal = (address) => {
	if (address.substring (0,2) === "0x") {
		return address.substring (2).toUpperCase ();
	}
	
	return address.toUpperCase ();
}