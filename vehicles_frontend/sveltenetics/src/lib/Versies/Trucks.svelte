





<script>

/*
	import Versies_Truck from '$lib/Versies/Trucks.svelte'
	let Versies_Freight = false
	
	<Versies_Truck on_change={ ({ freight }) => { Versies_Freight = freight } } />
	{#if typeof Versies_Freight === "object"}
	
	{/if}
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