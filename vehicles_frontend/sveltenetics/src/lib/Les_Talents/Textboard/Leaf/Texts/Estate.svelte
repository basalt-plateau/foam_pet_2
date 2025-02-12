

<script>

////
//
import { onMount, onDestroy } from 'svelte'
//
//
import Petition_APT_Button from "$lib/Singles/Extension_Winch/Petition/APT_Button.svelte"
import Textboard_Truck_Ride from '$lib/Les_Talents/Textboard/Truck/Ride.svelte'
//
//
import Platform_Texts from './Platform_Texts.svelte'
import Text_Writer from './Text_Writer.svelte'
//
////

let TF = false
let Versies_Freight = false

export let le_texts = []
export let le_textboard = ""
export let searching_for_texts = ""

let le_text = ""
let petition_APT_button = "";

let on_send = async () => {
	await Send_Text ({ Builder_01, le_textboard, le_text });
	TF.Fonction.Search ();
}


onMount (async () => {});
onDestroy (async () => {});


</script>

<Textboard_Truck_Ride on_change={ ({ pro_freight }) => { TF = pro_freight; } } />
{#if typeof TF === "object" }
<div
	style="
		position: relative;
		height: 100%;
		width: 100%;
		
		display: flex;
		justify-content: space-between;
		flex-direction: column;
		gap: 0.1cm;
	"
	class="card p-2 variant-soft-surface"
>
	{#if TF.info.searching_for_texts === "yup" }
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
	
	{#if TF.info.is_producer === "yup" }
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
			button_text={ `Delete "${ TF.info.platform_name }" as Producer` }
			APT="0"
			clicked={() => {}}
		/>
		<Petition_APT_Button
			onMount={({ mode }) => {
				mode ("on");
			}}
			button_text={ `Pause "${ TF.info.platform_name }" as Producer` }
			APT="0"
			clicked={() => {}}
		/>
	</div>
	{/if}

	<Platform_Texts />
	<Text_Writer />
</div>
{/if}