
<script>

//
import { onMount, onDestroy } from 'svelte';
import { ConicGradient } from '@skeletonlabs/skeleton';
//
import Code_Wall from '$lib/trinkets/Code_Wall/Trinket.svelte' 
//

import { 
	retrieve_truck, 
	monitor_truck,
} from '$lib/Les_Talents/APT_Entrust_Mode_1/Loyals_Panel/Logistics/Truck'
let prepared = "no"
let Truck_Monitor;
let freight;
onMount (async () => {
	const Truck = retrieve_truck ()
	freight = Truck.freight; 
		
	Truck_Monitor = monitor_truck ((_freight) => {
		freight = _freight;
	})
	
	prepared = "yes"
});
onDestroy (() => {
	Truck_Monitor.stop ()
});



</script>

{#if prepared === "yes" }
<div monitor="hexadecimal string">
	<Code_Wall
		text={ freight.Unsigned_Transaction_Signature.hexadecimal_string }
		can_clone={ "yes" }
	/>
</div>
{/if}