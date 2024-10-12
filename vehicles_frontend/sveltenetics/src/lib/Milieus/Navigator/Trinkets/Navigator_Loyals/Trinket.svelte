

<script>

//
//
import { onMount, onDestroy } from 'svelte'
//
//
import { check_Milieus_truck, monitor_Milieus_truck } from '$lib/Milieus/Truck'
import Milieus_Button from '$lib/Milieus/Button/Trinket.svelte'
import Seeds_Trucks from '$lib/Versies/Trucks.svelte'
import { check_roomies_truck } from '$lib/Versies/Trucks'
//
//
import Flourishes_Component from './Signatures.svelte'
//
//

let mode = check_Milieus_truck ().freight.mode;
let location = check_Milieus_truck ().freight.location;

let Scholars_Trucks_Prepared = "no"
let Scholars_Trucks_Monitor;
let Scholars_Trucks_Freight;
onMount (async () => {
	Scholars_Trucks_Freight = check_Milieus_truck ().freight; 
	
	Scholars_Trucks_Monitor = monitor_Milieus_truck ((_freight) => {
		Scholars_Trucks_Freight = _freight;
		
		mode = Scholars_Trucks_Freight.mode;
		location = Scholars_Trucks_Freight.location;
	})
	
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


{#if location [0] === "Loyals" }
<div
	style="
		display: flex;
		gap: 0.2cm;
	"
>
	<Seeds_Trucks 
		on_change={ on_seeds_truck_change } 
	/>

	{#if seeds_trucks_prepared === "yes"}
	<Milieus_Button
		name={ "Hints" }
		location={[ "Loyals", "Hints" ]}
		is_open_location={[ "Loyals", "Hints" ]}
		
		style={ buttons_styles }
	/>
	<Milieus_Button
		name={ "Accounts" }
		location={[ "Loyals", "Accounts" ]}
		is_open_location={[ "Loyals", "Accounts" ]}
		
		style={ buttons_styles }
	/>
	<Milieus_Button
		name={ "Signatures" }
		location={[ "Loyals", "Signatures" ]}
		is_open_location={[ "Loyals", "Signatures" ]}
		component={ Flourishes_Component }
		
		style={ buttons_styles }
	/>
	{/if}
</div>
{/if}

