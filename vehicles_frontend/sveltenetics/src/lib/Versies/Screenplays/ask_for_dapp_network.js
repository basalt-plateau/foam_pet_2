

import { has_field } from 'procedures/object/has_field'

const nets = Object.freeze ({
	"mainnet": {
		"name": "mainnet",
		"path": "https://api.mainnet.aptoslabs.com/v1",
		"chain_id": "1"
	},
	"testnet": {
		"name": "testnet",
		"path": "https://api.testnet.aptoslabs.com/v1",
		"chain_id": ""
	},
	"devnet": {
		"name": "devnet",
		"path": "https://api.devnet.aptoslabs.com/v1",
		"chain_id": ""
	},
	"other": {
		"name": "other",
		"path": "",
		"chain_id": ""
	}
});

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
	if (
		typeof localStorage.net_name === "string" &&
		typeof localStorage.net_path === "string"
	) {
		if (has_field (nets, localStorage.net_name)) {
			net_name = localStorage.net_name;
			net_path = localStorage.net_path;
			chain_id = nets [ net_name ] ["chain_id"]
		}
	}
	
	return {
		net_path,
		net_name,
		chain_id
	}
}

