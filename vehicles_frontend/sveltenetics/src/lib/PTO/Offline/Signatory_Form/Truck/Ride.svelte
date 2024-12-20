








<script>

/*
	// Create
	
*/

/*
	import * as ST from '$lib/PTO/Offline/Signatory_Form/Truck/index.js'
	import Signatory_Truck from '$lib/PTO/Offline/Signatory_Form/Truck/Ride.svelte'
	let ST_Freight = false


	<Signatory_Truck on_change={ ({ pro_freight }) => { ST_Freight = pro_freight; } } />
	{#if typeof ST_Freight === "object"}
	
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