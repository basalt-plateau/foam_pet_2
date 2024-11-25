

<script>

/*
	import Offline_Petition from '$lib/PTO/Transaction_Offline/Petition/Trinket.svelte'
	<Offline_Petition />
*/

/*
	TODO:
	
		import Offline_Petition from '$lib/PTO/Transaction_Offline/Petition/Trinket.svelte'
		<Offline_Petition 
			begin_at_bracket="yes"
		/>
		
		// somehow call function in Component
		OP.use_fields ({
			
		})
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
import { Accordion, AccordionItem } from '@skeletonlabs/skeleton';
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
import * as Petition_Truck from './Truck/index.js'
//
////


import { check_roomies_truck, monitor_roomies_truck } from '$lib/Versies/Trucks'




let le_buttons = [ 1,2,3,4,5,6 ]

let prepared = "no"
let freight = {}


let Seeds_Trucks_Prepared = "no"
let Seeds_Trucks_Monitor;
let Seeds_Trucks_Freight;
onMount (async () => {
	Seeds_Trucks_Freight = check_roomies_truck ().freight; 
	Seeds_Trucks_Monitor = monitor_roomies_truck ((_freight) => {
		Seeds_Trucks_Freight = _freight;
		freight.net_path = Seeds_Trucks_Freight.net_path;		
	})
	Seeds_Trucks_Prepared = "yes"
	
	
	
	
	
	
	Petition_Truck.refresh_truck ()
	//
	freight = Petition_Truck.retrieve_truck ().freight;
	Petition_Truck.monitor_truck ((_freight) => {
		freight = _freight;
	})
	
	freight.net_path = Seeds_Trucks_Freight.net_path;
	
	prepared = "yes"
});
onDestroy (() => {
	Petition_Truck.destroy_truck ()
	Seeds_Trucks_Monitor.stop ()
});

</script>


{#if prepared === "yes" }
<div 
	style="
		position: relative;
		height: 100%;
		width: 100%;
	"
	class="card"
>
	<div
		style="
			position: absolute;
			height: 30px;
			width: 100%;
			
			box-sizing: border-box;
			
			border-bottom: 2px solid black;
			border-bottom-left-radius: 0;
			border-bottom-right-radius: 0;
	
			border-top-left-radius: 8x;
			border-top-right-radius: 8px;	
		"
	>
		<header
			style="
				position: relative;
				
				display: flex;
				justify-content: center;
				align-items: center;
				
				height: 100%;
				width: 100%;
			"
		>
			{ freight.leaf_name }
		</header>
	</div>
	
	
	<div
		style="
			position: absolute;
			top: 30px;
			height: calc(100% - 80px);
			width: 100%;
			overflow-y: scroll;
		"
	>
		<div
			style="
				border-bottom: 2px solid black;
				border-bottom-left-radius: 0;
				border-bottom-right-radius: 0;
		
				border-top-left-radius: 8x;
				border-top-right-radius: 8px;
			"
		>
			<Accordion>
				<AccordionItem>
					<svelte:fragment slot="summary">petition freight</svelte:fragment>
					<svelte:fragment slot="content">
						<pre>{ freight.petition_field_barrier }</pre>
						<pre>{ JSON.stringify (freight, null, 2) }</pre>
					</svelte:fragment>
				</AccordionItem>
			</Accordion>
		</div>

	
		{#if freight.leaf_name === "Petition Form" }
		<Petition_Form />
		{:else if freight.leaf_name === "Petition Verification" }
		<Petition_Verification />
		{:else if freight.leaf_name === "Petition Send" }
		<Petition_Send />
		{:else if freight.leaf_name === "Flourish Receive" }
		{:else if freight.leaf_name === "Flourish Verification" }
		{:else if freight.leaf_name === "Adaptation Suggestion" }
		{/if}
	</div>
	

	<div
		style="
			position: absolute;
			bottom: 0;
			left: 0;
			
			width: 100%;
			height: 50px;
		
			display: flex;
			justify-content: center;
			gap: 0.25cm;
			
			padding: 0.2cm;
			
			border-top: 2px solid black;
			border-top-left-radius: 0;
			border-top-right-radius: 0;
	
			border-bottom-left-radius: 8x;
			border-bottom-right-radius: 8px;			
		"
		class="card"
	>
		<button
			type="button" class="btn variant-filled"
			disabled={ freight.back !== "yes" }
			
			on:click={ Petition_Truck.back }
		>back</button>
		
		<div class="btn-group variant-filled">
			{#each le_buttons as le_button }
			<button
				on:click={ Petition_Truck.go_to ({ leaf_page: le_button }) }
			>{ le_button }</button>
			{/each}
		</div>
		
		<button
			type="button" class="btn variant-filled"
			disabled={ freight.next !== "yes" }
			
			on:click={ Petition_Truck.next }
		>next</button>			
	</div>
	
</div>
{/if}