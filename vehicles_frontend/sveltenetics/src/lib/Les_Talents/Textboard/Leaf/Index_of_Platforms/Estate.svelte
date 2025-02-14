


<script>

import { onMount, onDestroy } from 'svelte'
import Textboard_Truck_Ride from '$lib/Les_Talents/Textboard/Truck/Ride.svelte'
import * as Textboard_Truck from "$lib/Les_Talents/Textboard/Truck/index.js"

let TF = false;

const on_click = ({ name }) => {
	console.info (`on_click: "${ name }"`);
}

onMount (() => {
	Textboard_Truck.freight ().fonctions.retrieve_hulls ();
}); 

</script>


<div 
	style="
		height: 100%;
	"
	class="card p-2 variant-soft-surface"
>
	<Textboard_Truck_Ride on_change={ ({ pro_freight }) => { TF = pro_freight; } } />
	{#if typeof TF === "object" }
	<div
		
	>
		{#each TF.info.hulls as hull }
		<div
			style="
				padding: 0.25cm 0;
			"
		>
			<button
				on:click={() => { 
					on_click ({ name: hull.name });
				}}
				class="card p-2 variant-filled-primary"
				style="
					min-height: 20px;
					min-width: 50px;
				"
			>"{ hull.name }"</button>
		</div>
		{/each}
	</div>
	{/if}
</div>