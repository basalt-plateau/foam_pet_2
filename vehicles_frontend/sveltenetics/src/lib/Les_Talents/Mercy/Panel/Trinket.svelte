

<script>


const address_builder = ""




///
//
import { Autocomplete } from '@skeletonlabs/skeleton';
import { popup } from '@skeletonlabs/skeleton';
import _merge from 'lodash/merge'
//
//
import Polytope from './Polytope/Trinket.svelte'
import Leaf from '$lib/trinkets/Layout/Leaf/Trinket.svelte'
//
import Panel_1 from './Leaf/Trinket.svelte'
//
///



let polytope_modal;



const on_modal_change = () => {}




let on_back = []

const open_a_panel = ({ panel_name }) => {
	show_panel = panel_name
}



let polytope_freight = {}
let prepared = "no"
const on_prepare = () => {
	prepared = "yes"
}

let isOpen = false;

</script>


<Polytope 
	bind:this={ polytope_modal }
	on_change={ on_modal_change }
	on_prepare={ on_prepare }
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