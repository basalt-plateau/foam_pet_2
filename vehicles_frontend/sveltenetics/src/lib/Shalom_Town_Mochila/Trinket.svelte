

<script>

/*
	The goal is that this becomes an extension.
*/

/*
	import Shalom_Town_Mochila from "$lib/Shalom_Town_Mochila/Trinket.svelte"
	<Shalom_Town_Mochila />
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


let leaf = "Hints";

let text = {
	Hints: (
		"အညွှန်းများ"
	),
	Consent: (
		"зөвшөөрөл"
	)
}

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
		"
	>
		<div>
			<RadioGroup>
				<RadioItem bind:group={ leaf } name="justify" value={ "Hints" }>{ text.Hints }</RadioItem>
				<RadioItem bind:group={ leaf } name="justify" value={ "Harvests" }>ᚉᚏᚒᚐᚌ</RadioItem>
				<RadioItem bind:group={ leaf } name="justify" value={ "Consent" }>{ text.Consent }</RadioItem>
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
		{:else if leaf === "Harvests" }
		<Harvests />
		{:else if leaf === "Consent" }			
		<Consent_Leaf />
		{/if}
	</div>
</div>
