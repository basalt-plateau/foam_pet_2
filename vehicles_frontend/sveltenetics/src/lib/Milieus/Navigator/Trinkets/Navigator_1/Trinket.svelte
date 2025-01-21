

<script>

////
//
import { onMount, onDestroy } from 'svelte'
//
//
import { check_roomies_truck, monitor_roomies_truck } from '$lib/Versies/Trucks'
//
import { parse_styles } from '$lib/trinkets/styles/parse'
import Wallet_Frontier from "$lib/Les_Talents/_Wallet/Frontier/Trinket.svelte"
//
import Milieus_Truck from '$lib/Milieus/Truck/Trinket.svelte'
import Milieus_Button from '$lib/Milieus/Button/Trinket.svelte'
//
////
import Wallet_Button from './Wallet_Button.svelte'

	
let mode = check_roomies_truck ().freight.mode;
let window_width = check_roomies_truck ().freight.window_width;

let Scholars_Trucks_Prepared = "no"
let Scholars_Trucks_Monitor;
let Scholars_Trucks_Freight;
onMount (async () => {
	Scholars_Trucks_Freight = check_roomies_truck ().freight;
	
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

let Milieus_Freight = false;


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



</script>


<div
	monitor="navigator 1 structure"
	style="
		display: grid;
		grid-template-columns: repeat(auto-fit, minmax(3cm, 1fr));
		gap: 0.25cm;
		
		width: 100%;
		height: 100%;
		
		padding: 0.25cm;
		
		font-size: 1.3em;
	"
>
	<Milieus_Truck on_change={ ({ freight }) => { Milieus_Freight = freight; } } />
	{#if typeof Milieus_Freight === "object"}
	<Milieus_Button
		monitor="Ecology"
		
		name={ Milieus_Freight.nav_linguistics === "yes" ? Milieus_Freight.linguistics ["Scrolls"] : "Scrolls" }
		location={[ "Ecology", "Hints" ]}
		is_open_location={[ "Ecology" ]}
		
		style={ buttons_styles }
	/>
	<Milieus_Button
		monitor="Talents"
	
		name={ Milieus_Freight.nav_linguistics === "yes" ? Milieus_Freight.linguistics ["Panels"] : "Panels" }
		location={[ "Talents" ]}
		is_open_location={[ "Talents" ]}
		
		style={ buttons_styles }
	/>
	
	<Wallet_Button 
		buttons_styles={ buttons_styles }
	/>
	
	
	<!-- <Wallet_Frontier /> -->
	{/if}
</div>