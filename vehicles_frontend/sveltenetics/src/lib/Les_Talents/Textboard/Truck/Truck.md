

/*
	import { onMount, onDestroy } from 'svelte'
	import * as Textboard_Truck from "$lib/Les_Talents/Textboard/Truck/index.js"

	onMount (async () => {	
		Textboard_Truck.make ()
	});
	onDestroy (() => {
		Textboard_Truck.destroy ()
	});
*/

/*
	import { onMount, onDestroy } from 'svelte'
	import * as Textboard_Truck from "$lib/Les_Talents/Textboard/Truck/index.js"
	
	let TT_Monitor;
	let TT_Freight;
	onMount (async () => {
		TT_Freight = Textboard_Truck.retrieve ().pro_freight; 
		
		TT_Monitor = Textboard_Truck.monitor (async ({
			original_freight,
			pro_freight, 
			//
			target,
			//
			property, 
			value
		}) => {
			try {
				if (bracket === original_freight.info && property === "text") {
					console.info ("text changed.");
				}
			}
			catch (imperfection) {
				console.error (imperfection);
			}
		});
	});

	onDestroy (() => {
		TT_Monitor.stop ()
	}); 
*/