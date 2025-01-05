




/*

*/
export const ask_for_dapp_network = () => {

	/*
		Asks..
			check local storage for:
				* dapp_net_path
				* dapp_net_name
				* dapp_chain_id				
	*/
	
	let net_path = "https://api.mainnet.aptoslabs.com/v1"
	let net_name = "mainnet"
	let chain_id = "1"
	
	return {
		net_path,
		net_name,
		chain_id
	}
}

