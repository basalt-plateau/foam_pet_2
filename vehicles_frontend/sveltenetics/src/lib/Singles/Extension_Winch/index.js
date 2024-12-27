


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
export const make = async () => {
	const { wallet_core } = ask_for_the_config ();
	const wallets_list = ask_for_wallets_list ({ wallet_link: wallet_core });
	
	
	/*
		asks:
			* connected to choosen wallet bridge in the background	
	*/
	let bridge = null;
	let bridge_is_connected = "no"
	const extension_winch_connected = localStorage.getItem ("extension winch connected");
	if (
		typeof extension_winch_connected === "string" && 
		extension_winch_connected.length >= 1
	) {
		const wallet = wallets_list.find (w => {
			return w.name === extension_winch_connected
		});
		
		await wallet.connect ();
		bridge_is_connected = "yes"
		window.wallet_bridge = wallet;
		
		bridge = wallet;
	}
	
	
	/*
		Freight is the "state" or the object that is
		is monitored.
	*/
	trucks [1] = build_truck ({
		freight: {
			wallet_core,
			wallets_list,
			
			bridge,
			bridge_is_connected,
			
			connect: async ({ wallet }) => {	
				console.log ("extension winch connect", { wallet });
		
				await wallet.connect ();
				trucks [1].freight.bridge = wallet;
				trucks [1].freight.bridge_is_connected = "yes"
				localStorage.setItem ("extension winch connected", wallet.name);
			},
			disconnect: async () => {
				console.log ("disconnect");
				
				if (trucks [1].freight.bridge_is_connected === "yes") {
					trucks [1].freight.bridge = null;
					trucks [1].freight.bridge_is_connected = "no"
					localStorage.removeItem ("extension winch connected");
					return;
				}
				
				console.error ("There doesn't seem to be a wallet bridge connected.");				
			},
			
			//
			// vintage
			send_to_extension,
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