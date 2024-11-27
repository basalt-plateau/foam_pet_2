








<script>

/*
	// Create
	
*/

/*
	import * as PT from '$lib/PTO/Transaction_Offline/Petition/Truck/index.js'
	import Petition_Truck from '$lib/PTO/Transaction_Offline/Petition/Truck/Ride.svelte'
	let PT_Freight = false


	<Petition_Truck on_change={ ({ pro_freight }) => { PT_Freight = pro_freight; } } />
	{#if typeof PT_Freight === "object"}
	
	{/if}
*/

/*
	happening = "mounted"
	happening = "modulated"
*/
import { onMount, onDestroy } from 'svelte'
import { monitor_truck, retrieve_truck } from './index.js'

export let on_change = () => {}

let Truck_Monitor;
onMount (async () => {
	Truck_Monitor = monitor_truck (({ pro_freight }) => {
		on_change ({ 
			pro_freight, 
			happening: "modulated" 
		})
	})
	
	on_change ({ 
		pro_freight: retrieve_truck ().pro_freight, 
		happening: "mounted" 
	})
});
onDestroy (() => {
	Truck_Monitor.stop ()
});


</script>

<div style="position: absolute"></div>