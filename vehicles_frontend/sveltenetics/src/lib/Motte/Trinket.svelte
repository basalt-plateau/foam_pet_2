

<script>

/*
	The goal is that this becomes an extension.
*/


/*
	import Motte from "$lib/Motte/Trinket.svelte"
	<Motte />
*/


////
//
import { onMount, onDestroy } from 'svelte'
//
import { Autocomplete } from '@skeletonlabs/skeleton';
import { RadioGroup, RadioItem } from '@skeletonlabs/skeleton';
import { popup } from '@skeletonlabs/skeleton';
//
import _merge from 'lodash/merge'
//
//
import { Slangify } from "$lib/trinkets/Slang"
import Slang from '$lib/trinkets/Slang/Trinket.svelte'
//
//
import Tutorials from './Tutorials/Trinket.svelte'
import Harvests from './Harvests/Trinket.svelte'
import Consent_Leaf from './Consent/Trinket.svelte'
import Garden_Leaf from './Garden/Tome.svelte'
import Beauty_Leaf from './Beauty/Tome.svelte'
//
import * as Motte_Truck from "./_Truck/index.js"
//
////

let leaf = "Tutorials";


let prepared = "no"
let Motte_Truck_Freight;
let Motte_Truck_Monitor;
onMount (async () => {	
	Motte_Truck.make ()
	Motte_Truck_Monitor = Motte_Truck.monitor (async ({
		original_freight,
		pro_freight, 
		//
		target,
		//
		property, 
		value
	}) => {
		try {
			Motte_Truck_Freight = Motte_Truck.retrieve ().pro_freight; 
		}
		catch (imperfection) {
			console.error (imperfection);
		}
	});
	
	Motte_Truck_Freight = Motte_Truck.retrieve ().pro_freight;  
	prepared = "yep"
});
onDestroy (() => {
	Motte_Truck_Monitor.stop ()
	Motte_Truck.destroy ()
});

let nav_width = 0;
let nav_height = 0;

</script>


{#if prepared === "yep" }
<div
	style="
		position: relative;
		
		height: 100%;
		width: 100%;
		padding: 0 0cm;
		
		display: flex;
		justify-content: center;
		align-items: center;
		flex-direction: column;
	"
>
	<div
		bind:clientWidth={ nav_width } 
		bind:clientHeight={ nav_height }
	
		style="
			position: relative;
			top: 0;
			left: 0;
			
			width: 100%;
			
			text-align: center;
			
			display: flex;
			justify-content: center;
			align-items: center;
			flex-direction: column;
		"
	>
		<div>
			<RadioGroup
				flexDirection={ nav_width <= 800 ? 'flex-col' : 'row'}
				rounded={ nav_width <= 800 ? 'rounded-container-token' : 'rounded-token'}
			>
				<RadioItem bind:group={ leaf } name="justify" value={ "Tutorials" }>Tutorials</RadioItem>
				<RadioItem bind:group={ leaf } name="justify" value={ "Franchise" }>Franchise</RadioItem>		
				<RadioItem bind:group={ leaf } name="justify" value={ "Beauty" }>Beauty</RadioItem>	
				<RadioItem bind:group={ leaf } name="justify" value={ "Harvests" }>
					<p monitor="accounts opener">Harvests</p>
				</RadioItem>
				<RadioItem bind:group={ leaf } name="justify" value={ "Consent" }>
					<p monitor="consent opener">Elliptic Consent</p>
				</RadioItem>				
			</RadioGroup>
		</div>
	</div>
	
	<div
		style="
			position: relative;
			left: 0;
		
			box-sizing: border-box;
			width: 100%;
		"
	>
		{#if leaf === "Tutorials"}
		<Tutorials />
		{:else if leaf === "Franchise" }
		<Garden_Leaf />
		{:else if leaf === "Beauty" }
		<Beauty_Leaf />
		{:else if leaf === "Harvests" }
		<Harvests />
		{:else if leaf === "Consent" }			
		<Consent_Leaf />
		{/if}
	</div>
</div>
{/if}