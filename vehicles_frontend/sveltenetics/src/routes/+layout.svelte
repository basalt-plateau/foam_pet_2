

<script lang="ts">



///
//
import * as AptosSDK from "@aptos-labs/ts-sdk";
//
import { onMount, onDestroy, beforeUpdate } from 'svelte'
import { page } from '$app/stores';
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
//
import { lease_Milieus_truck, give_back_Milieus_truck } from '$lib/Milieus/Truck'
//
//\
//\\




///
//
import "../app.css";
//
//\



storePopup.set ({ computePosition, autoUpdate, offset, shift, flip, arrow });			
initializeStores ();


const drawerStore = getDrawerStore ();

let roomies_truck_leased = "no"
let Milieus_truck_leased = "no"

onMount (async () => {
	autoModeWatcher ();
	setInitialClassState ()
	
	////
	//
	//	Trucks
	//
	//
	lease_roomies_truck ()
	roomies_truck_leased = "yes"

	lease_Milieus_truck ()
	Milieus_truck_leased = "yes"
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
	give_back_roomies_truck ()
	roomies_truck_leased = "no"
	
	give_back_Milieus_truck ()
	Milieus_truck_leased = "no"
})




let updated = "no"; 
let built = "no"
beforeUpdate (async () => {
	if (updated === "no") {
		updated = "yes"
		built = "yes"
	}
});





</script>


<svelte:head>{@html '<script>(' + autoModeWatcher.toString() + ')();</script>'}</svelte:head>

<div 
	in:fade={{ duration: 500 }} 
	class="app"
	style="
		display: flex;
		flex-direction: column;
		min-height: 100vh;
		// min-width: 100vw;
	"
>	
	{#if 
		built === "yes" && 
		roomies_truck_leased === "yes" &&
		Milieus_truck_leased === "yes"
	}
	<div
		in:fade={{ duration: 500 }} 
		class="app"
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
		
		<Navigator />
		
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
				
				<!-- <slot></slot> -->
			</div>
		</div>
		
		<div
			style="
				position: fixed;
				bottom: 0;
				left: 0;
				width: 100%;
			"
		>
			<Navigator_Foundation />	
		</div>
		
		<div style="height: 0.25cm"></div>
		<hr class="!border-t-8 !border-double" />
			
		<hr class="!border-t-8 !border-double" />
		<div style="height: 0.25cm"></div>
	</div>
	{:else}
		<div></div>
	{/if}
</div>

