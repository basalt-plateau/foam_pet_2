

/*
	const { ask_view_petition } from '$lib/PTO/Offline/Petition/View'
*/

import * as Aptos_SDK from "@aptos-labs/ts-sdk";


export const ask_view_petition = async ({
	net_path,
	petition_fields
}) => {
	try {
		const aptos = new Aptos_SDK.Aptos (new Aptos_SDK.AptosConfig ({		
			fullnode: net_path,
			network: Aptos_SDK.Network.CUSTOM
		}));
		
		const payload: InputViewFunctionData = {
			function: "0x1::account::exists_at",
			functionArguments: [
				"991378D74FAC384404B971765BEF7525CCE26C8EFD84B9FF27D202E10D7FFBE5"
			]
		};
		 
		await aptos.view ({ 
			payload
		}); 
		 
		// const chainId = (await aptos.view ({ payload }))[0];
		
	}
	catch (imperfection) {
		console.error ("ask_view_petition:", imperfection);
	}
}

