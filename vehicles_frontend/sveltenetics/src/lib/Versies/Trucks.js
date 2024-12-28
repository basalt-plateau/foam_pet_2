





////
//
import * as AptosSDK from "@aptos-labs/ts-sdk";
//
//
import { has_field } from '$lib/taverns/procedures/object/has_field'
import { rhythm_filter } from '$lib/taverns/procedures/dates/rhythm-filter'
//
//
import { build_truck } from '$lib/trucks'
import { parse_styles } from '$lib/trinkets/styles/parse'
import { assert_is_natural_numeral_string } from '$lib/taverns/numerals/natural/is_string'
//
//
import { the_ledger_ask_loop_creator } from './Screenplays/is_connected'
//
////


import * as Extension_Winch from "$lib/Singles/Extension_Winch"		





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



const retrieve_network = () => {
	let net_path = "https://api.mainnett.aptoslabs.com/v1"
	let net_name = "mainnet"
	let chain_id = ""
	
	let EW_freight = Extension_Winch.freight ();
	if (EW_freight.bridge_is_connected === "yes") {
		const network = EW_freight.bridge.network;
		net_path = network.address;
		net_name = network.name;
		chain_id = network.chain_id;
	}
	else {
		if (typeof localStorage.net_name === "string") {
			net_name = localStorage.net_name	
		}
		if (typeof localStorage.net_path === "string") {
			net_path = localStorage.net_path	
		}
	}
	
	return { net_name, net_path };
}


let flourisher_monitor;
export const lease_roomies_truck = () => {
	const the_domain = window.location.hostname;
	
	/*
	let net_path = "https://api.mainnet.aptoslabs.com/v1"
	let net_name = "mainnet"
	if (typeof localStorage.net_name === "string") {
		net_name = localStorage.net_name	
	}
	if (typeof localStorage.net_path === "string") {
		net_path = localStorage.net_path	
	}
	*/
	
	const { net_path, net_name } = retrieve_network ();

	
	let mode = "business"
	if (typeof localStorage.mode === "string") {
		mode = localStorage.mode	
	}
	
	
	// let origin_address = "http://localhost:22000"
	// let origin_address = "https://" + the_domain;
	// let origin_address = "/";
	let origin_address = "https://foam.pet";
	if (typeof localStorage.origin_address === "string") {
		origin_address = localStorage.origin_address	
	}
	
	
	let commas_every = 5
	if (typeof localStorage.commas_every === "string") {
		try {
			assert_is_natural_numeral_string (localStorage.commas_every)
			commas_every = parseInt (localStorage.commas_every)
		}		
		catch (exception) {
			// Like if the assertion failed.. exception note not important.
			// console.info (exception)
		}
	}
	
	
	let use_slang = "yes"
	if (typeof localStorage.use_slang === "string") {
		use_slang = localStorage.use_slang	
	}

	
	
	trucks [1] = build_truck ({
		freight: {
			/*
				business: 
					The actual mode of the package that's sent.
				
				nurture: 
					For building, this has features that are being raised.
				location
				[ "nurture", "business" ]
				 
				import { check_roomies_truck } from '$lib/Versies/Trucks'
				const mode = check_roomies_truck ().freight.mode;
				{#if mode === "nurture" }
				{/if}
			*/
			//mode: "business",
			mode,
			
			origin_address,
			
			net_path,
			net_name,
			net_connected: "no",
			
			use_slang,
			
			commas_every,
			
			// deep_example_1: { deep_example_2: 1 },
			
			
			window_width: window.innerWidth,
			
			layout: {
				leaf_styles: parse_styles ({
					margin: '0 auto',
					'max-width': '64rem',
					width: '100%'
				})
			},
			
			aptos: new AptosSDK.Aptos (
				new AptosSDK.AptosConfig ({		
					fullnode: net_path,
					network: AptosSDK.Network.CUSTOM
				})
			)
		}
	})
	
	
	flourisher_monitor = Extension_Winch.monitor (async ({
		original_freight,
		pro_freight, 
		//
		target,
		//
		property, 
		value
	}) => {
		// flourisher_freight = pro_freight;
		
		console.info ("😂 extension changed:", pro_freight);
		
		// trucks [1].net_path = pro_freight.network.address;
		
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
	
	flourisher_monitor.stop ()
	
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







