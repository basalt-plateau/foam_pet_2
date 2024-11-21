
/*
	import { build_entry_petition_AO } from './screenplays/build_entry_petition_AO'
	build_entry_petition_AO ({
		address_signer_hexadecimal_string: "",
	});
*/

import * as Aptos_SDK from "@aptos-labs/ts-sdk";
import { Uint8Array_from_string } from '$lib/taverns/hexadecimal/Uint8Array_from_string'
import { pick_expiration } from '$lib/PTO/Petition/Options_Expiration'
import { build_entry_petition_AO as build_entry_petition_AO_ } from '$lib/PTO/Petition/Entry_AO_from_fields'


export const build_entry_petition_AO = ({
	net_path,
	
	petition_fields
}) => {
	console.info ({ fonction });

	const sender = Aptos_SDK.AccountAddress.from (
		Uint8Array_from_string (
			fonction.signer_hexadecimal_address
		)
	);
	
	const data = {
		function: fonction.spot + fonction.module + fonction.fonction_name,
		typeArguments: [],
		functionArguments: []
	}

	/*
		Aptos_SDK.AccountAddress.from (
				Uint8Array_from_string (to_address_hexadecimal_string)
			)
	*/

	console.log ({
		"data": data,
		"build_entry_petition_AO": ""
	})

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
}

