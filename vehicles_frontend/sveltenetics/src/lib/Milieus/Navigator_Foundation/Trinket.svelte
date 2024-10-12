



<script>

///
//
// https://lucide.dev/guide/packages/lucide-svelte#one-generic-icon-component
// https://lucide.dev/icons/
//
//

//\\
//
//
import Milieus_Truck from '$lib/Milieus/Truck/Trinket.svelte'
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



</script>

{#if mode === "nurture" }
<nav>
	<Milieus_Truck on_change={ on_seeds_truck_change }/>
		
	<hr class="!border-t-2" />
	<div class="bg-surface-100-800-token w-full"
		style="
			display: flex;
			align-items: center;
			justify-content: left;
			gap: 6px;
			
			padding: 2px;
		"
	>
		{#each location as location_ }
		<span class="badge variant-filled-surface"
			style="
				padding: 2px 4px;
			"
		>{ location_ }</span>
		{/each}
	</div>
</nav>
{/if}