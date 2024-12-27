

<script>

/*
	import Extension_Winch_Ride from '$lib/Singles/Extension_Winch/Ride.svelte'
	let Extension_Winch_Freight = false

	<Extension_Winch_Ride on_change={ ({ pro_freight }) => { Extension_Winch_Freight = pro_freight; } } />
	{#if typeof Extension_Winch_Freight === "object"}
	
	{/if}
*/

/*
	happening = "mounted"
	happening = "modulated"
*/
import { onMount, onDestroy } from 'svelte'
import * as EW from "./index.js"		

export let on_change = () => {}

let flourisher_freight = EW.freight ();
let flourisher_monitor;
onMount (async () => {
	flourisher_monitor = EW.monitor (({ pro_freight }) => {
		on_change ({ 
			pro_freight, 
			happening: "modulated" 
		})
	})
	
	on_change ({ 
		pro_freight: EW.retrieve ().pro_freight, 
		happening: "mounted" 
	});
});
onDestroy (async () => {
	flourisher_monitor.stop ()
});


</script>

<div style="position: absolute"></div>
