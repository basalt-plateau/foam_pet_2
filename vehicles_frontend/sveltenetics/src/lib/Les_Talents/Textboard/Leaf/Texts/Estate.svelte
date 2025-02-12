

<script>

import { onMount, onDestroy } from 'svelte'

import Petition_APT_Button from "$lib/Singles/Extension_Winch/Petition/APT_Button.svelte"
import Textboard_Truck_Ride from '$lib/Les_Talents/Textboard/Truck/Ride.svelte'

import Platform_Texts from './Platform_Texts.svelte'

let Textboard_Freight = false
let Versies_Freight = false

export let le_texts = []
export let le_textboard = ""
export let searching_for_texts = ""

let le_text = ""

let petition_APT_button = "";

// on_write
let on_send = async () => {
	await Send_Text ({ Builder_01, le_textboard, le_text });
	Textboard_Freight.Fonction.Search ();
}


onMount (async () => {});
onDestroy (async () => {});


</script>

<Textboard_Truck_Ride on_change={ ({ pro_freight }) => { Textboard_Freight = pro_freight; } } />
{#if typeof Textboard_Freight === "object" }
<div
	style="
		position: relative;
		height: 100%;
		width: 100%;
	"
	class="card p-2 variant-soft-surface"
>
	{#if Textboard_Freight.info.searching_for_texts === "yup" }
	<div
		transition:fade={{
			duration: 1000
		}}
		style="
			position: absolute;
			top: 10px;
			left: 10px;
			height: calc(100% - 20px);
			width: calc(100% - 20px);
			border-radius: 8px;
		"
	>
		<Progress_Wall show={ "yes" } />
	</div>
	{/if}
	
	<div>
		{#if Versies_Freight.is_producer === "yup" }
		<div
			style="
				display: grid;
				gap: 0.1cm;
				grid-template-columns: repeat(auto-fit, minmax(10cm, 1fr));
			"
		>
			<Petition_APT_Button
				onMount={({ mode }) => {
					mode ("on");
				}}
				button_text={ `Delete "${ le_textboard }" as Producer` }
				APT="0"
				clicked={() => {
					
				}}
			/>
			<Petition_APT_Button
				onMount={({ mode }) => {
					mode ("on");
				}}
				button_text={ `Pause "${ le_textboard }" as Producer` }
				APT="0"
				clicked={() => {
					
				}}
			/>
		</div>
		{/if}
	</div>
	
	<Platform_Texts />
	
	<div
		style="
			position: relative;
		
			display: flex;
			border-radius: 4px;
			justify-content: right;
			flex-direction: column;
			
			gap: 0.1cm;
		"
		class="card p-4 variant-soft-surface"
	>
		<textarea
			bind:value={ le_text }
			style="
				width: 100%;
			"
			class="textarea p-1"
		></textarea>
		
		<div
			style="
				border-radius: 4px;
				width: 100%;
			"
		>	
			<Petition_APT_Button
				bind:this={ petition_APT_button }
				
				onMount={() => {
					petition_APT_button.mode ("off");
				}}
			
				button_text={ 
					`Write or overwrite on "${ le_textboard }"` 
				}
				
				APT="1"
				clicked={ on_send }
			/>
		</div>
	</div>
</div>
{/if}