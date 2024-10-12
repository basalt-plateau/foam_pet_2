







<script>


/*
	happening = "mounted"
	happening = "modulated"
*/

import { onMount, onDestroy } from 'svelte'
import { monitor_Milieus_truck, check_Milieus_truck } from './index.js'

export let on_change = () => {}

let Truck_Monitor;
let freight;
onMount (() => {
	console.log ("truck:", check_Milieus_truck ().freight)
	
	freight = check_Milieus_truck ().freight; 
	
	Truck_Monitor = monitor_Milieus_truck ((_freight) => {
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