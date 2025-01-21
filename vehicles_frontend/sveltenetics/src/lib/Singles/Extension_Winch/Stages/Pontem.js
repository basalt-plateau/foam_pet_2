
////
//
import * as Aptos_SDK from "@aptos-labs/ts-sdk";
import _get from "lodash/get"
//
//
import { Uint8Array_from_string } from '$lib/taverns/hexadecimal/Uint8Array_from_string'
//
////

import { address_to_hexadecimal } from "$lib/PTO/Address/to_hexadecimal"
	

export const Pontem_stage_creator = async ({ freight }) => {
	const Pontem = window.pontem;
	
	const _stage = () => {
		return freight.stages.Pontem;
	}
	
	const reset = async () => {
		const stage = _stage ();
					
		stage.account.address = "";
		stage.account.public_key = "";
		
		stage.network.name = "";
		stage.network.address = "";
		stage.network.chain_id = "";
	}
	
	return {
		name: "Pontem",
		url: "https://pontem.network",
		icon: "",
		installed: "",
		network: {
			name: "",
			address: "",
			chain_id: ""
		},
		account: {
			address: "",
			public_key: ""
		},	
		
		// prompting
		async prompt ({ petition }) {
			console.info ({ petition });
			
			//
			// signTransaction -- raw transaction
			// signAndSubmitTransaction -- 
			//
			//		https://github.com/aptos-foundation/AIPs/blob/main/aips/aip-62.md
			//
			
			const stage = _stage ();
			const pending_transaction = await Pontem.signAndSubmit (petition);
			
			console.log ({ pending_transaction });
			
			
			const pending_transaction_hash = _get (pending_transaction, [ "result", "hash" ], "");
			
			return {
				pending_transaction_hash
			}
		},
		
		async status () {
			try {
				const stage = _stage ();
				
				stage.installed = await stage.is_installed ();
				if (stage.installed !== "yes") {
					stage.connected = "no"
					reset ();
					return;
				}
				
				stage.connected = await stage.is_connected ();
				if (stage.connected !== "yes") {
					reset ();
					return;
				}

				stage.account.address = await Pontem.account ();
				stage.account.public_key = await Pontem.publicKey ();
				
				const network = await Pontem.network ();
				console.log ({ network });
				
				stage.network.name = network.name;
				stage.network.address = network.api;
				stage.network.chain_id = network.chainId;
			}
			catch (imperfection) {
				console.error (imperfection);
			}
		},
		async is_installed () {
			try {
				if (typeof Pontem.version === "string") {
					return "yes";
				}
			}
			catch (imperfection) {}
			return "no";
		},
		async is_connected () {
			const stage = _stage ();
			
			if (await stage.is_installed () !== "yes") { return "no" }
			
			try {
				if (Pontem.isConnected () === true) {
					return "yes";
				}
			}
			catch (imperfection) {}
			return "no";
		},
		async connect () {
			const stage = _stage ();

			await Pontem.connect ();
			await stage.status ();
			
			Pontem.onAccountChange (account => {
				console.log ("Pontem onAccountChange bridges:", { account });
				stage.status ();
			});
			Pontem.onNetworkChange (network => {
				console.log ("Pontem onNetworkChange bridges:", { network });
				stage.status ();
			});
		},
		async disconnect () {
			try {
				Pontem.eventListeners.onAccountChange = []
				Pontem.eventListeners.onNetworkChange = []		
			}	
			catch (imperfection) {
				console.error (imperfection);
			}
		}
	};
}