


<script>

/*
	import Loyals_Truck from '../../Logistics/Truck.svelte'

	
	<Loyals_Truck 
		on_change={ on_change }
	/>
	
	let freight = {}
	let prepared = "no"
	const on_change = ({ freight: _freight, happening }) => {
		freight = _freight;
		
		if (happening === "mounted") {
			freight.current_land = "Unsigned_Transaction_Fields"
			prepared = "yes"
		}
	}
*/

/*
	happening = "mounted"

	happening = "modulated"
*/

import { onMount, onDestroy } from 'svelte'
import { retrieve_truck, monitor_truck } from './Truck'

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