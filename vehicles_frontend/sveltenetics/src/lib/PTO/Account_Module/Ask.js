

/*
	curl --request GET \
  --url https://api.mainnet.aptoslabs.com/v1/accounts/${ address }/module/${ module_name }
*/

/*
	// fonctions

	import { ask_account_module } from '$lib/PTO/Account_Module/Ask'
	const { enhanced } = await ask_account_module ({ 
		net_path,
		
		address_hexadecimal_string,
		module_name
	})
*/


/*
	// modules for address

	import { ask_account_module } from '$lib/PTO/Account_Module/Ask'
	const { enhanced } = await ask_account_module ({ 
		net_path,
		address_hexadecimal_string
	})
*/

import { Aptos, AptosConfig } from "@aptos-labs/ts-sdk";
import * as Aptos_SDK from "@aptos-labs/ts-sdk";


export const ask_account_module = async ({
	net_path,
	
	address_hexadecimal_string,
	module_name = null
}) => {
	console.log ({ net_path })
	
	if (typeof module_name === "string") {
		const proceeds = await fetch (
			`${ net_path }/accounts/${ address_hexadecimal_string }/module/${ module_name }`
		)
		if (proceeds.status !== 200) {
			return {
				successful: "no",
				enhanced: await proceeds.json ()
			}
		}
		
		return {
			successful: "yes",
			enhanced: await proceeds.json ()
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

