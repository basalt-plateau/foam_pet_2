



import * as Aptos_SDK from "@aptos-labs/ts-sdk";
import _get from "lodash/get"
import { Uint8Array_from_string } from '$lib/taverns/hexadecimal/Uint8Array_from_string'
import { address_to_hexadecimal } from "$lib/PTO/Address/to_hexadecimal"

import { request_ledger_info } from '$lib/PTO/General/Ledger_Info.API'






/*
	window.petra
		prototype
			prototype
				isConnected
*/
export const Dev_stage_creator = async ({ freight }) => {
	const _stage = () => {
		return freight.stages.Dev;
	}
	
	const reset = async () => {
		const stage = _stage ();
					
		stage.account.address = "";
		stage.account.public_key = "";
		
		stage.network.name = "";
		stage.network.address = "";
		stage.network.chain_id = "";
	}
	
	const net_path = "https://api.devnet.aptoslabs.com/v1";
	
	const account = {
		private_key: "0C1218C9ABC123C812359AB7689AB765C89EABCAD9E8CBE9F8CBE9DABC8F152C",
		public_key: "83918D60A9344D117F6EA231DA15ACEB43711124976E6EC4AC5BC7C4BC772ED5",
		address: "991378D74FAC384404B971765BEF7525CCE26C8EFD84B9FF27D202E10D7FFBE5",
		address_legacy: "2F75DA076414103C721D195B0376C66897593B1F4E961671099A2DC9A24ADCFD"
	};
	
	return {
		name: "Dev",
		url: "",
		icon: "",

		installed: "yes",
		connected: "",
		
		network: {
			name: "",
			address: "",
			chain_id: ""
		},
		account: {
			address: "",
			public_key: "",
			private_key: ""
		},	
		
		async change_account () {
			
		},
		
		async prompt ({ petition }) {
			const stage = _stage ();
			
			const aptos = new Aptos_SDK.Aptos (new Aptos_SDK.AptosConfig ({		
				fullnode: net_path,
				network: Aptos_SDK.Network.CUSTOM
			}));
			console.info ({ petition });
			
			
			const tx_petition = await aptos.transaction.build.simple ({
				sender: stage.account.address,
				data: {
					function: petition.function,
					functionArguments: petition.arguments,
					typeArguments: petition.type_arguments
				}
			});
			
			const consenter = AptosSDK.Account.fromPrivateKey ({ 
				privateKey: new AptosSDK.Ed25519PrivateKey (
					Uint8Array_from_string (stage.account.private_key)
				), 
				legacy: true
			});
			
			console.info ({
				signer: stage.account.address,
				transaction: tx_petition
			});
			
			const consent = aptos.transaction.sign ({
				signer: consenter,
				transaction: tx_petition
			});
			const committedTransaction = await aptos.transaction.submit.simple({
				transaction: tx_petition,
				senderAuthenticator: consent
			});
			const pending_transaction_hash = committedTransaction.hash;
			
			console.info ({ committedTransaction });
			
			// const pending_transaction = await (window).aptos.signAndSubmitTransaction (petition);
			// const pending_transaction_hash = _get (pending_transaction, "hash", "");
			
			/**/
			return { pending_transaction_hash }			
		},
		
		async status () {
			const stage = _stage ();

			const aptos = new Aptos_SDK.Aptos (new Aptos_SDK.AptosConfig ({		
				fullnode: net_path,
				network: Aptos_SDK.Network.CUSTOM
			}));
			
			const { enhanced } = await request_ledger_info ({ net_path })
			console.info ({ enhanced });
			
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

				stage.account.address = account.address_legacy;
				stage.account.public_key = account.public_key;
				stage.account.private_key = account.private_key;
				
				stage.network.name = "devnet";
				stage.network.address = net_path;
				stage.network.chain_id = enhanced.chain_id;
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
			if (stage.connected === "yes") { return "yes" }
			return "no"
		},
		async connect () {
			const stage = _stage ();
			
			stage.connected = "yes";
			
			await stage.status ();
		},
		async disconnect () {
			const stage = _stage ();
			stage.connected = "no";
		}
	}
}