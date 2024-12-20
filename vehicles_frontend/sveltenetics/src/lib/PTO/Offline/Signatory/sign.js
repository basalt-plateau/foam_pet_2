







/* 
	import { sign_petition } from '$lib/PTO/Offline/Signatory/sign'
	const {
		petition_signature_aptos_object,
		petition_signature_fiberized,
		petition_signature_hexadecimal_string
	} = await sign ({
		petition_aptos_object,
		private_key_hexadecimal_string,
		address_is_legacy: false
	});
*/


////
///
import * as AptosSDK from "@aptos-labs/ts-sdk";
//
import { string_from_Uint8Array } from '$lib/taverns/hexadecimal/string_from_Uint8Array'
import { Uint8Array_from_string } from '$lib/taverns/hexadecimal/Uint8Array_from_string'
//
import { fiberize_signature } from '$lib/PTO/Offline/Signatory/fiberize'
//
//
//\
//\\

	

////
//
//	https://github.com/aptos-labs/aptos-ts-sdk/blob/main/examples/typescript-esm/sponsored_transactions/server_signs_and_submit.ts
//
//
export const sign_petition = async ({
	petition_hexadecimal_string,
	private_key_hexadecimal_string,
	
	// boolean
	address_is_legacy
}) => {
	const aptos = new AptosSDK.Aptos (new AptosSDK.AptosConfig ({}));
	console.info ({ aptos })
	

	///
	//	perhaps: this makes the account object from the private key hexadecimal
	//
	//
	const signer = AptosSDK.Account.fromPrivateKey ({ 
		privateKey: new AptosSDK.Ed25519PrivateKey (
			Uint8Array_from_string (private_key_hexadecimal_string)
		), 
		legacy: address_is_legacy
	});
	//\

	const petition_aptos_object = AptosSDK.SimpleTransaction.deserialize (
		new AptosSDK.Deserializer (
			Uint8Array_from_string (petition_hexadecimal_string)
		)
	);
	
	
	///
	//
	const petition_signature_aptos_object = aptos.transaction.sign ({ 
		signer,
		transaction: petition_aptos_object
	});
	const petition_signature_bytes = petition_signature_aptos_object.bcsToBytes ();
	const petition_signature_hexadecimal_string = string_from_Uint8Array (petition_signature_bytes)

	
	///
	//
	//	Reversal Check
	//
	const deserialized_petition_signature_bytes = AptosSDK.AccountAuthenticator.deserialize (
		new AptosSDK.Deserializer (
			Uint8Array_from_string (petition_signature_hexadecimal_string)
		)
	).bcsToBytes ();
	if (petition_signature_hexadecimal_string != string_from_Uint8Array (deserialized_petition_signature_bytes)) {
		throw new Error (`
			petition_signature_hexadecimal_string !=  deserialized_petition_signature_bytes
			
			petition_signature_hexadecimal_string is: ${ petition_signature_hexadecimal_string }
			
			deserialized_petition_signature_bytes is: ${ deserialized_petition_signature_bytes } 
		`)		
	}
	//
	//\

	const petition_signature_fiberized = fiberize_signature (petition_signature_aptos_object)
	
	return {
		petition_signature_aptos_object,
		petition_signature_hexadecimal_string,
		petition_signature_fiberized
	}
}