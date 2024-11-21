




/*
	import { fiberize_petition_AO } from '$lib/PTO/Transaction/Petition/Fiberize'
	const petition_AO_fiberized = stringify_TP_AO ({ 
		petition_AO 
	})
*/

/*
	import { fiberize_petition_bytes } from '$lib/PTO/Transaction/Petition/Fiberize'
	const petition_fiberized = stringify_TP_bytes ({
		petition_bytes
	})
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


export const fiberize_petition_AO = ({
	petition_AO
}) => {
	return JSON.stringify (petition_AO, replaces, 4);
}


export const fiberize_petition_bytes = ({ petition_bytes }) => {
	const deserialized = new Aptos_SDK.Deserializer (petition_bytes);
	const TP_AO = Aptos_SDK.SimpleTransaction.deserialize (deserialized);
	return JSON.stringify (TP_AO, replaces, 4);
}





