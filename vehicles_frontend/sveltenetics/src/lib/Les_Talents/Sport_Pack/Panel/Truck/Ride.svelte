
<script>

/*
	import * as Truck_1 from '$lib/Les_Talents/Sport_Pack/Panel/Truck/index.js'
	import Sport_Pack_Ride from '$lib/Les_Talents/Sport_Pack/Panel/Truck/Ride.svelte'
	let Sport_Pack_Freight = false

	<Sport_Pack_Ride on_change={ ({ pro_freight }) => { Sport_Pack_Freight = pro_freight; } } />
	{#if typeof Sport_Pack_Freight === "object"}
	
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