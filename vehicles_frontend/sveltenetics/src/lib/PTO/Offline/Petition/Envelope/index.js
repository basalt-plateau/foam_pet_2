


/*
	import { pack_petition_envelope } from "$lib/PTO/Offline/Petition/Envelope"
	pack_petition_envelope ({
		petition_AO,
		petition_hexadecimal_string
	});
*/

/*
	import { unpack_petition_envelope } from "$lib/PTO/Offline/Petition/Envelope"
	
	const {
		petition_aptos_object,
		envelope_show
	} = unpack_petition_envelope ({
		TPE
	});
*/

/*
	Transaction Petition Envelope

	TPE:
		* This is what is sent to the signatory
		* hexadecimal string
		* condensed
	
	TPE_fiberized:
		* This is what is displayed as "petition bracket"
		* not condensed
*/

import * as AptosSDK from "@aptos-labs/ts-sdk";


import { fiberize_TP_AO, fiberize_TP_bytes } from '$lib/PTO/Offline/Petition/Fiberize'

import { hexadecimal_string_from_UTF8 } from '$lib/taverns/hexadecimal/UTF8'
import { UTF8_from_hexadecimal_string } from '$lib/taverns/hexadecimal/UTF8'

import { Uint8Array_from_string } from '$lib/taverns/hexadecimal/Uint8Array_from_string'


export const pack_petition_envelope = ({
	petition_AO,
	petition_hexadecimal_string
}) => {
	const notes = {
		
	}
	const TPE_fiberized = fiberize_TP_AO ({
		petition: petition_AO,
		notes
	});
	const TPE = hexadecimal_string_from_UTF8 (JSON.stringify ({
		petition: petition_hexadecimal_string,
		notes
	}));
	
	return {
		TPE,
		TPE_fiberized
	}	
}


export const unpack_petition_envelope = ({
	TPE
}) => {
	// console.log ({ TPE });

	const UTF8_String = UTF8_from_hexadecimal_string (TPE);
	// console.log ({ UTF8_String });
	
	const parsed = JSON.parse (UTF8_String);
	// console.log ({ parsed });	
	
	const { petition, notes } = parsed;
	
	const petition_aptos_object = AptosSDK.SimpleTransaction.deserialize (
		new AptosSDK.Deserializer (
			Uint8Array_from_string (petition)
		)
	);
	
	const envelope_show = fiberize_TP_AO ({
		petition: petition_aptos_object,
		notes
	});
	
	// console.log ({ petition_aptos_object, envelope_show });
	
	return {
		petition_hexadecimal_string: petition,
		petition_aptos_object,
		envelope_show
	}
}
