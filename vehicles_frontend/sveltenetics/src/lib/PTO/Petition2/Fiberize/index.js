


/*
	import { fiberize_TP_AO } from '$lib/PTO/Transaction/Petition2/Fiberize'
	const TP_fiberized = fiberize_TP_AO ({ TP_AO })
*/

/*
	import { fiberize_TP_bytes } from '$lib/PTO/Transaction/Petition2/Fiberize'
	const TP_fiberized = fiberize_TP_bytes ({ TP_bytes })
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


export const fiberize_TP_AO = ({ TP_AO }) => {
	return JSON.stringify (TP_AO, replaces, 4);
}


export const fiberize_TP_bytes = ({ TP_bytes }) => {
	const deserialized = new Aptos_SDK.Deserializer (TP_bytes);
	const TP_AO = Aptos_SDK.SimpleTransaction.deserialize (deserialized);
	return JSON.stringify (TP_AO, replaces, 4);
}

