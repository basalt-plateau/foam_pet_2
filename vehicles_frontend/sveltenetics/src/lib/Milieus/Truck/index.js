


/*
	import { onMount, onDestroy } from 'svelte'
	import * as Milieus_Truck from '$lib/Milieus/Truck/index.js'

	let Milieus_Truck_Monitor;
	let Milieus_Truck_Freight = Milieus_Truck.retrieve ().pro_freight
	onMount (async () => {
		Milieus_Truck_Monitor = Milieus_Truck.monitor (async ({ pro_freight }) => {
			Milieus_Truck_Freight = pro_freight
		});
	});

	onDestroy (() => {
		Milieus_Truck_Monitor.stop ()
	}); 
*/

/*
	import { onMount, onDestroy } from 'svelte'
	import * as Milieus_Truck from '$lib/Milieus/Truck/index.js'

	let Milieus_Truck_Monitor;
	let Milieus_Truck_Freight;
	onMount (async () => {
		Milieus_Truck_Freight = Milieus_Truck.retrieve ().pro_freight; 
		
		Milieus_Truck_Monitor = Milieus_Truck.monitor (async ({
			original_freight,
			pro_freight, 
			//
			target,
			//
			property, 
			value
		}) => {
			try {
				// watch for changes to leaf_name
				if (target === original_freight && property === "leaf_name") {
					console.info ("leaf name changed");
					
				}
			}
			catch (imperfection) {
				console.error (imperfection);
			}
		});
	});

	onDestroy (() => {
		Milieus_Truck_Monitor.stop ()
	}); 
*/


////
//
import * as AptosSDK from "@aptos-labs/ts-sdk";
//
//
import { build_truck } from '@visiwa/trucks'
//
//
import { has_field } from '$lib/taverns/procedures/object/has_field'
import { parse_styles } from '$lib/trinkets/styles/parse'
//
////


const trucks = {}

//
//
//	maybe this
//
//
const monitor_local_storage = () => {}


const Location_Bracket = {
	find () {
		let location_1 = [
			"Ecology",
			"Hints"
		]
		
		let location = []
		try {
			if (has_field (sessionStorage, "location")) {
				let local_storage_location = JSON.parse (sessionStorage.getItem ("location"));
				if (Array.isArray (local_storage_location)) {
					
					/*
					console.info ({ local_storage_location })
					console.log (
						"Local Storage Location:", 
						local_storage_location [0], 
						local_storage_location [1]
					)*/
					
					if (local_storage_location.length === 2) {
						return local_storage_location;
					}
				}
			}
		}
		catch (exception) {
			console.error (exception)
		}
		
		return location_1;
	},
	change () {
		
	}
}

const intercept = () => {
	history.pushState(null, null, location.href);
	window.onpopstate = function (event) {
		console.log ("onpopstate");
		history.pushState (null, null, location.href);
	}
}


/*
	Ecology:
		Hints:
		Garden:
		Theme:
		Resilience:
	
	Talents:
		
	
	Wallets (Loyalty):
		Offline:
			Hints:
			Harvest:
			Consent:			
		
		Online:
			
*/
/*
	let header_1_saying = {
		name: (
			"പരിസ്ഥിതി"
		),
		language: (
			"Malayalam"
		),
		pronunciation: (
			"Paristetry"
		),
		english: "Ecology"
	}

*/
export const lease_Milieus_truck = () => {
	let location = Location_Bracket.find ()
	
	
	let nav_linguistics = "no"
	

	// console.log ("Leasing Milieus Truck:", location [0], location [1])
	
	trucks [1] = build_truck ({
		freight: {
			location,
			
			nav_linguistics,
			
			// _get ( , [ "linguistics", "Ecology", "name" ], "")
			
			linguistic_assistance: {
				"Ecology": {
					"Malayalam": {
						name: (
							"പരിസ്ഥിതി"
						),
						pronunciation: (
							"Paristetry"
						)
					}
				},
			},
			
			linguistics: {
				////
				//
				//	
				//
				"Ecology": "പരിസ്ഥിതി",
				"Activities": "እቅዶች",
				//
				////
				
				
				////
				//
				//	
				//
				"Lantern": "🏖️️",
				"Garden": "ᎠᏫᏒᏅ",
				
				// Theme:
				// 	Greek: θέμα
				// 	Chinese:
				// Show, Chinese: 演出
				"Show": "演出",
				
				// 韌性
				//  Techne: Τέχνης
				//  Resilence: ανθεκτικότητα
				"Resilience": "ανθεκτικότητα",
				//
				////
				
				
				// "Wallets": "",
				// "Loyals": "",
				// "Hints": ("အညွှန်းများ"),
				// 🌌, 🐉, 🦖, 🦕, 🛸, 🦤, 🦠, ☎️, 🖼,👽,📱,🧠, 🛰,💝,🚜,🗽,☄️, 🛰️
			}
		}
	});
	
	console.log ("Milieus Truck Leased")
}

export const ask_for_freight = () => {
	return trucks [1].freight;
}
export const give_back_Milieus_truck = () => {
	delete trucks [1];
}
export const check_Milieus_truck = () => {
	return trucks [1];
}
export const monitor_Milieus_truck = (action) => {	
	return trucks [1].monitor (({ freight }) => {
		sessionStorage.setItem ("location", JSON.stringify (freight.location))
		action (freight);
	})
}







