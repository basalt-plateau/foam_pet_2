

<script>

/*
	The goal is that this becomes an extension.
*/


/*
	import Perfume from "$lib/Perfume/Trinket.svelte"
	<Perfume />
*/


////
//
import { onMount, onDestroy } from 'svelte'
//
//
import { Autocomplete } from '@skeletonlabs/skeleton';
import { RadioGroup, RadioItem } from '@skeletonlabs/skeleton';
import { popup } from '@skeletonlabs/skeleton';
import _merge from 'lodash/merge'
//
//
import { Slangify } from "$lib/trinkets/Slang"
import Slang from '$lib/trinkets/Slang/Trinket.svelte'
//
//
import Hints from './Hints/Trinket.svelte'
import Harvests from './Harvests/Trinket.svelte'
import Consent_Leaf from './Consent/Trinket.svelte'
import Garden_Leaf from './Garden/Tome.svelte'
import Beauty_Leaf from './Beauty/Tome.svelte'
//
import * as Perfume_Truck from "./_Truck/index.js"
//
////

let leaf = "Hints";


let prepared = "no"
let Perfume_Truck_Freight;
let Perfume_Truck_Monitor;
onMount (async () => {	
	Perfume_Truck.make ()
	Perfume_Truck_Monitor = Perfume_Truck.monitor (async ({
		original_freight,
		pro_freight, 
		//
		target,
		//
		property, 
		value
	}) => {
		try {
			Perfume_Truck_Freight = Perfume_Truck.retrieve ().pro_freight; 
		}
		catch (imperfection) {
			console.error (imperfection);
		}
	});
	
	Perfume_Truck_Freight = Perfume_Truck.retrieve ().pro_freight;  
	prepared = "yep"
});
onDestroy (() => {
	Perfume_Truck_Monitor.stop ()
	Perfume_Truck.destroy ()
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
				<RadioItem bind:group={ leaf } name="justify" value={ "Hints" }>Hints</RadioItem>
				<RadioItem bind:group={ leaf } name="justify" value={ "Consent" }>Consent</RadioItem>
				<RadioItem bind:group={ leaf } name="justify" value={ "Garden" }>Garden</RadioItem>		
				<RadioItem bind:group={ leaf } name="justify" value={ "Beauty" }>Beauty</RadioItem>	
				<RadioItem bind:group={ leaf } name="justify" value={ "Harvests" }>Harvests</RadioItem>
			</RadioGroup>
		</div>
	</div>
	
	<div
		style="
			position: absolute;
			top: 100px;
			left: 0;
		
			box-sizing: border-box;
			height: calc(100% - 100px);
			width: 100%;
		"
	>
		{#if leaf === "Hints"}
		<Hints />
		{:else if leaf === "Garden" }
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