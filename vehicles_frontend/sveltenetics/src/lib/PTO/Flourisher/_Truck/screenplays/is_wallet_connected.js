



/*
	import { is_wallet_connected_ask_loop } from './screenplays/is_wallet_connected'
*/



import { loop } from '$lib/taverns/loop'
import { ask_for_signatory_freight } from "./../../index.js"
		

let ledger_ask_count = 0;

export const is_wallet_connected_ask_loop = () => {
	return loop ({
		wait: 1000,
		wait_for_response: "yes",
		action: async () => {
			try {
				const signatory_freight = ask_for_signatory_freight ();
				console.log ({ signatory_freight });
			}
			catch (imperfection) {
				console.info (imperfection);
			}
			
			/*
			const net_path = freight.net_path;
			
			const there_is_a_net_path = typeof net_path === "string" && net_path.length >= 1;
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
					
					// const { chain_id: _chain_id } = enhanced;
					// chain_id = _chain_id;
					// block_height = enhanced.block_height;
					// epoch = enhanced.epoch;
				}
			}
			catch (exception) {
				freight.net_connected = "no"
			}
			
			*/
		}
	})
}