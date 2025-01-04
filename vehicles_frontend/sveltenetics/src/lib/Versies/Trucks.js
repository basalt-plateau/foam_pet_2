





////
//
import * as AptosSDK from "@aptos-labs/ts-sdk";
//
//
import { has_field } from '$lib/taverns/procedures/object/has_field'
import { rhythm_filter } from '$lib/taverns/procedures/dates/rhythm-filter'
//
import { build_truck } from '$lib/trucks'
import { parse_styles } from '$lib/trinkets/styles/parse'
import { assert_is_natural_numeral_string } from '$lib/taverns/numerals/natural/is_string'
//
import * as Extension_Winch from "$lib/Singles/Extension_Winch"		
//
//
import { the_ledger_ask_loop_creator } from './Screenplays/is_connected'
import { ask_for_mode } from './Screenplays/ask_for_mode.js'
import { ask_for_commas_every } from './Screenplays/ask_for_commas_every.js'
import { ask_for_slang } from './Screenplays/ask_for_slang.js'
import { ask_for_origin_address } from './Screenplays/ask_for_origin_address.js'
import { ask_for_wallet_network } from './Screenplays/ask_for_wallet_network.js'
//
////

	


let the_ledger_ask_loop;

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
			////
			
			
			wallet: wallet_network,
			consensus: {
				connected: "",
				aptos: "",
				
				status: {}			
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
	
	
	const change_wallet_net = (pro_stage) => {
		console.info ({ pro_stage });
		
		trucks [1].freight.wallet.net_path = pro_stage.network.address;
		trucks [1].freight.wallet.net_name = pro_stage.network.name;
		trucks [1].freight.wallet.chain_id = pro_stage.network.chain_id;		
	}
	
	const intercept_extension_winch = async ({
		original_freight,
		pro_freight, 
		//
		bracket,
		//
		property, 
		value
	}) => {
		console.info ("🧞‍♀️ extension changed:", { original_freight, bracket, property, value });
		
		try {
			const stage_name = original_freight.stage_name_connected;
			const stage = original_freight.stages [ stage_name ];			
			// console.log ({ stage_name, stage, bracket });
			
			const pro_stage_name = pro_freight.stage_name_connected;			
			const pro_stage = pro_freight.stages [ pro_stage_name ]
			
			if (pro_stage_name.length === 0) {
				trucks [1].freight.wallet.net_path = "";
				trucks [1].freight.wallet.net_name = "";
				trucks [1].freight.wallet.chain_id = "";
				return;
			}
			

			if (bracket === original_freight) {
				if (property === "stage_name_connected") {
					console.info ("🔮 stage_name_connected changed");
					change_wallet_net (pro_stage);
				}
			}
			
			if (bracket === stage.network) {
				if (property === "address") {
					console.info ("🔮 network address changed");
					
					change_wallet_net (pro_stage);
				}
				if (property === "name") {
					console.info ("🔮 network name changed");
					
					change_wallet_net (pro_stage);
				}
			}
		}
		catch (imperfection) {
			console.error (imperfection);
		}
	};
	
	/*
		The extension winch is built before the Versies truck,
		therefore can access it here.
	*/
	Extension_Winch_Monitor = Extension_Winch.monitor (async ({
		original_freight,
		pro_freight, 
		//
		bracket,
		//
		property, 
		value
	}) => {
		// flourisher_freight = pro_freight;
		intercept_extension_winch ({
			original_freight,
			pro_freight, 
			//
			bracket,
			//
			property, 
			value
		});
	});
	
	monitor_window ({
		truck: trucks [1]
	});
	
	the_ledger_ask_loop = the_ledger_ask_loop_creator ();
	the_ledger_ask_loop.play ();
}



export const ask_for_freight = () => {
	return trucks [1].freight;
}
export const give_back_roomies_truck = () => {
	the_ledger_ask_loop.stop ();
	window.removeEventListener ("resize", window_size_changed)
	
	Extension_Winch_Monitor.stop ()
	
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







