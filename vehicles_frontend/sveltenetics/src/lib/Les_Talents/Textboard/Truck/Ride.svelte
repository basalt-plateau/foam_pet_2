
<script>

/*
	import Textboard_Truck_Ride from '$lib/Les_Talents/Textboard/Truck/Ride.svelte'
	let Textboard_Freight = false

	<Textboard_Truck_Ride on_change={ ({ pro_freight }) => { Textboard_Freight = pro_freight; } } />
	{#if typeof Textboard_Freight === "object"}
	
	{/if}
*/

/*
	happening = "mounted"
	happening = "modulated"
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