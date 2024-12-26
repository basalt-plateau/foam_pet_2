



/*
	import { is_wallet_connected_ask_loop } from './screenplays/is_wallet_connected'
	const the_is_wallet_connected_ask_loop = is_wallet_connected_ask_loop ();
	the_is_wallet_connected_ask_loop.play ();
	the_is_wallet_connected_ask_loop.stop ();
*/



import { loop } from '$lib/taverns/loop'
import * as Flourisher from "$lib/Singles/Flourisher"		
	
let ledger_ask_count = 0;

export const is_wallet_connected_ask_loop = () => {
	return loop ({
		wait: 1000,
		wait_for_response: "yes",
		action: async () => {
			try {
				const flourisher_freight = Flourisher.freight ();
				const { wallet_core } = flourisher_freight;
				const is_connected = wallet_core.isConnected ();
				flourisher_freight.wallet_is_connected = is_connected ? "yes" : "no";
			}
			catch (imperfection) {
				console.info (imperfection);
			}
		}
	})
}