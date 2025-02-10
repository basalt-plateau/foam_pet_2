



<script>


////
//
// https://lucide.dev/guide/packages/lucide-svelte#one-generic-icon-component
// https://lucide.dev/icons/
//
////

////
//
import Milieus_Truck from '$lib/Milieus/Truck/Trinket.svelte'
import Milieus_Button from '$lib/Milieus/Button/Trinket.svelte'
import Versies_Truck from '$lib/Versies/Trucks.svelte'
//
import Pig from "$lib/trinkets/Pig/Trinket.svelte"
import Cow from "$lib/trinkets/Cow/Trinket.svelte"
//
import { check_roomies_truck } from '$lib/Versies/Trucks'
//
////

let mode = check_roomies_truck ().freight.mode;

let navigator_1;
let location = []

let seeds_freight = {}
let seeds_trucks_prepared = "no"
const on_seeds_truck_change = ({ freight: _freight, happening }) => {
	seeds_freight = _freight;
	if (happening === "mounted") {
		seeds_trucks_prepared = "yes"
	}
	
	location = seeds_freight.location
}

let Milieus_Freight = ""
let Versies_Freight = false
$: {
	location = Versies_Freight.location;
}
	

let buttons_styles = ""

</script>



<nav
	style="
		position: relative;
		height: 100%;
		width: 100%;
		
		overflow-x: visible;
	"
>
	<Milieus_Truck on_change={ ({ freight }) => { Milieus_Freight = freight; } } />
	<Versies_Truck on_change={ ({ freight }) => { Versies_Freight = freight } } />
	<div
		style="
			position: absolute;
			bottom: 10px;
			left: 0;
			
			width: 100%;
			
			z-index: 1
		"
	>	
		<Cow />
		<Pig />
	</div>
	
	{#if typeof Milieus_Freight === "object" && typeof Versies_Freight === "object" }
	{#if mode === "nurture" }
	<div 
		style="
			position: absolute;
			bottom: 0;
			left: 0;
		
			display: flex;
			align-items: center;
			justify-content: left;
			gap: 6px;
			
			box-sizing: border-box;
			padding: 2px;
			height: 100%;
			width: 100%;
		"
		class="bg-surface-100-800-token w-full"
	>
		{#each Milieus_Freight.location as location_ }
		<span class="badge variant-filled-surface"
			style="
				padding: 2px 4px;
			"
		>{ location_ }</span>
		{/each}
	</div>
	{/if}
	{/if}
</nav>
