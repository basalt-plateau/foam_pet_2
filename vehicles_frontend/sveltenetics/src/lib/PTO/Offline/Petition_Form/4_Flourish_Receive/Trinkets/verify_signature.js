



import * as AptosSDK from "@aptos-labs/ts-sdk";
import { Uint8Array_from_string } from '$lib/taverns/hexadecimal/Uint8Array_from_string'
import { fiberize_signed_transaction } from '$lib/PTO/Transaction/Signed/Fiberize'

export const verify_signature = ({ freight }) => {
	console.log ('signature:', freight.transaction_signature.hexadecimal_string)
	
	const transaction_signature_Aptos_object = AptosSDK.AccountAuthenticator.deserialize (
		new AptosSDK.Deserializer (
			Uint8Array_from_string (
				freight.transaction_signature.hexadecimal_string
			)
		)
	);
	freight.leaves.Flourish_Receive.Aptos_object = transaction_signature_Aptos_object
	freight.leaves.Flourish_Receive.Aptos_object_fiberized = fiberize_signed_transaction ({
		signed_transaction: transaction_signature_Aptos_object
	})
	
	freight.leaves.Flourish_Receive.alert_success = "The signature was added successfully."
	freight.leaves.Flourish_Receive.alert_info = ""
	
	freight.lands.Transaction_Signature_Fields.next = "yes"
	
	verify_land ()
	
	console.log ('signature verified')
}