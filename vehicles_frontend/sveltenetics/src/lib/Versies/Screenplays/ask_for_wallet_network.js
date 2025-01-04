

import * as Extension_Winch from "$lib/Singles/Extension_Winch"		

/*

*/
export const ask_for_wallet_network = () => {
	//
	//	This should check if a wallet is connected.
	//		Nope -> mainnet
	//		Yep ->  wallet consensus address
	//
	let net_path = "https://api.mainnet.aptoslabs.com/v1"
	let net_name = "mainnet"
	let chain_id = "1"
	const EWF = Extension_Winch.freight ();
	if (EWF.stage_name_connected.length >= 1) {
		console.info ("There is a wallet connected.");
		
		try {
			const stage = EWF.ask_for_stage ();
			
			net_path = stage.network.address;
			net_name = stage.network.name;	
			chain_id = stage.network.chain_id;					
		} 
		catch (imperfection) {
			console.error (imperfection);
		}		
	}	
	
	return {
		net_path,
		net_name,
		chain_id
	}
}

