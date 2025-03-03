

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
import Platform_Texts from './Platform_Texts/Ride.svelte'
import Text_Writer from './Structures/Text_Writer.svelte'
//
////

let TF = false

export let le_texts = []
export let le_textboard = ""
export let searching_for_texts = ""

let le_text = ""
let petition_APT_button = "";

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
	
	<div 
		style="
			height: 100%;
		"
		class="card p-1 variant-soft-surface"
	>
		<Platform_Texts />
	</div>
	<div
		style="
		"
		class="card p-1 variant-soft-surface"
	>
		<Text_Writer />
	</div>
</div>
{/if}