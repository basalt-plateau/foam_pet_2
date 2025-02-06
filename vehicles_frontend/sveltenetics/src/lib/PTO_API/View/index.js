

/*
	curl --request POST \
	--url https://api.mainnet.aptoslabs.com/v1/view \
	--header 'Content-Type: application/json' \
	--data '{
		"function": "0x1::aptos_coin::transfer",
		"type_arguments": [
			null
		],
		"arguments": []
	}'
*/

/*
	import { view_fonction } from "$lib/PTO_API/View/index.js"
	const { result } = await view_fonction ({
		body: {
			"function": "0xf5565cc1d71781d6ef766a2a50ed459b9d3b430ceb6f7bbf79393c3626a979cd::Allowed_Wallets_02::retrieve",
			"type_arguments": [],
			"arguments": []
		}
	});
*/


import { ask_for_freight } from '$lib/Versies/Trucks'
	
export const view_fonction = async ({ body }) => {
	const net_path = ask_for_freight ().dapp_network.net_path;
	
	const proceeds = await fetch (`${ net_path }/view`, {
		method: "POST",
		headers: {
			"Content-Type": "application/json"
		},
		body: JSON.stringify (body)
	});	
	const result = await proceeds.json ()
	
	return { 
		result,
		result_string: JSON.stringify (result)
	};
}