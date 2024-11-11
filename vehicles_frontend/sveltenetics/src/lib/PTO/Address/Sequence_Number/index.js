
/*
	import { ask_sequence_number } from '$lib/PTO/Address/Sequence_Number'
	const { sequence_number } = await ask_sequence_number ({ 
		net_path,
		address
	})
*/


import { Aptos, AptosConfig } from "@aptos-labs/ts-sdk";
import * as Aptos_SDK from "@aptos-labs/ts-sdk";


export const ask_sequence_number = async ({
	net_path,
	address
}) => {
	console.log ({ net_path })
	
	
	const aptos = new Aptos_SDK.Aptos (new Aptos_SDK.AptosConfig ({		
		fullnode: net_path,
		network: Aptos_SDK.Network.CUSTOM
	}));
	
	console.log ("getting sequence number")
	
	const proceeds = await aptos.view ({ 
		payload: {
			function: "0x1::account::get_sequence_number",
			typeArguments: [],
			functionArguments: [
				address
			]
		}
	});
	
	const sequence_number = proceeds [0];
	
	return { 
		proceeds,
		sequence_number
	};
}

