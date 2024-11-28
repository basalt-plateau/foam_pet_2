


<script>

////
//
import { onMount, onDestroy } from 'svelte'
//
//
//
//
import * as PT from './../Truck/index.js'
//
////


import Petition_Truck from '$lib/PTO/Offline/Petition_Form/Truck/Ride.svelte'
let PT_Freight = false



import Petition2_Bracket from '$lib/PTO/Offline/Petition/Bracket/Gem.svelte'
import Petition2_Bracket_Details from '$lib/PTO/Offline/Petition/Bracket/Details.svelte'
	



</script>

<div
	style="
		display: flex;
		gap: 0.25cm;
		
		flex-direction: column;
		
		padding: 0.25cm 0.25cm 5cm; 
	"
>
	<Petition_Truck on_change={ ({ pro_freight }) => { PT_Freight = pro_freight; } } />
	{#if typeof PT_Freight === "object"}
	<Petition2_Bracket_Details />
	<Petition2_Bracket 
		petition_AO_fiberized={ PT_Freight.petition_kit_fiberized }
	/>
	{/if}
</div>