

/*
	import * as Tesseract_Rise from "$lib/Singles/Tesseract_Rise"
	Tesseract_Rise.make ();
	Tesseract_Rise.destroy ();
*/

/*
	import * as Tesseract_Rise from "$lib/Singles/Tesseract_Rise"

*/

// $lib/trucks/truck_1/index.js
/*
	perhaps:
		const rise_tesseract = retrieve ()
*/

import { build_truck } from '@visiwa/trucks'

const trucks = {}

export const make = () => {
	const rise = window.rise;
	
	trucks [1] = build_truck ({
		freight: {
			name: "",
			icon: "",
			network: {
				name: "",
				address: "",
				chain_id: ""
			},
			account: {
				address: "",
				public_key: ""
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
				if (this.is_installed () !== "yes") { return "no" }
				
				try {
					if (rise.isConnected () === true) {
						return "yes";
					}
				}
				catch (imperfection) {}
				return "no";
			},
			connect () {
				
			},
			disconnect () {
				
			},
			build () {
				
			}
		}
	});
	
	rise.onAccountChange (account => {
		console.log ("onAccountChange:", { account });
		trucks [1].freight.status ();
	});
	rise.onNetworkChange (network => {
		console.log ("onNetworkChange:", { network });
		trucks [1].freight.status ();
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
		try {

		}
		catch (imperfection) {
			console.error (imperfection);
		}
	});
}

export const destroy = () => {
	delete trucks [1];
}

export const retrieve = () => {
	return trucks [1];
}



export const monitor = (action) => {	
	return trucks [1].monitor (envelope => { action (envelope); });
}