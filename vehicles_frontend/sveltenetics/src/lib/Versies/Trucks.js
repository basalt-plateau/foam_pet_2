





////
//
import * as AptosSDK from "@aptos-labs/ts-sdk";
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
// import { the_ledger_ask_loop_creator } from './Screenplays/is_connected'
//
import { ask_for_mode } from './Screenplays/ask_for_mode.js'
import { ask_for_commas_every } from './Screenplays/ask_for_commas_every.js'
import { ask_for_slang } from './Screenplays/ask_for_slang.js'
import { ask_for_origin_address } from './Screenplays/ask_for_origin_address.js'
import { ask_for_wallet_network } from './Screenplays/ask_for_wallet_network.js'
import { ask_for_dapp_network } from './Screenplays/ask_for_dapp_network.js'
import { ask_for_dapp_network_connection_status } from './Screenplays/ask_for_dapp_network_connection_status.js'
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
	let use_slang = ask_for_slang ();
	
	const { net_path, net_name } = wallet_network;
	
	const dapp_network = ask_for_dapp_network ();
	
	trucks [1] = build_truck ({
		freight: {
			mode,
			origin_address,
			use_slang,
			commas_every,
			
			////
			//
			//	These are vintage ::::: being phased out.
			//
			//
			net_path,
			net_name,
			net_connected: "no",
			//
			aptos: new AptosSDK.Aptos (
				new AptosSDK.AptosConfig ({		
					fullnode: net_path,
					network: AptosSDK.Network.CUSTOM
				})
			),
			//
			wallet: wallet_network,
			consensus: {
				connected: "",
				aptos: "",
				
				status: {}			
			},
			//
			////
			
			dapp_wallet_cohesion: {
				chain_id: "no" // "no" or "yes"
			},
			
			dapp_network: {
				net_path: dapp_network.net_path,
				net_name: dapp_network.net_name,
				chain_id: dapp_network.chain_id,
				
				connected: "",
				aptos: "",
				
				status: {},
				UTC_orbit: ""
			},
			
			
			
			window_width: window.innerWidth,
			layout: {
				leaf_styles: parse_styles ({
					margin: '0 auto',
					'max-width': '64rem',
					width: '100%'
				})
			}
		}
	})
	

	
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
		try {
			const pro_stage_name = pro_freight.stage_name_connected;			
			const pro_stage = pro_freight.stages [ pro_stage_name ];
			
			const wallet_chain_id = pro_freight.network_status.status.chain_id;
			const dapp_chain_id = trucks [1].freight.dapp_network.status.chain_id;
		
			console.log ({ wallet_chain_id, dapp_chain_id });
			
			if (wallet_chain_id === dapp_chain_id) {
				trucks [1].freight.dapp_wallet_cohesion.chain_id = "yes"
			}
		}
		catch (imperfection) {
			console.error (imperfection);
		}
		
		trucks [1].freight.dapp_wallet_cohesion.chain_id = "no"
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
	return trucks [1].monitor (({ freight, property, value }) => {
		if (property === "commas_every") {
			localStorage.setItem ("commas_every", value)
		}
		else if (property === "use_slang") {
			localStorage.setItem ("use_slang", value)
		}

		
		action (freight);
	})
}







