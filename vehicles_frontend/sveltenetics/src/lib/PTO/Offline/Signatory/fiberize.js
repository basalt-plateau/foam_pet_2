


/*
	import { fiberize_signature } from '$lib/PTO/Offline/Signature/fiberize'
	const fiberized_signature = fiberize_signature (bracket)
*/

import * as Aptos_SDK from "@aptos-labs/ts-sdk";

import { string_from_Uint8Array } from '$lib/taverns/hexadecimal/string_from_Uint8Array'

const replaces = (key, value) => {
	if (typeof value === 'bigint') {
		return value.toString ();
	}
	if (value instanceof Uint8Array) {
		return string_from_Uint8Array (value)
	}
	
	return value;
}


export const fiberize_signature = (bracket) => {
	return JSON.stringify (bracket, replaces, 4);
}

