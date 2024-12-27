


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


const prepare_the_bridge = async ({ freight }) => {
	const wallets_list = ask_for_wallets_list ({ EW_Freight: freight });
	
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
		try {
			const wallet = wallets_list.find (w => {
				return w.name === extension_winch_connected
			});
			
			await wallet.connect ({ freight });
			
			bridge = wallet;
			bridge_is_connected = "yes"		
			
			window.wallet_bridge = wallet;
		}
		catch (imperfection) {
			console.error (imperfection);
			localStorage.removeItem ("extension winch connected");
		}
	}
	
	return { bridge, bridge_is_connected, wallets_list };
}

/*
	This adds a truck to the trucks object as trucks [1] = ...
	Such, the truck can then be deleted with the "destroy" method.
*/
export const make = async () => {
	const rise = window.rise;
	
	
	const rise_bridge = {
		name: "Rise",
		icon: "",
		installed: "yes",
		network: {
			name: "",
			address: "",
			chain_id: ""
		},
		account: {
			address: "",
			public_key: ""
		},	
		async status () {
			const this_bridge = trucks [1].freight.bridge;
			
			this_bridge.installed = this.is_installed ();
			this_bridge.connected = this.is_connected ();

			const account = await rise.account ();
			this_bridge.account.address = account.address;
			this_bridge.account.public_key = account.publicKey;
			
			const network = await rise.network ();
			this_bridge.network.name = network.name;
			this_bridge.network.address = network.api;
			this_bridge.network.chain_id = network.chainId;
		},
		is_installed () {
			try {
				if (rise.isRise === true) {
					return "yes";
				}
			}
			catch (imperfection) {}
			return "no";
		},
		is_connected () {
			const this_bridge = trucks [1].freight.bridge;
			if (this_bridge.is_installed () !== "yes") { return "no" }
			
			try {
				if (rise.isConnected () === true) {
					return "yes";
				}
			}
			catch (imperfection) {}
			return "no";
		},
		async connect () {
			const this_bridge = trucks [1].freight.bridge;

			
			await rise.connect ();
			await this_bridge.status ();
			
			rise.onAccountChange (account => {
				console.log ("onAccountChange bridges:", { account });
				this_bridge.status ();
			});
			rise.onNetworkChange (network => {
				console.log ("onNetworkChange bridges:", { network });
				this_bridge.status ();
			});
		},
		disconnect () {
			rise.removeAllListeners ();
		}
	}
	
	/*
		Freight is the "state" or the object that is
		is monitored.
	*/
	trucks [1] = build_truck ({
		freight: {
			wallets_list: [ rise_bridge ],
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
	
	
	trucks [1].freight.check_for_local_storage_connection ();
	
	window.extension_winch = trucks [1].freight;

	

	/*
	setTimeout (() => {
		trucks [1].freight.bridge_2	= null;
		trucks [1].freight.bridge_2	= Object.create ({
			network: {
				name: "mainnet"
			},
			fonction () {
				console.log ("bridge_2 fonction");
				this.network.name = "another net.."
			}
		});
	}, 3000)
	*/
	
	setTimeout (() => {
		console.log ("calling bridge fonction", trucks [1].freight.bridge);
		// trucks [1].freight.bridge_2.network.name = "network name......"
		// trucks [1].freight.bridge_2.fonction ();
		// trucks [1].freight.bridge.status ();
		
		// trucks [1].freight.wallets_list.push ({ wallet: ".." })		
	}, 5000)
	
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
			console.info ("😃 extension winch changed", { original_freight, property, value })
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