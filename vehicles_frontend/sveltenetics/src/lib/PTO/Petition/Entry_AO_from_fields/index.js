
/*
	import * as Aptos_SDK from "@aptos-labs/ts-sdk";
	import { Uint8Array_from_string } from '$lib/taverns/hexadecimal/Uint8Array_from_string'
	import { pick_expiration } from '$lib/PTO/Petition/Options_Expiration'
	import { build_entry_petition_AO } from '$lib/PTO/Petition/Entry_AO_from_fields'

	build_entry_petition_AO ({
		net_path: "",
		
		fields: {
			sender: Aptos_SDK.AccountAddress.from (
				Uint8Array_from_string (address_signer_hexadecimal_string)
			),
			data: {
				function: "0x1::aptos_account::transfer",
				typeArguments: [],
				functionArguments: [
					Aptos_SDK.AccountAddress.from (
						Uint8Array_from_string (to_address_hexadecimal_string)
					)
				]
			},
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



////
//
import * as Aptos_SDK from "@aptos-labs/ts-sdk";
import _get from 'lodash/get'
//
//
import { string_from_Uint8Array } from '$lib/taverns/hexadecimal/string_from_Uint8Array'
import { Uint8Array_from_string } from '$lib/taverns/hexadecimal/Uint8Array_from_string'
import { parse_with_commas } from '$lib/taverns/numbers/parse_with_commas'
//
import { request_ledger_info } from '$lib/PTO/General/Ledger_Info.API'
//
//
/*
import { create_TP_AO_from_hexadecimal_string } from './AO_from_hexadecimal_string'
import { unpack_TP_AO_from_hexadecimal_string } from '../unpack/from_hexadecimal_string'
import { pick_expiration } from './../fields/expiration'
import { convert_Uint8Array_to_integer_amount } from '../fields/amount/transform'
import { simulate_transaction } from './../simulate'
import { stringify_TP_AO } from '../stringify'
*/
//
////
//
//	verifications
//
/*
import { verify_unpacked_amount } from './../fields/amount/verify'
import { verify_TP_AO } from './../verifications/AO'
*/
//
//
//\\




export const build_entry_petition_AO = async ({
	net_path,
	
	fields,
}) => {
	const { 
		fonction, 
		address_signer_hexadecimal_string 
	} = fields;
	const origin_account = Aptos_SDK.AccountAddress.from (
		Uint8Array_from_string (address_signer_hexadecimal_string)
	);
	
	const { enhanced } = await request_ledger_info ({ net_path })
	
	//
	//	TODO: This should probably be from the address choice
	//
	const { chain_id } = enhanced;
	
	//
	//	https://github.com/aptos-labs/aptos-ts-sdk/blob/687e00152cc139f406182186fcd05b082dd70639/src/api/aptosConfig.ts
	//	https://github.com/search?q=repo%3Aaptos-labs%2Faptos-ts-sdk+fullnode%3A&type=code
	//
	const aptos = new Aptos_SDK.Aptos (new Aptos_SDK.AptosConfig ({		
		fullnode: net_path,
		network: Aptos_SDK.Network.CUSTOM
	}));

	const TP_AO = await aptos.transaction.build.simple ({
		sender: fields.sender,
		data: fields.data,
		options: fields.options
	});
	const TP_bytes = TP_AO.bcsToBytes ()
	const TP_hexadecimal_string = string_from_Uint8Array (TP_bytes)
	const TP_stringified = stringify_TP_AO ({ TP_AO })
	
	////
	///
	// 		Unpack:
	//
	//			TODO: check that fiberized objects are equivalent.
	//
	const {
		UTP_AO,
		UTP_bytes,
		UTP_hexadecimal_string,
		UTP_stringified
	} = create_TP_AO_from_hexadecimal_string ({ TP_hexadecimal_string })
	//\
	//\\
	
	////
	///
	// 		Verify:
	//			Unpacked Amount
	//
	const { unpacked_amount_hexadecimal_string, unpacked_amount_Uint8Array } = verify_unpacked_amount ({
		original_amount_string: amount,
		UTP_AO
	})
	//
	verify_TP_AO ({ TP_AO })
	//\
	//\\
	
	const arg_2nd_conversion = parse_with_commas (
		convert_Uint8Array_to_integer_amount ({
			u_int_8_array: unpacked_amount_Uint8Array 
		})
	)
	
	const info_alerts = [{
		"text": `The second arg: "${ unpacked_amount_hexadecimal_string }" is equal to "${ arg_2nd_conversion }".`
	}]
	
	
	return {
		TP_AO,
		TP_bytes,
		TP_hexadecimal_string,
		TP_stringified,
		
		UTP_AO,
		UTP_bytes,
		UTP_hexadecimal_string,
		UTP_stringified,
		
		info_alerts,
		
		original_amount: amount,
		unpacked_amount_hexadecimal_string
	}
}

