


<script>

////
//
import { onMount, onDestroy } from 'svelte'
//
//
import Code_Wall from '$lib/trinkets/Code_Wall/Trinket.svelte' 
//
//
import * as PT from './../Truck/index.js'
//
////


import Petition_Truck from '$lib/PTO/Transaction_Offline/Petition/Truck/Ride.svelte'
let PT_Freight = false


	

</script>

<div
	style="
		display: flex;
		gap: 0.25cm;
		
		flex-direction: column;
		
		padding: 0.25cm;
	"
>
	<Petition_Truck on_change={ ({ freight }) => { PT_Freight = freight; } } />
	{#if typeof PT_Freight === "object"}





	{/if}
</div>