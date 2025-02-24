
<script>

/*
	This is the texts of the presently open platform.
*/

////
//
import { onMount, onDestroy } from 'svelte'
//
//
import Textboard_Truck_Ride from '$lib/Les_Talents/Textboard/Truck/Ride.svelte'
import Extension_Winch_Ride from '$lib/Singles/Extension_Winch/Ride.svelte'
import Petition_APT_Button from "$lib/Singles/Extension_Winch/Petition/APT_Button.svelte"
//
//
import * as Textboard_Truck from "$lib/Les_Talents/Textboard/Truck/index.js"
//
////

import Delete_as_Producer from "./Delete_as_Producer/Tome.svelte"

let octas_refund = 0;

let TF = false;
let EWF = false

onMount (() => {
	Textboard_Truck.freight ().fonctions.retrieve_texts_for_platform ();
}); 



</script>


<div 
	monitor="platform texts"
	style="
		height: 100%;
	"
	class="card p-2 variant-soft-surface"
>
	<Textboard_Truck_Ride on_change={ ({ pro_freight }) => { TF = pro_freight; } } />
	<Extension_Winch_Ride on_change={ ({ pro_freight }) => { EWF = pro_freight; } } />
	{#if typeof TF === "object" && typeof EWF === "object" }
	{#each TF.info.texts as text }
	<div
		style="
			display: flex;
			flex-direction: column;
			gap: 0.1cm;
		"
		class="card p-2 variant-soft-surface"
	>	
		<div 
			style="
				display: flex;
				justify-content: space-between;
			"
			class="card p-2"
		>
			<p>{ text.text }</p>
		</div>
		<div
			style="
				display: flex;
				justify-content: center;
				gap: 0.1cm;
			"
		>
			<span 
				style="
					border-radius: var(--theme-rounded-base);
					padding: 0.05cm 0.2cm;
					word-break: break-all;
				"
				class="variant-soft-surface"
			>{ text.writer_address }</span>
			<div
				style="
					display: flex;
					align-items: center;
					border-radius: var(--theme-rounded-base);
					padding: 0.05cm 0.2cm;
				"
				class="variant-soft-surface"
			>
				<img src="/_Licensed/Aptos/aptos.png" style="width: 0.5cm; height: 0.5cm;">
				<span 
					style="
						border-radius: var(--theme-rounded-base);
						padding: 0 0.25cm;
					"
					
				>{ text.writer_balance_apt }</span>
			</div>
		</div>
		
		{#if text.writer_address === EWF.account_address }
		<div
			style="
				display: flex;
				justify-content: space-between;
				gap: 0.1cm;
			"
		>
			<div></div>
			<Petition_APT_Button
				onMount={({ mode }) => {
					mode ("on");
				}}
				button_text="Delete Text"
				APT="0"
				clicked={() => {}}
			/>
		</div>
		{/if}
		
		{#if TF.info.is_producer === "yup" }
		<Delete_as_Producer text={ text } />
		{/if}
	</div>
	{/each}
	
	{#if TF.info.texts.length === 0 }
	<p>There are zero texts about "{ TF.info.platform_name }".</p>
	{/if}
	{/if}
</div>
