

import * as Aptos_SDK from "@aptos-labs/ts-sdk";
import { Uint8Array_from_string } from '$lib/taverns/hexadecimal/Uint8Array_from_string'
import { address_to_hexadecimal } from "$lib/PTO/Address/to_hexadecimal"

import _get from "lodash/get"

/*
	window.petra
		prototype
			prototype
				isConnected
*/
export const Dev_stage_creator = async ({ freight }) => {
	const Petra = window.petra;
	
	const _stage = () => {
		return freight.stages.Petra;
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
		name: "Dev Wallet",
		url: "",
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
		
		async prompt ({ petition }) {
			const stage = _stage ();
			
			const aptos = new Aptos_SDK.Aptos (new Aptos_SDK.AptosConfig ({		
				fullnode: net_path,
				network: Aptos_SDK.Network.CUSTOM
				// client: { provider: custom_client }
			}));
			
			const TP_AO = await aptos.transaction.build.simple (petition);
			
			// const pending_transaction = await (window).aptos.signAndSubmitTransaction (petition);
			// const pending_transaction_hash = _get (pending_transaction, "hash", "");
			
			/**/
			return { pending_transaction_hash }			
		},
		
		async status () {
			const stage = _stage ();
			
			try {
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

				const account = await Petra.account ();
				stage.account.address = account.address;
				stage.account.public_key = account.publicKey;
				
				const network = await Petra.getNetwork ();
				stage.network.name = network.name;
				stage.network.address = network.url;
				stage.network.chain_id = network.chainId;
			}
			catch (imperfection) {
				console.error ("status imperfection:", imperfection);
			}
		},
		async is_installed () {
			return "yes";
		},
		async is_connected () {
			const stage = _stage ();
			if (await stage.is_installed () !== "yes") { return "no" }
			
			try {
				if (await Petra.isConnected () === true) {
					return "yes";
				}
			}
			catch (imperfection) {}
			return "no";
		},
		async connect () {
			const stage = _stage ();

			await Petra.connect ();
			await stage.status ();
			
			
			Petra.onAccountChange (account => {
				console.log ("onAccountChange bridges:", { account });
				stage.status ();
			});
			
			
			Petra.onNetworkChange (network => {
				console.log ("onNetworkChange bridges:", { network });
				stage.status ();
			});
			
			//
			// presumably this listens for a disconnect
			// that begins in the wallet
			//
			Petra.onDisconnect (() => {
				console.log ("Petra onDisconnect");
				reset ();
			});
		},
		async disconnect () {
			try {
				Petra.transport.eventCallbacks.accountChange = []	
				Petra.transport.eventCallbacks.networkChange = []	
				Petra.transport.eventCallbacks.disconnect = []									
			}	
			catch (imperfection) {
				console.error (imperfection);
			}
			
			

			
			// Petra.removeAllListeners ();
			Petra.disconnect ()
		}
	}
}