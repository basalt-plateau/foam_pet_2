

<script>

/*
	The goal is that this becomes an extension.
*/


/*
	import Greetings from "$lib/Greetings/Trinket.svelte"
	<Greetings />
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
import School from './School/Trinket.svelte'
import Harvests from './Harvests/Trinket.svelte'
import Consent_Leaf from './Consent/Trinket.svelte'
import Garden_Leaf from './Garden/Tome.svelte'
import Beauty_Leaf from './Beauty/Tome.svelte'
//
import * as Greetings_Truck from "./_Truck/index.js"
//
////

let leaf = "School";


let prepared = "no"
let Greetings_Truck_Freight;
let Greetings_Truck_Monitor;
onMount (async () => {	
	Greetings_Truck.make ()
	Greetings_Truck_Monitor = Greetings_Truck.monitor (async ({
		original_freight,
		pro_freight, 
		//
		target,
		//
		property, 
		value
	}) => {
		try {
			Greetings_Truck_Freight = Greetings_Truck.retrieve ().pro_freight; 
		}
		catch (imperfection) {
			console.error (imperfection);
		}
	});
	
	Greetings_Truck_Freight = Greetings_Truck.retrieve ().pro_freight;  
	prepared = "yep"
});
onDestroy (() => {
	Greetings_Truck_Monitor.stop ()
	Greetings_Truck.destroy ()
});

</script>


{#if prepared === "yep" }
<div
	style="
		position: relative;
		
		height: 100%;
		width: 100%;
		padding: 0 1cm;
		
		display: flex;
		justify-content: center;
		align-items: center;
		flex-direction: column;
	"
>
	<div
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
			<RadioGroup>
				<RadioItem bind:group={ leaf } name="justify" value={ "School" }>School</RadioItem>
				<RadioItem bind:group={ leaf } name="justify" value={ "Franchise" }>Franchise</RadioItem>		
				<RadioItem bind:group={ leaf } name="justify" value={ "Glam" }>Glam</RadioItem>	
				<RadioItem bind:group={ leaf } name="justify" value={ "Harvests" }>
					<p monitor="accounts opener">Harvests</p>
				</RadioItem>
				<RadioItem bind:group={ leaf } name="justify" value={ "Consent" }>
					<p monitor="consent opener">Consent</p>
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
		{#if leaf === "School"}
		<School />
		{:else if leaf === "Franchise" }
		<Garden_Leaf />
		{:else if leaf === "Glam" }
		<Beauty_Leaf />
		{:else if leaf === "Harvests" }
		<Harvests />
		{:else if leaf === "Consent" }			
		<Consent_Leaf />
		{/if}
	</div>
</div>
{/if}