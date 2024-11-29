

<script>

/*
	TODO:
	
		import Offline_Petition from '$lib/PTO/Offline/Petition_Form/Trinket.svelte'
		<Offline_Petition 
			begin_at_bracket="yes"
		/>
		
		// somehow call function in Component
		OP.use_fields ({
			
		})
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
import Versies_Truck from '$lib/Versies/Trucks.svelte'
//
//
////

import Signatory_Truck from './Truck/Ride.svelte'
import * as ST from './Truck/index.js'


import Petition_Field from './1_Petition_Field/Trinket.svelte'
import Petition_Verification from './2_Petition_Verification/Gem.svelte'
import Flourish_Field from './3_Flourish_Field/Gem.svelte'
import Flourish_Verification from './4_Flourish_Verification/Gem.svelte'
import Flourish_Code from './5_Flourish_Code/Gem.svelte'


let ST_Freight = false;
$: {
	let _ST_Freight = ST_Freight;
}

let Versies_Freight = false;
$: {
	let _Versies_Freight = Versies_Freight;
}
	
let build_petition = () => {	
	

	
}

let le_buttons = [ 1,2,3,4,5 ]

let ST_prepared = "no"
onMount (async () => {	
	ST.make_truck ()

	ST_prepared = "yes"
});
onDestroy (() => {
	ST.destroy_truck ()
});

</script>

{#if ST_prepared === "yes" }
<div 
	style="
		position: relative;
		height: 100%;
		width: 100%;
	"
	class="card"
>
	<Versies_Truck on_change={ ({ freight }) => { Versies_Freight = freight } } />
	<Signatory_Truck on_change={ ({ pro_freight }) => { ST_Freight = pro_freight; } } />

	{#if typeof ST_Freight === "object" && typeof Versies_Freight === "object"}
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
			{ ST_Freight.leaf_name }
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
					<svelte:fragment slot="summary">signatory freight</svelte:fragment>
					<svelte:fragment slot="content">
						<pre>{ ST_Freight.signature_field_barrier }</pre>
						<pre>{ JSON.stringify (ST_Freight, null, 2) }</pre>
					</svelte:fragment>
				</AccordionItem>
			</Accordion>
		</div>

		<div
			style=""
		>
			{ ST_Freight.leaf_name }
		
			{#if ST_Freight.leaf_name === "Petition Field" }
			<Petition_Field />
			{:else if ST_Freight.leaf_name === "Petition Verification" }
			<Petition_Verification />
			{:else if ST_Freight.leaf_name === "Flourish Field" }
			<Flourish_Field />
			{:else if ST_Freight.leaf_name === "Flourish Verification" }
			<Flourish_Verification />
			{:else if ST_Freight.leaf_name === "Flourish Send" }
			<Flourish_Code />
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
			disabled={ ST_Freight.back !== "yes" }
			
			on:click={ ST.back }
		>back</button>
		
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
						ST_Freight.leaf_numeral === le_button ? "variant-filled" : "variant-soft"	
					].join (" ")
				)}
				on:click={ 
					ST.go_to ({ leaf_page: le_button }) 
				}
			>{ le_button }</button>
			{/each}
		</div>
				
		<button
			type="button" 
			class="btn variant-filled"
			disabled={ ST_Freight.next !== "yes" }
			
			on:click={ ST.next }
		>next</button>			
	</div>
	{/if}
</div>
{/if}