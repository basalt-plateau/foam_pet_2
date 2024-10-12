

<script>

import Milieus_Button from '$lib/Milieus/Button/Trinket.svelte'

import { onMount, onDestroy } from 'svelte'
import { check_Milieus_truck, monitor_Milieus_truck } from '$lib/Milieus/Truck'
import { check_roomies_truck } from '$lib/Versies/Trucks'
import Seeds_Trucks from '$lib/Versies/Trucks.svelte'

let mode;
let location = [ "", "" ];

let update_variables = () => {
	mode = check_Milieus_truck ().freight.mode;
	location = check_Milieus_truck ().freight.location;
}
update_variables ();


let Scholars_Trucks_Prepared = "no"
let Scholars_Trucks_Monitor;
let Scholars_Trucks_Freight;
onMount (async () => {
	Scholars_Trucks_Freight = check_Milieus_truck ().freight; 
	
	Scholars_Trucks_Monitor = monitor_Milieus_truck ((_freight) => {
		Scholars_Trucks_Freight = _freight;
		
		// mode = Scholars_Trucks_Freight.mode;
		// location = Scholars_Trucks_Freight.location;
		
		update_variables ();
	})
	
	update_variables ();
	
	Scholars_Trucks_Prepared = "yes"
});
onDestroy (() => {
	Scholars_Trucks_Monitor.stop ()
}); 


let seeds_freight = {}
let seeds_trucks_prepared = "no"
const on_seeds_truck_change = ({ freight: _freight, happening }) => {
	seeds_freight = _freight;
	if (happening === "mounted") {
		seeds_trucks_prepared = "yes"
	}
	
	build ();
}

let buttons_styles = ""
const build = () => {
	let window_width = check_roomies_truck ().freight.window_width;
	if (window_width > 800) {
		buttons_styles = 'padding: 0.15cm 0.55cm; margin: 0 0.1cm; font-size: 1.2em'
	}
	else {
		buttons_styles = ''
	}
}


</script>

{#if location [0] === "Scholars" }
<div>
	<Seeds_Trucks 
		on_change={ on_seeds_truck_change } 
	/>

	{#if seeds_trucks_prepared === "yes"}
	<div>
		<Milieus_Button
			name={ "Hints" }
			location={[ "Scholars", "Hints" ]}
			is_open_location={[ "Scholars", "Hints" ]}
			
			style={ buttons_styles }
		/>
		<Milieus_Button
			name={ "Garden" }
			location={[ "Scholars", "Garden" ]}
			is_open_location={[ "Scholars", "Garden" ]}
			
			style={ buttons_styles }
		/>
		<Milieus_Button
			name={ "Theme" }
			location={[ "Scholars", "Theme" ]}
			is_open_location={[ "Scholars", "Theme" ]}
			
			style={ buttons_styles }
		/>
	</div>
	{/if}
</div>
{/if}