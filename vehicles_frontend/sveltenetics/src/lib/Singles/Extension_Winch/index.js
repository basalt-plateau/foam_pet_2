


/*
	import { make_the_flourisher, destroy_the_flourisher } from "$lib/Singles/Extension_Winch"
	make_the_flourisher ();
	destroy_the_flourisher ();
*/

/*
	import { onMount, onDestroy } from "svelte"
	import * as Extension_Winch from "$lib/Singles/Extension_Winch"		
	
	let flourisher_freight = Extension_Winch.freight ();
	let flourisher_monitor;
	onMount (async () => {
		flourisher_monitor = Extension_Winch.monitor (async ({
			original_freight,
			pro_freight, 
			//
			target,
			//
			property, 
			value
		}) => {
			flourisher_freight = pro_freight;
		});
	});
	onDestroy (async () => {
		flourisher_monitor.stop ()
	});
*/


//
//
import { WalletCore } from "@aptos-labs/wallet-adapter-core";
//
//
import { build_truck } from '@visiwa/trucks'
//
//
import { ask_for_wallets_list } from "./Wallets/ask_for_list.js"
import { is_wallet_connected_ask_loop } from './_Truck/screenplays/is_wallet_connected'
import { ask_for_the_config } from "./config"
//
import { send_to_extension } from './Petition/send_to_extension.js'
//


const trucks = {}
	
let the_is_wallet_connected_ask_loop = ""	
	
/*
	This adds a truck to the trucks object as trucks [1] = ...
	Such, the truck can then be deleted with the "destroy" method.
*/
export const make = () => {
	const network = "";
	
	const { plugins, opt_in_wallets } = ask_for_the_config ();
	console.log ({ plugins, opt_in_wallets })
	
	const wallet_core = new WalletCore (
		plugins,
		opt_in_wallets
		// dappConfig,
		// disableTelemetry
	);
	
	const wallets_list = ask_for_wallets_list ({ wallet_link: wallet_core });
	
	
	
	const wallet_is_connected = wallet_core.isConnected () ? "yes" : "no";
	
	const AptosWalletName = localStorage.getItem ("AptosWalletName");
	if (AptosWalletName && wallet_is_connected !== "yes") {
		wallet_core.connect (AptosWalletName);
	}
	
	console.info ({ wallet_core });
	
	
	/*
		Freight is the "state" or the object that is
		is monitored.
	*/
	trucks [1] = build_truck ({
		freight: {
			network,
			
			wallet_core,
			wallets_list,
			
			wallet_is_connected,
			
			
			/*
				suggest ({
					
				});
			*/
			send_to_extension,
			
			/*
				flourisher_freight.wallet = wallet;
				flourisher_freight.connect ({ wallet });
			*/
			connect: async ({ wallet }) => {
				const wallet_name = wallet.name;
				console.log ("connect_wallet:", { wallet });
				console.log ("wallet name:", wallet_name);
				
				//
				//	connect with wallet_link
				//
				//
				console.info ({ wallet_core });				
				const proceeds = await wallet_core.connect (wallet_name);
				console.log ({ proceeds });
				
				
				//
				//	check if is connected..
				//
				//
				const is_connected = wallet_core.isConnected () ? "yup" : "no";
				console.log ({ is_connected });
				
				
				//	Add to localStorage
				//
				localStorage.setItem ("AptosWalletName", wallet_name);
				
				// trucks [1].freight.wallet = wallet;
			}
		}
	});
	
	
	
	/*
		Changes to the freight can be monitored here:
		
			* 	original_freight: 
					is the "freight" object that was passed to:
					build_truck ({ freight });

			* 	pro_freight:
					is the proxy object that encapsulates
					the original_freight for monitoring purposes.
			
			* 	bracket: the bracket or sub-bracket where the change occurred.
			
			* 	property: the property that changed
			* 	value: the value that changed
	*/
	let monitor = trucks [1].monitor (async ({
		original_freight,
		pro_freight, 
		//
		bracket,
		//
		property, 
		value
	}) => {
		try {

		}
		catch (imperfection) {
			console.error (imperfection);
		}
	});
	
	the_is_wallet_connected_ask_loop = is_wallet_connected_ask_loop ();
	the_is_wallet_connected_ask_loop.play ();
	
	return trucks [1];	
}

export const destroy = () => {
	the_is_wallet_connected_ask_loop.stop ();
	delete trucks [1];
}

export const freight = () => {
	return trucks [1].freight;
}

export const retrieve = () => {
	return trucks [1];
}


/*
	Changes to the freight can also be monitored like this.
	This adds another monitor each time "monitor" is called.
	
	An example implementation can be found below.
*/
/*
	let flourisher_monitor = ask_for_flourisher_monitor ();
	flourisher_monitor.stop ()
*/
export const monitor = (action) => {	
	return trucks [1].monitor (envelope => { action (envelope); });
}