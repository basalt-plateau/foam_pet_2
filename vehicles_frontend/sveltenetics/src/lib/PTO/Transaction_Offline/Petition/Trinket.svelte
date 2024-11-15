

<script>

/*
	import Offline_Petition from '$lib/PTO/Transaction_Offline/Petition/Trinket.svelte'
	<Offline_Petition />
*/

/*
	Panels:
		Petition Form
		Petition Verification
		Petition Send
		Signature Reader
		Signature Verification
		Adaptation Suggestion
*/

////
//
import { onMount, onDestroy } from 'svelte';
import { Paginator } from '@skeletonlabs/skeleton';
//
//
import Leaf from '$lib/trinkets/Layout/Leaf/Trinket.svelte'
//
//
import Petition_Form from './1_Petition_Form/Trinket.svelte'
import Petition_Verification from './2_Petition_Verification/Trinket.svelte'
import Petition_Send from './3_Petition_Send/Trinket.svelte'
import Flourish_Receive from './4_Flourish_Receive/Trinket.svelte'
import Flourish_Verification from './5_Flourish_Verification/Trinket.svelte'
import Adaptation_Suggestion from './6_Adaptation_Suggestion/Trinket.svelte'
//
import {
	refresh_truck, 
	retrieve_truck, 
	monitor_truck,
	destroy_truck,
	
	next,
	back,
	go_to
} from './Truck/index.js'
//
////


let le_buttons = [ 1,2,3,4,5,6 ]

let prepared = "no"
let freight = {}

onMount (() => {
	refresh_truck ()
	
	const Truck = retrieve_truck ()
	freight = Truck.freight;
	
	monitor_truck ((_freight) => {
		freight = _freight;
	})
	
	prepared = "yes"
});
onDestroy (() => {
	destroy_truck ()
});

</script>


{#if prepared === "yes" }
<div class="card p-2">
	<div>
	
	
	{#if freight.leaf_name === "Petition Form" }
		<Petition_Form />
	{:else if freight.leaf_name === "Petition Verification" }
		<Petition_Verification />
	{/if}
	</div>
	

	<div
		style="
			display: flex;
			justify-content: center;
		"
	>
		<div class="btn-group variant-filled">
			{#each le_buttons as le_button }
			<button
				on:click={ go_to ({ leaf_page: le_button }) }
			>{ le_button }</button>
			{/each}
		</div>
	</div>
	
	<div style="height: 0.25cm"></div>
	
	<div
		style="
			display: flex;
			justify-content: center;
			gap: 0.25cm;
		"
	>
		{ freight.leaf_name }
		<button
			type="button" class="btn variant-filled"
			disabled={ freight.back !== "yes" }
			
			on:click={ back }
		>back</button>
		<button
			type="button" class="btn variant-filled"
			disabled={ freight.next !== "yes" }
			
			on:click={ next }
		>next</button>			
	</div>
	
	<div style="height: 1cm"></div>
</div>
{/if}