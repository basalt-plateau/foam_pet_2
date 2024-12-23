


/*
	import { make_the_flourisher, destroy_the_flourisher } from "$lib/Singles/Flourisher.js"
	make_the_flourisher ();
	destroy_the_flourisher ();
*/

/*
	import { ask_for_flourisher_freight, ask_for_flourisher_monitor } from "$lib/Singles/Flourisher.js"
	
	const flourisher = ask_for_flourisher_freight ();
	let flourisher_monitor = ask_for_flourisher_monitor (async ({
		original_freight,
		pro_freight, 
		//
		target,
		//
		property, 
		value
	}) => {
		flourisher = pro_freight;
	});
	flourisher_monitor.stop ()
*/


//
//
import { WalletCore } from "@aptos-labs/wallet-adapter-core";
//
//
import { build_truck } from '@visiwa/trucks'
//
//
import { ask_for_wallets_list } from "$lib/Singles/Flourisher/Wallets/ask_for_list.js"
//
//
import { is_wallet_connected_ask_loop } from './_Truck/screenplays/is_wallet_connected'
import { ask_for_the_config } from "./config"
//
//


const trucks = {}
	
let the_is_wallet_connected_ask_loop = ""	
	
/*
	This adds a truck to the trucks object as trucks [1] = ...
	Such, the truck can then be deleted with the "destroy" method.
*/
export const make_the_flourisher = () => {
	const network = "";
	
	const { plugins, opt_in_wallets } = ask_for_the_config ();
	console.log ({ plugins, opt_in_wallets })
	
	// const flourisher = await Flourisher ();
	// const wallet_connected_ask_loop = is_wallet_connected_ask_loop ();
	// wallet_connected_ask_loop.play ();
	
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

export const destroy_the_flourisher = () => {
	the_is_wallet_connected_ask_loop.stop ();
	delete trucks [1];
}

export const ask_for_flourisher_freight = () => {
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
export const ask_for_flourisher_monitor = (action) => {	
	return trucks [1].monitor (envelope => { action (envelope); });
}