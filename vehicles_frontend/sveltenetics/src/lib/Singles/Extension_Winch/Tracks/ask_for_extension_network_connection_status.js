


/*
	import { ask_for_extension_network_connection_status } from './Tracks/ask_for_extension_network_connection_status'
	const extension_network_connection_status_track = ask_for_extension_network_connection_status ();
	extension_network_connection_status_track.play ();
	extension_network_connection_status_track.stop ();	
*/


////
//
import * as AptosSDK from "@aptos-labs/ts-sdk";
import _get from "lodash/get"
//
//
import { loop } from '$lib/taverns/loop'
import { request_ledger_info } from '$lib/PTO/General/Ledger_Info.API'
import { ask_for_freight } from '$lib/Versies/Trucks'
//
///

import * as Extension_Winch from "$lib/Singles/Extension_Winch"		
		
let ledger_ask_count = 0;

/*
	await Action ()
	await 2000
	await Action ()
	await 2000	
*/
export const ask_for_extension_network_connection_status = () => {
	return loop ({
		wait: 2000,
		wait_for_response: "yes",
		action: async () => {
			// console.info ("ask_for_extension_network_connection_status");
			
			/*
			
				This relies on "net_path"
			
			*/			
			const EWF = Extension_Winch.freight ();
			const net_path = _get (EWF, [ "stage", "network", "address" ], "");
			
			// console.log ({ net_path, network: EWF.stage.network.address });
			
			const there_is_a_net_path = typeof net_path === "string" && net_path.length >= 1;			
			if (there_is_a_net_path !== true) {
				console.info (`There's not a "net path" for the ledger loop.`)
				return;
			}

			// EWF.network_status
			
			ledger_ask_count += 1
			const current_ledger_ask_count = ledger_ask_count;
			
			try {
				// console.info ("waiting for ledger info");
				const { enhanced } = await request_ledger_info ({ net_path });
				// console.info ("got ledger info");
				
				
				//
				//	If the UI changed, after the ask, this filters
				//	the info that was returned from the ask.
				//
				if (ledger_ask_count == current_ledger_ask_count) {
					
					EWF.network_status.connected = "yes"
					EWF.network_status.aptos = new AptosSDK.Aptos (
						new AptosSDK.AptosConfig ({		
							fullnode: net_path,
							network: AptosSDK.Network.CUSTOM
						})
					)
					
					
					/*
						{
							"chain_id": 1,
							"epoch": "9824",
							"ledger_version": "2149518678",
							"oldest_ledger_version": "0",
							"ledger_timestamp": "1735948733871693",
							"node_role": "full_node",
							"oldest_block_height": "0",
							"block_height": "272890086",
							"git_hash": "b98e6b99260181e9efb3f65af1b15e6e043e0d30"
						}
					*/
					/*
						There should be assertions here..
					*/					
					EWF.network_status.status = enhanced;
					EWF.network_status.UTC_orbit = new Date (enhanced.ledger_timestamp / 1000).toUTCString ();
					
					return;
				}
			}
			catch (imperfection) {
				console.error (imperfection);
			}
			
			EWF.network_status.connected = "no"
			EWF.network_status.aptos = {}
			EWF.network_status.status = {};
			EWF.network_status.UTC_orbit = ""
		}
	})
}