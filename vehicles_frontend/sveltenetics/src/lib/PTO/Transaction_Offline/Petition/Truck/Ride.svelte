








<script>

/*
	import Petition_Truck from '$lib/PTO/Transaction_Offline/Petition/Truck/Ride.svelte'
	let PT_Freight = false


	
	<Petition_Truck on_change={ ({ freight }) => { PT_Freight = freight; } } />
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
let freight;
onMount (async () => {
	freight = retrieve_truck ().freight; 
	
	Truck_Monitor = monitor_truck ((_freight) => {
		freight = _freight;
		on_change ({ freight, happening: "modulated" })
	})
	
	on_change ({ freight, happening: "mounted" })
});
onDestroy (() => {
	Truck_Monitor.stop ()
});


</script>

<div></div>