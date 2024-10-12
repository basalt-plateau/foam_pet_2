



/*
	This needs to be built.
*/


/*
	import {} from '$lib/Milieus/Truck'
*/



////
//
import * as AptosSDK from "@aptos-labs/ts-sdk";
//
//
import { has_field } from '$lib/taverns/procedures/object/has_field'
//
//
import { build_truck } from '$lib/trucks'
import { parse_styles } from '$lib/trinkets/styles/parse'
//
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
			"Scholars",
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

export const lease_Milieus_truck = () => {
	let location = Location_Bracket.find ()
	
	
	// console.log ("Leasing Milieus Truck:", location [0], location [1])
	
	trucks [1] = build_truck ({
		freight: {
			location
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







