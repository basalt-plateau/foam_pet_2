

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
import { open_rules } from './Rules/open'
//
////


const modal_store = getModalStore ();
const mode = check_roomies_truck ().freight.mode;		

let Milieus_Freight = false;


const show_rules = () => {
	open_rules ({ modal_store });
}


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
	
	<div style="height: 0.5cm"></div>
	<Boards />	
	<div style="height: 0.5cm"></div>
	<div
		class="card p-4"
		style="
			position: relative;
			width: 100%;
		"
	>
		<div style="height: 0.25cm"></div>
		
		<p
			style="
				text-align: center;
				font-size: 1.2em;
				
				margin: 0 auto;
				max-width: 700px;
				width: 100%;
				
				line-height: 200%;
			"
		>To enchant <Slang text="Aptos" />, venture on.</p>
		
		<div style="height: 0.25cm"></div>
	</div>
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
			<button
				on:click={ show_rules }
				type="button" 
				
				style="
					padding: 0.25cm 1.5cm;
				"
				class="btn btn-lg btn bg-gradient-to-br variant-gradient-primary-secondary"
			>Rules</button>
		</div>
	</div>

	<div style="height: 0.5cm"></div>
	<Getting_Moving />	
	
	<div style="height: 0.5cm"></div>
	
	<div
		class="card p-4"
		style="
			display: none;
		
			margin: 0 auto;
			text-align: center;
		"
	>
		<header 
			style="
				font-size: 2em; 
				text-align: center;
				padding: 0cm 0;
			"
		>Asks</header>
		

		
		<p
			style="
				display: none;
			"
		>
			<span>For any asks please open an <b>issue</b> or <b>pull request</b> at</span>
			<br />
			<a 
				target="_blank"
				href="https://github.com/basalt-plateau/foam_pet/issues"
			>https://github.com/basalt-plateau/foam_pet/issues</a>
			<br />
			<a 
				target="_blank"
				href="https://github.com/basalt-plateau/foam_pet/pulls"
			>https://github.com/basalt-plateau/foam_pet/pulls</a>
		</p>
	</div>
	
	<div style="height: 5cm"></div>
	{/if}
</Leaf>

