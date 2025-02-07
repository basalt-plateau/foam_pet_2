

<script>


/*
	import Wallet_Frontier from "$lib/Les_Talents/_Wallet/Frontier/Trinket.svelte"
	<Wallet_Frontier />
*/


////
//
import { onMount, onDestroy } from 'svelte'
import { Modal, getModalStore } from '@skeletonlabs/skeleton';
//
//
import * as Extension_Winch from "$lib/Singles/Extension_Winch"	
//
//
import { show_wallets_panel } from "../Panel/Show.js"
//
////

const modal_store = getModalStore ();



let wallet_address = ""
let wallet_provider = "?"

let mounted = "no"
let flourisher_freight = ""
let flourisher_monitor = ""
onMount (() => {
	flourisher_freight = Extension_Winch.freight ();
	flourisher_monitor = Extension_Winch.monitor (async ({
		original_freight,
		pro_freight, 
		//
		target,
		//
		property, 
		value
	}) => {
		flourisher_freight = pro_freight;
		ask_for_wallet_address ();
	});
	
	ask_for_wallet_address ();
	mounted = "yes"
});
onDestroy (() => {
	flourisher_monitor.stop ()
});


const ask_for_wallet_address = () => {
	console.info ("ask_for_wallet_address");
	
	try {
		if (flourisher_freight.stage_name_connected.length === 0) {
			return;
		}
		
		let stage = flourisher_freight.ask_for_stage ();
		console.info ({ stage });
		
		let address = stage.account.address;
		if (address.substring (0,2) === "0x") {
			address = address.substring (2);
			address = address.toUpperCase ();
			wallet_address = address.substring (0,4) + ".." + address.substring (address.length - 4);
		}
		
		wallet_provider = flourisher_freight.stage_name_connected;
		
		return;
	}
	catch (imperfection) {
		console.error ("wallet address imperfection:", imperfection);
	}

	wallet_provider = "?";
	wallet_address = "?";
}

</script>


{#if mounted === "yes" }
<button 
	monitor="APT Transfer"
	
	on:click={() => { show_wallets_panel ({ modal_store }) }}
	type="button" 
	class="btn bg-gradient-to-br variant-gradient-primary-secondary"
	style="
		font-size: 1em;
		padding: 6px 34px;
		
		display: flex;
		flex-direction: column;
		justify-content: center;
		align-items: center;
		
		// box-shadow: 0 0 0px 2px rgb(var(--color-surface-500));
	"
>
	{#if flourisher_freight.stage_name_connected.length >= 1 }
	<span
		style="
			display: flex;
			flex-direction: column;
			justify-content: center;
			align-items: center;
			
			transform: translateY(-4px);
		"
	>
		<span
			style="
				height: 1em;
				font-size: 0.75em;
			"
		>{ wallet_address }</span>
		<span
			style="
				height: 1em;
				font-size: 0.65em;
			"
		>{ wallet_provider }</span>
	</span>
	{:else}
	<div
		style="
			display: flex;
			flex-direction: column;
			justify-content: center;
			align-items: center;
			
			transform: translateY(-4px);
			font-size: 1.2em;
		"
	>
		<span
			style="
				height: 1em;
				font-size: 0.75em;
			"
		>Wallet</span>
		<span
			style="
				height: 1em;
				font-size: 0.65em;
			"
		>Sensor</span>
	</div>
	{/if}
</button>
{/if}