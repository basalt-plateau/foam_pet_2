
<script>

/*
	import Mercy_Sailboat from '$lib/Les_Talents/Mercy/Panel/_Truck/Ride.svelte'
	let MS_Freight = false

	<Mercy_Sailboat on_change={ ({ pro_freight }) => { MS_Freight = pro_freight; } } />
	{#if typeof MS_Freight === "object"}
	
	{/if}
*/


import { onMount, onDestroy } from 'svelte'
import * as Truck from './index.js'

export let on_change = () => {}

let Truck_Monitor;
onMount (async () => {
	Truck_Monitor = Truck.monitor (({ pro_freight }) => {
		on_change ({ 
			pro_freight, 
			happening: "modulated" 
		})
	})
	
	on_change ({ 
		pro_freight: Truck.retrieve ().pro_freight, 
		happening: "mounted" 
	})
});
onDestroy (() => {
	Truck_Monitor.stop ()
});


</script>

<div style="position: absolute"></div>