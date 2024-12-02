
/*
	import { build_entry_petition_AO } from './screenplays/build_entry_petition_AO'
	build_entry_petition_AO ({
		address_signer_hexadecimal_string: "",
	});
*/

////
//
import * as Aptos_SDK from "@aptos-labs/ts-sdk";
//
//
import { Uint8Array_from_string } from '$lib/taverns/hexadecimal/Uint8Array_from_string'
import { pick_expiration } from '$lib/PTO/Petition/Options_Expiration'
import { build_entry_petition_AO as build_entry_petition_AO_ } from '$lib/PTO/Petition/Entry_AO_from_fields'
//
//
////

import { fiberize_TP_AO, fiberize_TP_bytes } from '$lib/PTO/Offline/Petition/Fiberize'
import { hexadecimal_string_from_UTF8 } from '$lib/taverns/hexadecimal/UTF8'
import { UTF8_from_hexadecimal_string } from '$lib/taverns/hexadecimal/UTF8'


import { pack_petition_envelope } from "$lib/PTO/Offline/Petition/Envelope"
	

export const build_entry_petition_AO = async ({
	net_path,
	petition_fields
}) => {
	try {
		console.info ("build_entry_petition_AO");




		/*
			Aptos_SDK.AccountAddress.from (
					Uint8Array_from_string (to_address_hexadecimal_string)
				)
		*/
		const { parameters } = petition_fields;
		const functionArguments = parameters.map (parameter => {
			if (parameter.name === "address") {
				return Aptos_SDK.AccountAddress.from (
					Uint8Array_from_string (parameter.field)
				)
			}
			
			return parameter.field
		})
		
		const transaction_petition_bracket = {
			sender: Aptos_SDK.AccountAddress.from (
				Uint8Array_from_string (
					petition_fields.signer_hexadecimal_address
				)
			),
			data: {
				function: (
					petition_fields.address + 
					"::" +
					petition_fields.module_name + 
					"::" +
					petition_fields.fonction_name
				),
				typeArguments: petition_fields.type_parameters,
				functionArguments
			},
			options: {
				expireTimestamp: pick_expiration ({ 
					after_seconds: 600
				}).expiration_timestamp,
				gasUnitPrice: BigInt (100),
				maxGasAmount: BigInt (200000)
			}
		}
		
		console.log ("build_entry_petition_AO::", {
			net_path,
			transaction_petition_bracket
		})


		
		const aptos = new Aptos_SDK.Aptos (new Aptos_SDK.AptosConfig ({		
			fullnode: net_path,
			network: Aptos_SDK.Network.CUSTOM
		}));

		
		let TP1_AO;
		try {
			TP1_AO = await aptos.transaction.build.simple (transaction_petition_bracket);		
			
			
		}
		catch (barrier) {
			console.warn (barrier.message);
			
			return {
				barrier: barrier.message
			}
		}
		
		const TP1_AO_Uint8Array = TP1_AO.bcsToBytes ()
		const TP1_AO_hexadecimal_string = string_from_Uint8Array (TP1_AO_Uint8Array)
		const TP1_AO_fiberized = fiberize_TP_AO ({ TP_AO: TP1_AO })

		// console.log ({ TP1_AO_hexadecimal_string });
		// console.log ({ TP1_AO_Uint8Array });

		////
		//
		//		The "TP2_hexadecimal_string" is what is sent to the signatory.
		//			Perhaps this should be the "TP2_AO_Uint8Array" though.
		//
		//		The TP2 isn't actually equivalent to the TP1.
		//		The TP2 is what is parsed on the signatory though.
		//
		//		Tutorial:
		//			* TP1_AO_hexadecimal_string is converted into bytes
		//			* TP2_AO is built from the TP2_AO_bytes
		//
		const TP2_AO_Uint8Array = Uint8Array_from_string (TP1_AO_hexadecimal_string)
		const TP2_AO = Aptos_SDK.SimpleTransaction.deserialize (
			new Aptos_SDK.Deserializer (
				TP2_AO_Uint8Array
			)
		);
		const TP2_fiberized = fiberize_TP_AO ({ TP_AO: TP2_AO })
		const TP2_hexadecimal_string = string_from_Uint8Array (TP2_AO_Uint8Array)
		//
		//	
		const { TPE, TPE_fiberized } = pack_petition_envelope ({
			petition_AO: TP2_AO,
			petition_hexadecimal_string: TP2_hexadecimal_string
		});
		
		//
		////
		
		return {
			TP2_AO,
			TP2_fiberized,
			
			TP2_AO_Uint8Array,
			
			//
			// Perhaps this is what is sent to the "APT Entrust"
			TP2_hexadecimal_string,
			
			TPE_fiberized,
			
			//
			// This is what is sent
			TPE,
			
			barrier: false
		}
	}
	catch (anomaly) {
		try {
			console.info ("anomaly:", anomaly.message);
			console.error (anomaly);
		}
		catch (exception) {
			console.error (exception);
		}
		
		return {
			barrier: anomaly.message
		}
	}
	
	return {
		barrier: "Reached code that seemed to be beyond reach."
	}
}

