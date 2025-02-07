

/*
	import { APT_Button_Press } from "$lib/Singles/Extension_Winch/Petition/APT_Button_Press.js"


*/

import * as Aptos_SDK from "@aptos-labs/ts-sdk";
import { Uint8Array_from_string } from '$lib/taverns/hexadecimal/Uint8Array_from_string'

import * as Extension_Winch from "$lib/Singles/Extension_Winch"		
	

export const APT_Button_Press = async ({ 
	 
}) => {
	let flourisher_freight = Extension_Winch.freight ();
	
	const wallet = flourisher_freight.wallet_core._wallet;
	
	const aptos = new Aptos_SDK.Aptos (new Aptos_SDK.AptosConfig ({		
		fullnode: "https://api.devnet.aptoslabs.com/v1",
		network: Aptos_SDK.Network.CUSTOM
	}));
	const tx = await aptos.transaction.build.simple ({
		sender: Aptos_SDK.AccountAddress.from (
			Uint8Array_from_string (origin_address)
		),
		data: {
			function: "0x1::aptos_account::transfer",
			typeArguments: [],
			functionArguments: [
				Aptos_SDK.AccountAddress.from (
					Uint8Array_from_string (to_address)
				),
				"100000"
			]
		}
	});
	
	await wallet.signAndSubmitTransaction (tx);
}

