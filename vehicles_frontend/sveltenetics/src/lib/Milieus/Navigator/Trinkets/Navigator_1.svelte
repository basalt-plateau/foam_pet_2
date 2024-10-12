

<script>

//
//
import { onMount, onDestroy } from 'svelte'
//
//
import Milieus_Button from '$lib/Milieus/Button/Trinket.svelte'
import { check_roomies_truck, monitor_roomies_truck } from '$lib/Versies/Trucks'
import Loyals from '$lib/Letters/Loyals.svelte'
import { parse_styles } from '$lib/trinkets/styles/parse'
//
//
	
let mode = check_roomies_truck ().freight.mode;
let window_width = check_roomies_truck ().freight.window_width;

let Scholars_Trucks_Prepared = "no"
let Scholars_Trucks_Monitor;
let Scholars_Trucks_Freight;
onMount (async () => {
	const Truck = check_roomies_truck ()
	Scholars_Trucks_Freight = Truck.freight; 
	
	Scholars_Trucks_Monitor = monitor_roomies_truck ((_freight) => {
		Scholars_Trucks_Freight = _freight;
		build ()
	})
	
	build ();
	
	Scholars_Trucks_Prepared = "yes"
});

onDestroy (() => {
	Scholars_Trucks_Monitor.stop ()
}); 



let buttons_styles = ""
let loyals_button_styles = {}
const build = () => {
	mode = check_roomies_truck ().freight.mode;
	window_width = check_roomies_truck ().freight.window_width;
	
	if (window_width > 800) {
		buttons_styles = 'padding: 0.2cm 0.6cm; margin: 0 0.1cm; font-size: 1.2em'
		loyals_button_styles = {
			height: "27px",
			width: "60px"
		}
	}
	else {
		buttons_styles = ''
		loyals_button_styles = {}
	}
}



// "ᎤᏓᏅᏙᏗ"
let names = {
	seeds: (
		"அறிஞர்கள்"
	),
	friends: (
		"ጓደኛዎች"
	),
	loyals: (
		"ᐊᔭᖅ"
	)	
}

let loyals_name_2 = '/pictures/loyals.svg';

/*
	<img 
		style="
			height: 1.4cm;
		"
		src={ pet } 
		alt="pet" 
	/>
*/

</script>


<div
	style="
		display: flex;
		gap: 0.2cm;
		
		font-size: 1.3em;
	"
>
	<Milieus_Button
		monitor="Scholars"
		
		name={ names.seeds }
		location={[ "Scholars", "Hints" ]}
		is_open_location={[ "Scholars" ]}
		
		style={ buttons_styles }
	/>
	<Milieus_Button
		monitor="Friends"
	
		name={ names.friends }
		location={[ "Friends", "Talents" ]}
		is_open_location={[ "Friends" ]}
		
		style={ buttons_styles }
	/>
	
	<Milieus_Button
		monitor="Loyals"
	
		location={[ "Loyals", "Hints" ]}
		is_open_location={[ "Loyals" ]}
		
		component={ Loyals }
		component_props={{
			style: loyals_button_styles
		}}
		
		style={ buttons_styles }
	/>
	
	{#if mode === "nurture" }
	<!-- <div style="width: 0.5cm"></div> -->
	<!-- <The_Map_Trinket /> -->
	

	<Milieus_Button
		name={ "Technicians" }
		location={[ "Technicians", "Map" ]}
		is_open_location={[ "Technicians" ]}
	/>
	{/if}
</div>