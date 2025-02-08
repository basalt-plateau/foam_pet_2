





////
//
import * as AptosSDK from "@aptos-labs/ts-sdk";
import _get from 'lodash/get'
//
//
import { rhythm_filter } from '$lib/taverns/procedures/dates/rhythm-filter'
//
import { build_truck } from '$lib/trucks'
import { parse_styles } from '$lib/trinkets/styles/parse'
import { assert_is_natural_numeral_string } from '$lib/taverns/numerals/natural/is_string'
//
import * as Extension_Winch from "$lib/Singles/Extension_Winch"		
//
//
import { ask_for_mode } from './Screenplays/ask_for_mode.js'
import { ask_for_commas_every } from './Screenplays/ask_for_commas_every.js'
import { ask_for_slang } from './Screenplays/ask_for_slang.js'
import { ask_for_origin_address } from './Screenplays/ask_for_origin_address.js'
import { ask_for_wallet_network } from './Screenplays/ask_for_wallet_network.js'
import { ask_for_dapp_network } from './Screenplays/ask_for_dapp_network.js'
import { ask_for_dapp_network_connection_status } from './Screenplays/ask_for_dapp_network_connection_status.js'
import { ask_is_producer } from './Screenplays/ask_is_producer.js'
//
////

		


let dapp_network_connection_loop;

const trucks = {}

//
//
//	maybe this
//
//
const monitor_local_storage = () => {}


var window_size_changed;
const monitor_window = ({ truck }) => {
	console.log ({ truck })	
	
	var RF = rhythm_filter ({
		every: 200
	});
	window_size_changed = (event) => {
		RF.attempt (({ ellipse, is_last }) => {
			console.log ("window size changed", { event })
			
			truck.freight.window_width = window.innerWidth;
		});
	}

	window.addEventListener ("resize", window_size_changed);
}





let Extension_Winch_Monitor;
export const lease_roomies_truck = () => {
	const the_domain = window.location.hostname;
	
	const wallet_network = ask_for_wallet_network ();
	let origin_address = ask_for_origin_address ();
	let mode = ask_for_mode ();
	let commas_every = ask_for_commas_every ();
	
	const { net_path, net_name } = wallet_network;
	
	const dapp_network = ask_for_dapp_network ();
	
	trucks [1] = build_truck ({
		freight: {
			parador: {
				transform: "scale(1)"
			},
			
			shrink () {
				trucks [1].freight.parador.transform = "scale(0)";
			},
			
			mode,
			is_producer: ask_is_producer (),
			
			origin_address,
			use_slang: ask_for_slang (),
			commas_every,
			
			
			dapp_wallet_cohesion: {
				chain_id: "no" // "no" or "yes"
			},
			
			dapp_network: {
				net_path: dapp_network.net_path,
				net_name: dapp_network.net_name,
				
				//
				// There's the decided chain id,
				// and the one that is returned from
				// the node.
				//
				chain_id: dapp_network.chain_id,
				
				connected: "",
				aptos: "",
				
				status: {},
				UTC_orbit: ""
			},
			
			//
			// could have dapp_node_status
			// dapp_node_status: { status, UTC_orbit, connected }
			//
			window_width: window.innerWidth,
			layout: {
				leaf_styles: parse_styles ({
					margin: '0 auto',
					'max-width': '64rem',
					width: '100%'
				})
			}
		}
	});
	
	let monitor = trucks [1].monitor (async ({
		original_freight,
		pro_freight, 
		//
		bracket,
		//
		property, 
		value
	}) => {
		// console.log ("🌾 Versie Freight was modified", value, property);
		
		if (property === "commas_every") {
			localStorage.setItem ("commas_every", value)
		}
		else if (property === "use_slang") {
			localStorage.setItem ("use_slang", value)
		}
		
		try {
			if (bracket === original_freight.dapp_network && property === "net_path") {
				localStorage.setItem ("net_path", value);
			}
		}
		catch (imperfection) {
			console.error (imperfection);
		}
		
		try {
			if (bracket === original_freight.dapp_network && property === "net_name") {
				localStorage.setItem ("net_name", value);
			}
		}
		catch (imperfection) {
			console.error (imperfection);
		}
		
		check_cohesion ();
	});
	
	const check_cohesion = () => {
		let wallet_chain_id = ""
		try {
			wallet_chain_id = parseInt (Extension_Winch.freight ().stage.network.chain_id);
		}
		catch (imperfection) {}
		
		let dapp_chain_id = ""
		try {
			dapp_chain_id = trucks [1].freight.dapp_network.status.chain_id;
		}
		catch (imperfection) {}
		
		
		// console.log ("check_cohesion", { wallet_chain_id, dapp_chain_id });
		
		try {
			if (
				typeof wallet_chain_id === "number" &&
				typeof dapp_chain_id === "number" &&		
				wallet_chain_id === dapp_chain_id
			) { 
				trucks [1].freight.dapp_wallet_cohesion.chain_id = "yes"
				return;
			}
		}
		catch (imperfection) {
			console.error (imperfection);
		}
		
		trucks [1].freight.dapp_wallet_cohesion.chain_id = "no"
	}
	
	//
	//	The extension winch is built before the Versies truck,
	//	therefore can access it here.
	//
	Extension_Winch_Monitor = Extension_Winch.monitor (async ({
		original_freight,
		pro_freight, 
		//
		bracket,
		//
		property, 
		value
	}) => {
		console.log ("🌾 Extension_Winch_Monitor", value, property);
		check_cohesion ();
	});

	
	monitor_window ({ truck: trucks [1] });
	
	dapp_network_connection_loop = ask_for_dapp_network_connection_status ();
	dapp_network_connection_loop.play ();
}



export const ask_for_freight = () => {
	return trucks [1].freight;
}
export const give_back_roomies_truck = () => {
	dapp_network_connection_loop.stop ();
	window.removeEventListener ("resize", window_size_changed)
	
	// Extension_Winch_Monitor.stop ()
	
	delete trucks [1];
}
export const check_roomies_truck = () => {
	return trucks [1];
}
export const monitor_roomies_truck = (action) => {	
	return trucks [1].monitor (({ freight, property, value }) => { action (freight); });
}







