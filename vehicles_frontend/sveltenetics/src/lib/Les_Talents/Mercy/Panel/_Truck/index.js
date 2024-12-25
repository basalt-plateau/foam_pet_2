

/*
	import { onMount, onDestroy } from 'svelte'
	import * as Mercy_Truck from '$lib/Les_Talents/Mercy/_Truck/index.js'

	onMount (async () => {	
		Mercy_Truck.make ()
	});
	onDestroy (() => {
		Mercy_Truck.destroy ()
	});
*/

/*
	https://www.npmjs.com/package/@visiwa/trucks
*/

// $lib/trucks/truck_1/index.js


import { build_truck } from '@visiwa/trucks'

const trucks = {}

/*
	This adds a truck to the trucks object as trucks [1] = ...
	Such, the truck can then be deleted with the "destroy" method.
*/
export const make = () => {
	
	/*
		Freight is the "state" or the object that is
		is monitored.
	*/
	trucks [1] = build_truck ({
		freight: {
			
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


/*
	Changes to the freight can also be monitored like this.
	This adds another monitor each time "monitor" is called.
	
	An example implementation can be found below.
*/
export const monitor = (action) => {	
	return trucks [1].monitor (envelope => { action (envelope); });
}