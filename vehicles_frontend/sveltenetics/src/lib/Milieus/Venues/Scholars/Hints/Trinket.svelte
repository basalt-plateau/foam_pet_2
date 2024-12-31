

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
//
import Getting_Moving from './Getting_Moving/Trinket.svelte'
import Preparation_Tutorial from './Preparation_Tutorial/Trinket.svelte'
import Boards from './Boards/Trinket.svelte'
import Mural from './Mural/Trinket.svelte'
import Pleasantries from './Pleasantries/Trinket.svelte'
import Regions from './Regions/Estate.svelte'
import AI_Caution from './AI_Caution/Estate.svelte'
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

<svelte:head>
	<title>Ecology</title>
</svelte:head>


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
	
	<div
		class="card p-4"
		style="
			display: none;
			width: 100%;
		"
	>
		<div
			class="card p-4 variant-soft-surface"
			
			style="
				width: 100%;
				font-size: 1.2em;
			"
		>
			<p
				style="
					text-align: center;
				"
			>The <b style="font-size: 1.4em">Ecology</b> region has features that affect the local browser.</p>
		</div>
	</div>
	
	<div style="height: 0.5cm"></div>

	<div
		class="card p-4"
		style="
			width: 100%;
		"
	>
		<div
			style="
				display: flex;
				border-radius: 4px;
				justify-content: center;
			"
			class="card p-4 variant-soft-surface"
		>
			<svg 
				width="100%" 
				height="100%" 
				viewBox="0 0 300 100"
			>
				<text 
					text-anchor="middle" 
					alignment-baseline="middle"
					
					lengthAdjust="spacingAndGlyphs"
					dominant-baseline="middle" 
					
					style="
						font-family: 'Rubik Vinyl', sans-serif;
						font-weight: bold;
						font-size: 2.8em;
						fill: rgb(var(--color-primary-500));
					"
				>
					<tspan x="150" dy="30">Shalom</tspan>
					<tspan x="150" dy="45">Town</tspan>
				</text>
			</svg>
		</div>
	</div>

	

	<!-- 
	<div style="height: 0.5cm"></div>
	<AI_Caution />
	-->
	
	<div style="height: 0.5cm"></div>
	<Boards />
	
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
			>Bayanihan</button>
		</div>
	</div>

	<div style="height: 0.5cm"></div>
	<Getting_Moving />	
	
	<!--
	<div style="height: 0.5cm"></div>
	<Regions />
	-->
	
	<div style="height: 0.5cm"></div>
	
	<div
		class="card p-4"
		style="
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
		
		<p>
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

