

<script>

/*
	The goal is that this becomes an extension.
*/

/*
	import Grimoire from "$lib/Grimoire/Trinket.svelte"
	<Grimoire />
*/


const address_builder = ""

///
//
import { Autocomplete } from '@skeletonlabs/skeleton';
import { RadioGroup, RadioItem } from '@skeletonlabs/skeleton';
import { popup } from '@skeletonlabs/skeleton';
import _merge from 'lodash/merge'
//
//
///

import Hints from './Hints/Trinket.svelte'
import Harvests from './Harvests/Trinket.svelte'
import Consent_Leaf from './Consent/Trinket.svelte'


import Grimoire_Truck from "./_Truck/index.js"
const GTF = Truck_1.retrieve ().pro_freight;

let leaf = "Hints";

import { onMount, onDestroy } from 'svelte'
import * as Truck_1 from '$lib/trucks/truck_1/index.js'

onMount (async () => {	
	Truck_1.make ()
});
onDestroy (() => {
	Truck_1.destroy ()
});

</script>


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
				<RadioItem bind:group={ leaf } name="justify" value={ "Harvests" }>Harvests</RadioItem>
				<RadioItem bind:group={ leaf } name="justify" value={ "Consent" }>Consent</RadioItem>
			</RadioGroup>
		</div>
		
		<p
			style="
				text-align: center;
				font-size: 1em;
			"
		>This is a prototype.</p>
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
		{:else if leaf === "Harvests" }
		<Harvests />
		{:else if leaf === "Consent" }			
		<Consent_Leaf />
		{/if}
	</div>
</div>
