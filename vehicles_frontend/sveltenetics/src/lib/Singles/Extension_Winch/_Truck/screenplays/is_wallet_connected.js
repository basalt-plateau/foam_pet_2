



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
			

		}
	})
}