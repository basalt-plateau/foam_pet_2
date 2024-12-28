


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
//
import { build_truck } from '@visiwa/trucks'
//
//
import { ask_for_wallets_list } from "./Wallets/ask_for_list.js"
import { is_wallet_connected_ask_loop } from './_Truck/screenplays/is_wallet_connected'
//
import { send_to_extension } from './Petition/send_to_extension.js'
//


const trucks = {}
	
let the_is_wallet_connected_ask_loop = ""	


import { Rise_stage_creator } from "./Stages/Rise.js"
import { Pontem_stage_creator } from "./Stages/Pontem.js"


/*
	This adds a truck to the trucks object as trucks [1] = ...
	Such, the truck can then be deleted with the "destroy" method.
*/
export const make = async () => {
	
	
	
	/*
		Freight is the "state" or the object that is
		is monitored.
	*/
	trucks [1] = build_truck ({
		freight: {
			wallets_list: [],
			bridge: null,
			bridge_is_connected: "no",
			
			/*
				This is meant to be called after
				build_truck is called.
			*/
			async check_for_local_storage_connection () {
				const freight = trucks [1].freight;
				
				const extension_winch_connected = localStorage.getItem ("extension winch connected");
				if (
					typeof extension_winch_connected === "string" && 
					extension_winch_connected.length >= 1
				) {
					try {
						const wallet = freight.wallets_list.find (w => {
							return w.name === extension_winch_connected
						});
						
						
						freight.bridge = wallet;
						await wallet.connect ({ freight });
						
						freight.bridge_is_connected = "yes"		
						// window.wallet_bridge = wallet;
						return;
					}
					catch (imperfection) {
						console.error (imperfection);
					}
					
					localStorage.removeItem ("extension winch connected");
				}
				
			},

			connect: async ({ wallet_name }) => {	
				console.log ("extension winch connect", { wallet_name });
		
				trucks [1].freight.bridge = trucks [1].freight.wallets_list.find (w => {
					return w.name === wallet_name
				});
		
				await trucks [1].freight.bridge.connect ();
				trucks [1].freight.bridge_is_connected = "yes"
				localStorage.setItem ("extension winch connected", trucks [1].freight.bridge.name);
			},
			disconnect: async () => {
				console.log ("disconnect");
				
				if (trucks [1].freight.bridge_is_connected === "yes") {
					await trucks [1].freight.bridge.disconnect ();
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
	const { bridge, bridge_is_connected, wallets_list } = await prepare_the_bridge ({ freight: trucks [1].freight });
	trucks [1].freight.bridge = bridge;
	trucks [1].freight.bridge_is_connected = bridge_is_connected;
	trucks [1].freight.wallets_list = wallets_list;
	*/
	
	const Rise_stage = Rise_stage_creator ({ freight: trucks [1].freight });
	const Pontem_stage = Pontem_stage_creator ({ freight: trucks [1].freight });

	trucks [1].freight.wallets_list.push (Rise_stage)
	trucks [1].freight.wallets_list.push (Pontem_stage)
	
	trucks [1].freight.check_for_local_storage_connection ();
	
	window.extension_winch = trucks [1].freight;


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
	// supervisor, manager
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
			console.info ("😃 extension winch changed", property, value)
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