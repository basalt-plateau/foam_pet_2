
/*
	import { the_ledger_ask_loop } from './Screenplays/is_connected'
*/


////
//
import * as AptosSDK from "@aptos-labs/ts-sdk";
//
//
import { loop } from '$lib/taverns/loop'
import { request_ledger_info } from '$lib/PTO/General/Ledger_Info.API'
import { ask_for_freight } from '$lib/Versies/Trucks'
//
///

let ledger_ask_count = 0;

/*
	await Action ()
	await 2000
	await Action ()
	await 2000	
*/
export const the_ledger_ask_loop_creator = () => {
	return loop ({
		wait: 2000,
		wait_for_response: "yes",
		action: async () => {
			const freight = ask_for_freight ();
			const net_path = freight.wallet.net_path;
			const there_is_a_net_path = typeof net_path === "string" && net_path.length >= 1;
			
			
			/*
			
				This relies on "net_path"
			
			*/
			if (there_is_a_net_path !== true) {
				console.info (`There's not a "net path" for the ledger loop.`)
				return;
			}
			
			ledger_ask_count += 1
			const current_ledger_ask_count = ledger_ask_count;
			
			try {
				const { enhanced } = await request_ledger_info ({ net_path })
				//
				//	If the UI changed, after the ask, this filters
				//	the info that was returned from the ask.
				//
				if (ledger_ask_count == current_ledger_ask_count) {
					freight.net_connected = "yes"
					
					freight.consensus.connected = "yes"
					freight.consensus.aptos = new AptosSDK.Aptos (
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
					freight.consensus.status = enhanced;
					freight.consensus.UTC_orbit = new Date (enhanced.ledger_timestamp / 1000).toUTCString ();
					
					return;
				}
			}
			catch (imperfection) {
				console.error (imperfection);
			}
			
			freight.consensus.connected = "no"
			freight.consensus.status = {};
			freight.consensus.UTC_orbit = ""
		}
	})
}