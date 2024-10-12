

/*

*/

/*
	https://github.com/aptos-labs/aptos-ts-sdk/blob/687e00152cc139f406182186fcd05b082dd70639/examples/typescript/custom_client.ts#L87
*/

import * as Aptos_SDK from "@aptos-labs/ts-sdk";


export const ask_for_Aptos_SDK = async ({
	net_path: null
}) {
	if (typeof net_path !== "string") {
		throw new Error (`The net_path received was not a string.`);
	}
	
	
	//
	//	https://github.com/aptos-labs/aptos-ts-sdk/blob/687e00152cc139f406182186fcd05b082dd70639/src/api/aptosConfig.ts
	//	https://github.com/search?q=repo%3Aaptos-labs%2Faptos-ts-sdk+fullnode%3A&type=code
	//
	const aptos = new Aptos_SDK.Aptos (new Aptos_SDK.AptosConfig ({		
		fullnode: net_path,
		network: Aptos_SDK.Network.CUSTOM
	}));
}