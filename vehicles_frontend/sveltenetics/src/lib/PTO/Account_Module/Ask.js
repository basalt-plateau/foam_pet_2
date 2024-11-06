



/*
	import { ask_account_module } from '$lib/PTO/Address/Sequence_Number'
	const { sequence_number } = await ask_sequence_number ({ 
		net_path,
		
		address,
		module_name
	})
*/


import { Aptos, AptosConfig } from "@aptos-labs/ts-sdk";
import * as Aptos_SDK from "@aptos-labs/ts-sdk";


export const ask_account_modules = async ({
	net_path,
	
	address,
	module_name = null
}) => {
	console.log ({ net_path })
	
	if (typeof module_name === "string") {
		const proceeds = await fetch (
			`${ net_path }/accounts/${ address_hexadecimal_string }/module/${ module_name }`
		)
		const enhanced = await proceeds.json ()
		
		return {
			enhanced
		}
	}
	else {
		const proceeds = await fetch (
			`${ net_path }/accounts/${ address_hexadecimal_string }/modules`
		)
		const enhanced = await proceeds.json ()
		
		return {
			enhanced
		}
	}	
}

