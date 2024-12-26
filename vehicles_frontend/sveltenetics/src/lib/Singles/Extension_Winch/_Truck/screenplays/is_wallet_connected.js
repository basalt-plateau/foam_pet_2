



/*
	import { is_wallet_connected_ask_loop } from './screenplays/is_wallet_connected'
	const the_is_wallet_connected_ask_loop = is_wallet_connected_ask_loop ();
	the_is_wallet_connected_ask_loop.play ();
	the_is_wallet_connected_ask_loop.stop ();
*/



import { loop } from '$lib/taverns/loop'
import * as Extension_Winch from "$lib/Singles/Extension_Winch"		
	
let ledger_ask_count = 0;

export const is_wallet_connected_ask_loop = () => {
	return loop ({
		wait: 1000,
		wait_for_response: "yes",
		action: async () => {
			
			let wallet_core;
			let flourisher_freight;
			
			try {
				flourisher_freight = Extension_Winch.freight ();
				wallet_core = flourisher_freight.wallet_core;			
			}
			catch (imperfection) {
				console.error (imperfection);
				return;
			}
			
			try {
				flourisher_freight.wallet_is_connected = wallet_core.isConnected () ? "yes" : "no";
				
			}
			catch (imperfection) {
				console.info (imperfection);
			}
		}
	})
}