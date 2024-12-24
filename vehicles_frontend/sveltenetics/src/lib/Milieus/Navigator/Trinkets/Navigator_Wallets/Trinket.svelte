


<script>

//
//
import { onMount, onDestroy } from 'svelte'
//
//
import { check_Milieus_truck, monitor_Milieus_truck } from '$lib/Milieus/Truck'
import { check_roomies_truck } from '$lib/Versies/Trucks'
//
import Milieus_Button from '$lib/Milieus/Button/Trinket.svelte'
import Seeds_Trucks from '$lib/Versies/Trucks.svelte'
//
//
import Foam_Pet_Wallet_Frontier from "$lib/Les_Talents/Foam_Pet_Wallet/Frontier/Trinket.svelte"
	

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
	<Seeds_Trucks  on_change={ on_seeds_truck_change }  />

	{#if seeds_trucks_prepared === "yes"}
	<Milieus_Button
		monitor="Wallets Foam Pet Wallet"
	
		name={ "Foam Pet Wallet" }
		location={[ "Loyals", "Foam Pet Wallet" ]}
		is_open_location={[ "Loyals", "Foam Pet Wallet" ]}
		
		style={ buttons_styles }
	/>
	
	<Foam_Pet_Wallet_Frontier />
	
	<Milieus_Button
		monitor="Wallets Connect"
	
		name={ "Connect" }
		location={[ "Loyals", "Connect" ]}
		is_open_location={[ "Loyals", "Connect" ]}
		
		style={ buttons_styles }
	/>
	{/if}
</div>
{/if}

