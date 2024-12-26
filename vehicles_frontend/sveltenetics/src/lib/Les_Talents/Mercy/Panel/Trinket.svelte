

<script>



////
//
import { onMount, onDestroy } from 'svelte'
import { Autocomplete } from '@skeletonlabs/skeleton';
import { popup } from '@skeletonlabs/skeleton';
import _merge from 'lodash/merge'
//
//
import Leaf from '$lib/trinkets/Layout/Leaf/Trinket.svelte'
//
//
import Polytope from './Polytope/Trinket.svelte'
import Panel_1 from './Leaf/Trinket.svelte'
//
////


import * as Mercy_Truck from '$lib/Les_Talents/Mercy/Panel/_Truck/index.js'



let polytope_modal;


const on_modal_change = () => {}
const on_prepare = () => { }

let prepared = "no"
onMount (async () => {	
	Mercy_Truck.make ()
	prepared = "yes"
});
onDestroy (() => {
	Mercy_Truck.destroy ()
	prepared = "no"
});

</script>


<Polytope 
	bind:this={ polytope_modal }
	on_change={ on_modal_change }
>
	<div slot="leaves"
		style="
			height: 100%;
			width: 100%;
			
			display: flex;
			justify-content: center;
			align-items: center;
		"
	>
		{#if prepared === "yes" }
		<Panel_1 />
		{/if}
	</div>
	
	<div slot="unfinished">
		<div>
			This is unfinished
		</div>
	</div>
</Polytope>