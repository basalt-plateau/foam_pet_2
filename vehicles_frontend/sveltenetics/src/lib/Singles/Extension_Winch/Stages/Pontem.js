
////
//
import * as Aptos_SDK from "@aptos-labs/ts-sdk";
import { Uint8Array_from_string } from '$lib/taverns/hexadecimal/Uint8Array_from_string'
//
////

import { address_to_hexadecimal } from "$lib/PTO/Address/to_hexadecimal"
	

export const Pontem_stage_creator = async ({ freight }) => {
	const Pontem = window.pontem;
	
	const _stage = () => {
		return freight.stages.Pontem;
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
			
			/*
			const origin_address = address_to_hexadecimal (stage.account.address);
			const to_address = "991378D74FAC384404B971765BEF7525CCE26C8EFD84B9FF27D202E10D7FFBE5";
			
			console.log ({
				origin_address,
				to_address
			});			
			
			const aptos = new Aptos_SDK.Aptos (new Aptos_SDK.AptosConfig ({		
				fullnode: "https://fullnode.devnet.aptoslabs.com/v1",
				network: Aptos_SDK.Network.CUSTOM
			}));
			
			const functionArguments = [
				Aptos_SDK.AccountAddress.from (
					Uint8Array_from_string (to_address)
				),
				BigInt ("100000")
			]
			
			console.log ({ functionArguments });
			
			const tx1 = await aptos.transaction.build.simple ({
				sender: Aptos_SDK.AccountAddress.from (
					Uint8Array_from_string (origin_address)
				),
				data: {
					function: "0x1::aptos_account::transfer",
					typeArguments: [],
					functionArguments
				}
			});
			*/


			try {
				const result = await Pontem.signAndSubmit (petition)
			} 
			catch (e) {
				console.log(e);
			}
			
			/*
			await Pontem.signAndSubmitTransaction ({
				payload: tx
			});
			*/
			
			// await Pontem.signTransaction (tx);
		},
		
		async status () {
			const stage = _stage ();
			
			stage.installed = await stage.is_installed ();
			if (stage.installed !== "yes") {
				stage.connected = "no"
				
				stage.account.address = "";
				stage.account.public_key = "";
				
				stage.network.name = "";
				stage.network.address = "";
				stage.network.chain_id = "";
				
				return;
			}
			
			stage.connected = await stage.is_connected ();

			stage.account.address = await Pontem.account ();
			stage.account.public_key = await Pontem.publicKey ();
			
			const network = await Pontem.network ();
			console.log ({ network });
			
			stage.network.name = network.name;
			stage.network.address = network.api;
			stage.network.chain_id = network.chainId;
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
			Pontem.eventListeners.onAccountChange = []
			Pontem.eventListeners.onNetworkChange = []			
		}
	};
}