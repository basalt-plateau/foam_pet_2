





<script>

/*
	import Seeds_Trucks from '$lib/Versies/Trucks.svelte'
	
	<Seeds_Trucks on_change={ on_seeds_truck_change } />
	
	{#if seeds_trucks_prepared === "yes"}
	
	{/if}
	
	
	let seeds_freight = {}
	let seeds_trucks_prepared = "no"
	const on_seeds_truck_change = ({ freight: _freight, happening }) => {
		seeds_freight = _freight;
		if (happening === "mounted") {
			seeds_trucks_prepared = "yes"
		}
	}
*/

/*
	happening = "mounted"
	happening = "modulated"
*/

import { onMount, onDestroy } from 'svelte'
import { monitor_roomies_truck, check_roomies_truck } from './Trucks'

export let on_change = () => {}

let Truck_Monitor;
let freight;
onMount (async () => {
	freight = check_roomies_truck ().freight; 
	
	Truck_Monitor = monitor_roomies_truck ((_freight) => {
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