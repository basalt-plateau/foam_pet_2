


/*
	import { make_the_flourisher, destroy_the_flourisher } from "$lib/PTO/Flourisher.js"
	make_the_flourisher ();
	destroy_the_flourisher ();
*/

/*
	import { ask_for_flourisher_freight, ask_for_flourisher_monitor } from "$lib/PTO/Flourisher.js"
	
	const flourisher_freight = ask_for_flourisher_freight ();
	let flourisher_monitor = ask_for_flourisher_monitor (async ({
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
	flourisher_monitor.stop ()
*/

// import { is_wallet_connected_ask_loop } from './screenplays/is_wallet_connected'


//
import { WalletCore } from "@aptos-labs/wallet-adapter-core";
//
//
import { build_truck } from '@visiwa/trucks'
//
//
import { ask_for_wallets_list } from "$lib/PTO/Flourisher/Wallets/ask_for_list.js"
//
import { ask_for_the_config } from "./config"
//

const trucks = {}

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
	
	
	const wallet = new WalletCore (
		plugins,
		opt_in_wallets
		// dappConfig,
		// disableTelemetry
	);
	const wallets_list = ask_for_wallets_list ({ wallet_link: wallet });
	
	/*
		Freight is the "state" or the object that is
		is monitored.
	*/
	trucks [1] = build_truck ({
		freight: {
			network,
			
			wallet,
			wallets_list
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
			// leaf name changed
			if (bracket === original_freight && property === "leaf_name") {
				console.info ("leaf name changed");
			}
			
			// Leaf 1 alert_success changed
			if (bracket === original_freight.leaves ["Leaf 1"] && property === "alert_success") {
				console.info ("Leaf 1 alert_success changed.");
			}
		}
		catch (imperfection) {
			console.error (imperfection);
		}
	});
	
	return trucks [1];	
}

export const destroy_the_flourisher = () => {
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