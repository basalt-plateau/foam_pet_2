

import * as Aptos_SDK from "@aptos-labs/ts-sdk";
import { Uint8Array_from_string } from '$lib/taverns/hexadecimal/Uint8Array_from_string'
import { address_to_hexadecimal } from "$lib/PTO/Address/to_hexadecimal"
import { find_transaction_by_hash_loop } from '$lib/PTO/Transaction/find_by_hash_loop'
	

/*
	window.petra
		prototype
			prototype
				isConnected
*/
export const Petra_stage_creator = async ({ freight }) => {
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
		name: "Petra",
		url: "https://petra.app",
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
			
			/*
			const transaction = {
				arguments: [address, '717'],
				function: '0x1::coin::transfer',
				type: 'entry_function_payload',
				type_arguments: ['0x1::aptos_coin::AptosCoin'],
			};
			*/


			try {
				//
				//	Send the petition
				//
				//
				const pending_transaction = await (window).aptos.signAndSubmitTransaction (petition);
				const pending_transaction_hash = pending_transaction.hash;
				console.info ({ pending_transaction, pending_transaction_hash });
				
				find_transaction_by_hash_loop ({
					bracket: {
						net_path: stage.network.address,
						transaction_hash: pending_transaction_hash
					},
					
					found () {
						console.log ("found");
					},
					otiose () {
						console.log ("otiose");
					}
				});
				
				return;
				
				//
				//	Wait for the results of the petition.
				//
				//
				const network = await Petra.getNetwork ();
				const aptos_client = new Aptos_SDK.Aptos (new Aptos_SDK.AptosConfig ({		
					fullnode: network.address,
					network: Aptos_SDK.Network.CUSTOM
				}));
				
				
				// const client = new Aptos_SDK.AptosClient (network.address);
				console.log ("waiting for transaction")
				const txn = await aptos_client.waitForTransactionWithResult (pending_transaction.hash);
				console.log ({ txn });
			} 
			catch (imperfection) {
				console.error (imperfection);
			}
			
			
			return;
			
			const origin_address = address_to_hexadecimal (stage.account.address);
			const to_address = "991378D74FAC384404B971765BEF7525CCE26C8EFD84B9FF27D202E10D7FFBE5";
			
			console.log ({
				origin_address,
				to_address
			});			
			
			const aptos = new Aptos_SDK.Aptos (new Aptos_SDK.AptosConfig ({		
				fullnode: "https://api.devnet.aptoslabs.com/v1",
				network: Aptos_SDK.Network.CUSTOM
			}));
			
			const functionArguments = [
				Aptos_SDK.AccountAddress.from (
					Uint8Array_from_string (to_address)
				),
				BigInt ("100000")
			]
			
			console.log ({ functionArguments });
			
			const tx = await aptos.transaction.build.simple ({
				sender: Aptos_SDK.AccountAddress.from (
					Uint8Array_from_string (origin_address)
				),
				data: {
					function: "0x1::aptos_account::transfer",
					typeArguments: [],
					functionArguments
				}
			});
			
			// signAndSubmitTransaction
			await Petra.signAndSubmitTransaction ({
				payload: tx
			});

			
			// await Petra.signTransaction (tx);
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
				if (stage.installed !== "yes") {
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
			try {
				if (typeof Petra === "object") {
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
				if (Petra.isConnected () === true) {
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