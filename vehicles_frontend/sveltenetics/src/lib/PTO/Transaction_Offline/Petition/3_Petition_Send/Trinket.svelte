


<script>

////
//
import { onMount, onDestroy } from 'svelte'
//
//
import Code_Wall from '$lib/trinkets/Code_Wall/Trinket.svelte' 
//
//
import * as PT from './../Truck/index.js'
//
////

let PT_prepared = "no"
let PT_freight = {}
let PT_monitor;
onMount (() => {
	PT_freight = PT.retrieve_truck ().freight;
	PT_monitor = PT.monitor_truck ((_freight) => {
		PT_freight = _freight;
	})
	PT_prepared = "yes"
});
onDestroy (() => {
	PT_monitor.stop ()
});

</script>

<div
	style="
		display: flex;
		gap: 0.25cm;
		
		flex-direction: column;
		
		padding: 0.25cm;
	"
>
	
</div>