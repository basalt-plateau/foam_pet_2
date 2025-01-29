

<script lang="ts">



///
//
import * as AptosSDK from "@aptos-labs/ts-sdk";
//
import { onMount, onDestroy, beforeUpdate } from 'svelte'
import { fade } from 'svelte/transition';
//
import { initializeStores, Modal, Toast } from '@skeletonlabs/skeleton';
import { storePopup } from '@skeletonlabs/skeleton';
import { TabGroup, Tab, TabAnchor } from '@skeletonlabs/skeleton';
import { Drawer, getDrawerStore } from '@skeletonlabs/skeleton';
import { setInitialClassState, autoModeWatcher } from '@skeletonlabs/skeleton';
import { LightSwitch } from '@skeletonlabs/skeleton';
//
import { computePosition, autoUpdate, offset, shift, flip, arrow } from '@floating-ui/dom';
//
//
import Navigator from "$lib/Milieus/Navigator/Trinket.svelte";
import Footer from "$lib/trinkets/Footer/Trinket.svelte";
//
import { string_from_Uint8Array } from '$lib/taverns/hexadecimal/string_from_Uint8Array'
import { Uint8Array_from_string } from '$lib/taverns/hexadecimal/Uint8Array_from_string'
//
import { lease_roomies_truck, give_back_roomies_truck } from '$lib/Versies/Trucks'
//
import Milieus_Trinket from '$lib/Milieus/Trinket.svelte'
import Milieus_Truck from '$lib/Milieus/Truck/Trinket.svelte'
//
import Navigator_Foundation from '$lib/Milieus/Navigator_Foundation/Trinket.svelte'
import Navigator_Magma from '$lib/Milieus/Navigator_Magma/Board.svelte'
//
import { lease_Milieus_truck, give_back_Milieus_truck } from '$lib/Milieus/Truck'
//
//\
//\\
import * as Extension_Winch from "$lib/Singles/Extension_Winch"
	
	

import { latch_wallets } from "$lib/Singles/Extension_Winch/_screenplays/latch_wallets.js"


///
//
import "../app.css";
//
//\



storePopup.set ({ computePosition, autoUpdate, offset, shift, flip, arrow });			
initializeStores ();


const drawerStore = getDrawerStore ();



let trucks_prepared = "no"
onMount (async () => {
	autoModeWatcher ();
	setInitialClassState ()
	
	////
	//
	//	Trucks
	//		The versies (roomies) truck is subscribed
	//		to the extension winch.
	//
	
		
	await Extension_Winch.make ();
	lease_roomies_truck ()
	lease_Milieus_truck ()
	
	await latch_wallets ();
	
	trucks_prepared = "yes"
	//
	////

	////
	// 
	//	these are for devel purposes
	//
	window.AptosSDK = AptosSDK;
	window.string_from_Uint8Array = string_from_Uint8Array;
	window.Uint8Array_from_string = Uint8Array_from_string;
	//
	////
})

onDestroy (async () => {
	//
	//
	//	Trucks
	//
	give_back_roomies_truck ()
	give_back_Milieus_truck ()
	Extension_Winch.destroy ();
	// Tesseract_Rise.destroy ();
	
	trucks_prepared = "no"
})




let updated = "no"; 
let built = "no"
beforeUpdate (async () => {
	if (updated === "no") {
		updated = "yes"
		built = "yes"
	}
});


import Versies_Truck from '$lib/Versies/Trucks.svelte'
let Versies_Freight = false

let transform = "scale(0.5)"

</script>



<svelte:head>
	{@html '<script>(' + autoModeWatcher.toString() + ')();</script>'}
</svelte:head>

<div 
	in:fade={{ duration: 500 }} 
	class="app"
	style="
		position: absolute;
		top: 0;
		left: 0;
		right: 0;
		bottom: 0;
	
		display: flex;
		flex-direction: column;
		min-height: 100vh;
		// min-width: 100vw;
	"
>	
	{#if built === "yes" && trucks_prepared === "yes" }
	<Versies_Truck on_change={ ({ freight }) => { Versies_Freight = freight } } />
	{#if typeof Versies_Freight === "object"}
	
	<div
		
		in:fade={{ duration: 500 }} 
		style="
			position: relative;
		
			display: flex;
			flex-direction: column;
			min-height: 100%;
		"
	>
		<Modal />
		<Toast />
		<Drawer />
		
		<div
			monitor="parador"
			style="
				position: absolute;
				bottom: 0;
				left: 0;
				width: 100%;
				height: 100vh;
				
				transform: { Versies_Freight.parador.transform };
			"
		>
			<div
				style="
					position: absolute;
					top: 0;
					left: 0;
					right: 0;
					bottom: 0;
					height: { Versies_Freight.window_width <= 800 ? '1.5cm' : '2cm' };
				" 
			>
				<Navigator />
			</div>
			
			<div
				style="
					height: { Versies_Freight.window_width <= 800 ? 'calc(100vh - 1.5cm)' : 'calc(100vh - 2cm)' };
					top: { Versies_Freight.window_width <= 800 ? '1.5cm' : '2cm' };
					
					position: absolute;
					left: 0;
					right: 0;
					
					overflow-y: scroll;
				"
			>
				<div
					style="
						position: relative;
					
						display: flex;
						flex-direction: column;
						min-height: 100%;
					"
				>
					<div 
						style="
							position: static;
							min-height: 100vh;
							
							flex: 1;
							display: flex;
							flex-direction: column;
							padding: 1rem;
							width: 100%;
							
							margin: 0 auto;
							box-sizing: border-box;
						"
					>	
						<Milieus_Trinket />
					</div>
				</div>
				
				<div style="height: 0.25cm"></div>
				<hr class="!border-t-8 !border-double" />
				
				<Navigator_Magma />
					
				<hr class="!border-t-8 !border-double" />
				<div style="height: 0.25cm"></div>
			</div>
		</div>
		
		
		<div
			style="
				position: absolute;
				bottom: 0;
				left: 0;
				width: 100%;
			"
		>
			<Navigator_Foundation />
		</div>
	</div>
	{/if}
	{/if}
</div>

