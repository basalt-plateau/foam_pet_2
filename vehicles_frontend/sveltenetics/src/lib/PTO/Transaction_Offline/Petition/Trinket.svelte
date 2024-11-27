

<script>

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
	lib/Milieus/Venues/Scholars/Resilience/Adaptation Prebuilt
*/


////
//
import { onMount, onDestroy } from 'svelte';
import { Paginator } from '@skeletonlabs/skeleton';
import { Accordion, AccordionItem } from '@skeletonlabs/skeleton';
import { RadioGroup, RadioItem } from '@skeletonlabs/skeleton';	
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
//
////

import Versies_Truck from '$lib/Versies/Trucks.svelte'
import Petition_Truck from '$lib/PTO/Transaction_Offline/Petition/Truck/Ride.svelte'
import * as PT from '$lib/PTO/Transaction_Offline/Petition/Truck/index.js'



export let use_fully_elected_petition_fields = "no"
export let fully_elected_petition_fields = {}



let PT_Freight = false;
$: {
	let _PT_Freight = PT_Freight;
	build_petition ();
}

let Versies_Freight = false;
$: {
	let _Versies_Freight = Versies_Freight;
	build_petition ();
}
	
let build_petition = () => {	
	
	console.log ({ PT_prepared, PT_Freight, Versies_Freight });
	
	if (
		PT_prepared === "yes" &&
		typeof PT_Freight === "object" &&
		typeof Versies_Freight === "object"
	) {
		console.log (`
			PT_Freight: ${ PT_Freight }
		
			build_petition called!
			
				petition fields: ${ JSON.stringify (fully_elected_petition_fields, null, 4) }
		`);

		PT_Freight.net_path = Versies_Freight.net_path;
		PT_Freight.petition_fields = fully_elected_petition_fields;
	}
	
	
}

let le_buttons = [ 1,2,3,4,5,6 ]

let PT_prepared = "no"
onMount (async () => {	
	PT.make_truck ()
	
	if (use_fully_elected_petition_fields === "yes") {
		build_petition ();
	}	
	
	PT_prepared = "yes"
});
onDestroy (() => {
	PT.destroy_truck ()
});

</script>

{#if PT_prepared === "yes" }
<div 
	style="
		position: relative;
		height: 100%;
		width: 100%;
	"
	class="card"
>
	<Versies_Truck on_change={ ({ freight }) => { Versies_Freight = freight } } />
	<Petition_Truck on_change={ ({ pro_freight }) => { PT_Freight = pro_freight; } } />

	{#if typeof PT_Freight === "object" && typeof Versies_Freight === "object"}
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
			{ PT_Freight.leaf_name }
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
						<pre>{ PT_Freight.petition_field_barrier }</pre>
						<pre>{ JSON.stringify (PT_Freight, null, 2) }</pre>
					</svelte:fragment>
				</AccordionItem>
			</Accordion>
		</div>

		<div
			style=""
		>
			{#if PT_Freight.leaf_name === "Petition Form" }
			<Petition_Form />
			{:else if PT_Freight.leaf_name === "Petition Verification" }
			<Petition_Verification />
			{:else if PT_Freight.leaf_name === "Petition Send" }
			<Petition_Send />
			{:else if PT_Freight.leaf_name === "Flourish Receive" }
			<Flourish_Receive />
			{:else if PT_Freight.leaf_name === "Flourish Verification" }
			<Flourish_Verification />
			{:else if PT_Freight.leaf_name === "Adaptation Suggestion" }
			<Adaptation_Suggestion />
			{/if}
		</div>
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
			disabled={ PT_Freight.back !== "yes" }
			
			on:click={ PT.back }
		>back</button>
		
		<!-- class="btn-group variant-filled" -->
		<div
			style="
				display: flex;
			"
		>
			{#each le_buttons as le_button }
			<button
				style="
					margin: 0 2px;
					padding: 0.25cm 0.5cm;
				"
				class={(
					[ 
						"chip",
						PT_Freight.leaf_numeral === le_button ? "variant-filled" : "variant-soft"	
					].join (" ")
				)}
				on:click={ 
					PT.go_to ({ leaf_page: le_button }) 
				}
			>{ le_button }</button>
			{/each}
		</div>
				
		<button
			type="button" 
			class="btn variant-filled"
			disabled={ PT_Freight.next !== "yes" }
			
			on:click={ PT.next }
		>next</button>			
	</div>
	{/if}
</div>
{/if}