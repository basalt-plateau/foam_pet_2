

<script>


////
//
import { Modal, getModalStore } from '@skeletonlabs/skeleton';
import _get from 'lodash/get'
//
//
import Leaf from '$lib/trinkets/Layout/Leaf/Trinket.svelte'
import Slang from '$lib/trinkets/Slang/Trinket.svelte'
//
import { check_roomies_truck } from '$lib/Versies/Trucks'
import Milieus_Truck from '$lib/Milieus/Truck/Trinket.svelte'
//
import { Slangify } from "$lib/trinkets/Slang"
//
//
import Getting_Moving from './Getting_Moving/Trinket.svelte'
import Preparation_Tutorial from './Preparation_Tutorial/Trinket.svelte'
import Boards from './Boards/Trinket.svelte'
import Pleasantries from './Pleasantries/Trinket.svelte'
import Regions from './Regions/Estate.svelte'
//
////
import Rules_Frontier from "$lib/Les_Talents/Rules/Frontier/Board.svelte"

import Textboard_Leaf from "$lib/Les_Talents/Textboard/Leaf/Board.svelte"
	

const modal_store = getModalStore ();
const mode = check_roomies_truck ().freight.mode;		

let Milieus_Freight = false;



</script>


<style>
.gradient-heading {
	@apply bg-clip-text text-transparent box-decoration-clone;
	@apply bg-gradient-to-br;
	@apply from-primary-400 via-secondary-500 to-primary-500;
}

.badge {
	white-space: break-spaces;
}
</style>


<Leaf>
	<Milieus_Truck on_change={ ({ freight }) => { Milieus_Freight = freight; } } />
	{#if typeof Milieus_Freight === "object"}
	
	{#if false}
	<div style="height: 0.5cm"></div>
	<Boards />
	{/if}
	
	<div style="height: 0.5cm"></div>
	
	<Textboard_Leaf />
	
	<div style="height: 0.5cm"></div>
	<Pleasantries />
	<div style="height: 0.5cm"></div>
	
	<div
		class="card p-4"
		style="
			margin: 0 auto;
			text-align: center;
		"
	>		
		<div
			class="card p-4 variant-soft-surface"
			style="
				margin: 0 auto;
				text-align: center;
			"
		>	
			<Rules_Frontier />
		</div>
	</div>
	
	

	<div style="height: 5cm"></div>
	{/if}
</Leaf>

