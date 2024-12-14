

<script>


////
//
import { Modal, getModalStore } from '@skeletonlabs/skeleton';
//
//
import Beacons from '$lib/trinkets/Hints/Beacons/Trinket.svelte'
import Leaf from '$lib/trinkets/Layout/Leaf/Trinket.svelte'
import Slang from '$lib/trinkets/Slang/Trinket.svelte'
import Offline_Signing_Hints from '$lib/trinkets/Hints/Offline_Signing/Trinket.svelte'
//
import { open_rules } from '$lib/Milieus/Venues/Scholars/Hints/Rules/open'
import { check_roomies_truck } from '$lib/Versies/Trucks'
//
//
import Getting_Moving from './Getting_Moving/Trinket.svelte'
import Preparation_Tutorial from './Preparation_Tutorial/Trinket.svelte'
import Boards from './Boards/Trinket.svelte'
import Mural from './Mural/Trinket.svelte'
import Pleasantries from './Trinkets/Pleasantries/Trinket.svelte'
import Regions from './Regions/Estate.svelte'
import Bouncy from './Bouncy/Estate.svelte'
import AI_Caution from './AI_Caution/Estate.svelte'
//
////


const modal_store = getModalStore ();
const mode = check_roomies_truck ().freight.mode;		


let header_1_saying = {
	name: (
		"പരിസ്ഥിതി"
	),
	language: (
		"Malayalam"
	),
	pronunciation: (
		"Paristetry"
	),
	english: "Ecology"
}

const show_rules = () => {
	open_rules ({ modal_store });
}


</script>

<svelte:head>
	<title>{ header_1_saying.name }</title>
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
	<div
		class="card p-4"
		style="
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
			>
				<span style="display: block">Perhaps occassionally pronounced as <b>{ header_1_saying.pronunciation }</b>,</span>
				<span style="display: block"><b style="font-size: 1.4em">{ header_1_saying.name }</b> might be <b>{ header_1_saying.language }</b> for <b>{ header_1_saying.english }</b>.</span>
			</p>
		</div>

		<div style="height: 0.5cm"></div>


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
			>The <b style="font-size: 1.4em">{ header_1_saying.name }</b> region has features that affect the local browser.</p>
		</div>
	</div>

	<div style="height: 0.5cm"></div>

	<div
		class="card p-4"
		style="
			width: 100%;
		"
	>
		<header 
			style="
				font-weight: bold;
				font-family: sans-serif;
				font-size: 10vw; 
				
				text-align: center;
				
				font-family: 'Rubik Vinyl', sans-serif;
			"
			class="gradient-heading"
		>Foam Pet</header>
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
		<button
			on:click={ show_rules }
			type="button" 
			
			style="
				padding: 0.25cm 1.5cm;
			"
			class="btn btn-lg btn bg-gradient-to-br variant-gradient-primary-secondary"
		>Bayanihan</button>
	</div>

	<div style="height: 0.5cm"></div>
	<Bouncy />
	<div style="height: 0.5cm"></div>
	<Getting_Moving />	
	<div style="height: 0.5cm"></div>
	<Beacons />
	
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
</Leaf>

