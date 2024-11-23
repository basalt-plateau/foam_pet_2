
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

import { fiberize_TP_AO, fiberize_TP_bytes } from '$lib/PTO/Petition2/Fiberize'


/*
	import { fiberize_TP_AO } from '$lib/PTO/Transaction/Petition2/Fiberize'
	const TP_fiberized = fiberize_TP_AO ({ TP_AO })

	import { fiberize_TP_bytes } from '$lib/PTO/Transaction/Petition2/Fiberize'
	const TP_fiberized = fiberize_TP_bytes ({ TP_bytes })
*/


export const build_entry_petition_AO = async ({
	net_path,
	petition_fields
}) => {
	try {
		console.info ("build_entry_petition_AO", { petition_fields });

		const sender = Aptos_SDK.AccountAddress.from (
			Uint8Array_from_string (
				petition_fields.signer_hexadecimal_address
			)
		);
		

		/*
			Aptos_SDK.AccountAddress.from (
					Uint8Array_from_string (to_address_hexadecimal_string)
				)
		*/

		
		
		const transaction_petition_bracket = {
			sender,
			data: {
				function: "0x1::aptos_account::transfer",
				_function: (
					petition_fields.address + 
					"::" +
					petition_fields.module_name + 
					"::" +
					petition_fields.fonction_name
				),
				typeArguments: [],
				functionArguments: []
			},
			options: {}
		}
		
		console.log ({
			"net_path": net_path,
			"transaction_petition_bracket": transaction_petition_bracket
		})


		
		const aptos = new Aptos_SDK.Aptos (new Aptos_SDK.AptosConfig ({		
			fullnode: net_path,
			network: Aptos_SDK.Network.CUSTOM
		}));

		console.log ("building petition");
		
		try {
			const TP1_AO = await aptos.transaction.build.simple (transaction_petition_bracket);		
		}
		catch (barrier) {
			console.error (barrier);
			
			return {
				barrier: barrier.message
			}
		}
		
		const TP1_AO_bytes = TP_AO.bcsToBytes ()
		const TP1_AO_hexadecimal_string = string_from_Uint8Array (TP_bytes)
		const TP1_AO_fiberized = fiberize_TP_AO ({ TP_AO })


		////
		///
		// 		Unpack:
		//			TODO: check that fiberized objects are equivalent.
		//
		const TP2_bytes = Uint8Array_from_string (TP1_AO_hexadecimal_string)
		const TP2_AO = Aptos_SDK.SimpleTransaction.deserialize (
			new Aptos_SDK.Deserializer (
				TP1_AO_bytes
			)
		);
		const TP2_fiberized = fiberize_TP_AO ({ TP_AO: TP1_AO_fiberized })
		const TP2_hexadecimal_string = string_from_Uint8Array (TP2_bytes)
		//\
		//\\

		/*
		build_entry_petition_AO_ ({
			net_path,
			
			fields: {
				sender,
				data,
				options: {
					expireTimestamp: pick_expiration ({ 
						after_seconds: 600
					}).expiration_timestamp,
					gasUnitPrice: BigInt (10),
					maxGasAmount: BigInt (200000)
				}
			}
		});
		*/
	}
	catch (anomaly) {
		console.error (anomaly);
		
		return {
			barrier: anomaly.message
		}
	}
	
	return {
		barrier: false
	}
}

