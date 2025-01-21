

<script>


////
//
import { onMount, onDestroy } from 'svelte'
//
//
import { check_Milieus_truck, monitor_Milieus_truck } from '$lib/Milieus/Truck'
import Milieus_Button from '$lib/Milieus/Button/Trinket.svelte'
import { check_roomies_truck } from '$lib/Versies/Trucks'
import Seeds_Trucks from '$lib/Versies/Trucks.svelte'
import Milieus_Truck from '$lib/Milieus/Truck/Trinket.svelte'
//
////


let Milieus_Freight = false;

	
	

let mode = check_roomies_truck ().freight.mode;;
let location = [ "", "" ];

let update_variables = () => {
	console.log ("update_variables");
	
	mode = check_roomies_truck ().freight.mode;
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

/*
	Garden:
		Inuit: 
			ᐊᔭᕙᓘᓐᖏᑦ
*/



/*
	Hints:
		Petroglyphs
*/


</script>

{#if location [0] === "Ecology" }
<div
	style=""
>
	<Seeds_Trucks on_change={ on_seeds_truck_change } />
	<Milieus_Truck on_change={ ({ freight }) => { Milieus_Freight = freight; } } />


	{#if seeds_trucks_prepared === "yes" && typeof Milieus_Freight === "object" }
	<div>
		<Milieus_Button
			monitor="Hints"
		
			name={ Milieus_Freight.nav_linguistics === "yes" ? Milieus_Freight.linguistics ["Entrance"] : "Entrance" }
			
			location={[ "Ecology", "Hints" ]}
			is_open_location={[ "Ecology", "Hints" ]}
			
			style={ buttons_styles }
		/>
		<Milieus_Button
			monitor="Garden"
		
			name={ Milieus_Freight.nav_linguistics === "yes" ? Milieus_Freight.linguistics ["Garden"] : "Garden" }
			location={[ "Ecology", "Garden" ]}
			is_open_location={[ "Ecology", "Garden" ]}
			
			style={ buttons_styles }
		/>
		<Milieus_Button
			monitor="Resilience"
		
			name={ Milieus_Freight.nav_linguistics === "yes" ? Milieus_Freight.linguistics ["Vows"] : "Vows" }
			location={[ "Ecology", "Resilience", "Leaf" ]}
			is_open_location={[ "Ecology", "Resilience" ]}
			
			style={ buttons_styles }
		/>
	</div>
	{/if}
</div>
{/if}