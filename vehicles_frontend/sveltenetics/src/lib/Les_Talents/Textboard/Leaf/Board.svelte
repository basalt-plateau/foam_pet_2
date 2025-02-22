



<script>

/*
	import Textboard_Leaf from "$lib/Les_Talents/Textboard/Leaf/Board.svelte"
	<Textboard_Leaf />
*/

////
//
import { onMount, onDestroy } from 'svelte'
import { fade } from "svelte/transition"
import _get from "lodash/get"
//
import { SlideToggle } from '@skeletonlabs/skeleton';
import { Autocomplete } from '@skeletonlabs/skeleton';
import { popup } from '@skeletonlabs/skeleton';
import { RadioGroup, RadioItem } from '@skeletonlabs/skeleton';
//
//
import { view_fonction } from "$lib/PTO_API/View/index.js"
import { address_to_hexadecimal } from "$lib/PTO/Address/to_hexadecimal"
import Textboard_Truck_Ride from '$lib/Les_Talents/Textboard/Truck/Ride.svelte'
import Petition_APT_Button from "$lib/Singles/Extension_Winch/Petition/APT_Button.svelte"
import Progress_Wall from '$lib/trinkets/Progress/Wall/Trinket.svelte'
import * as Textboard_Truck from '$lib/Les_Talents/Textboard/Truck/index.js'
//
//
import Index_of_Platforms from "./Index_of_Platforms/Estate.svelte"
import Texts_Estate from "./Texts/Estate.svelte"
//
////
	
import Extension_Winch_Ride from '$lib/Singles/Extension_Winch/Ride.svelte'
import Versies_Truck from '$lib/Versies/Trucks.svelte'

	
	
	
let Extension_Winch_Freight = false
	
	
let Textboard_Freight = false
let le_textboard = ""
let platform_name = '';
let petition_APT_button = "";
let searching_for_texts = "no"

let hull_names = [];
let le_texts = []

let le_text = "";
$: {
	let _le_text = le_text;
	if (typeof petition_APT_button === "object") {
		if (_le_text.length >= 1) {
			petition_APT_button.mode ("on");
		}
		else {
			petition_APT_button.mode ("off");
		}
	}
}

const Pannier_01_LA = "0x2F75DA076414103C721D195B0376C66897593B1F4E961671099A2DC9A24ADCFD"
const Builder_01 = Pannier_01_LA;

let leaf = "texts";

const Search = async () => {
	le_textboard = platform_name;
	
	searching_for_texts = "yup"
	le_texts = []
	/*
	const { texts } = await retrieve_texts_for_platform ({
		Builder_01,
		platform_name
	});
	*/
	
	// le_texts = texts;
	searching_for_texts = "no"
}


let on_popup_select = (event) => {
	platform_name = event.detail.label;
	Search ();
}


// on_write
let on_send = async () => {
	await Send_Text ({ Builder_01, le_textboard, le_text });
	Search ();
}

let Textboard_Truck_Made = "no";
onMount (async () => {	
	Textboard_Truck.make ()
	Textboard_Truck_Made = "yurp";
	
	// hull_names = await retrieve_hull_names ({ Builder_01 });
	Search ();
});
onDestroy (() => {
	Textboard_Truck.destroy ()
});




</script>

{#if Textboard_Truck_Made === "yurp" }
<Textboard_Truck_Ride on_change={ ({ pro_freight }) => { Textboard_Freight = pro_freight; } } />
<Extension_Winch_Ride on_change={ ({ pro_freight }) => { Extension_Winch_Freight = pro_freight; }} />
{#if 
	typeof Extension_Winch_Freight === "object" &&
	typeof Textboard_Freight === "object"
}
<div
	class="card p-2"
	style="
		position: relative;
	
		width: 100%;
		height: 80vh;
		min-height: 15cm;
		
		display: flex;
		justify-content: space-between;
		flex-direction: column;
		gap: 0.1cm;
	"
>	
	<div
		style="
			position: relative;
		
			display: flex;
			justify-content: space-between;
			align-items: center;
			
			gap: 0.25cm;
			
			border-radius: 4px;
			
			z-index: 1;
		"
		class="card p-2 variant-soft-surface"
	>
		<div style="" >
			<span 
				style="
					font-size: 1.3em;
					padding: 0.25cm;
				"
				class="badge variant-soft-surface"
			>"{ Textboard_Freight.info.platform_name }"</span>
		</div>
		
		<RadioGroup>
			<RadioItem bind:group={ leaf } name="justify" value={ "texts" }>Texts</RadioItem>
			<RadioItem bind:group={ leaf } name="justify" value={ "platforms" }>Platforms</RadioItem>
		</RadioGroup>
		
		<div
			style="
				display: none;
				gap: 0.25cm;
			"
		>
			<input
				class="input autocomplete p-2"
				type="search"
				name="autocomplete-search"
				bind:value={ platform_name }
				placeholder="Search..."
				use:popup={{
					event: 'focus-click',
					target: 'popupAutocomplete',
					placement: 'bottom',
				}}
			/>
			<div 
				class="card p-1"
				data-popup="popupAutocomplete"
			>
				<Autocomplete
					bind:input={ platform_name }
					options={ hull_names }
					on:selection={ on_popup_select }
				/>
			</div>
			<button 
				type="button" 
				class="btn variant-filled-primary"
				on:click={ Search }
			>search</button>
		</div>
	</div>
	
	{#if leaf === "texts" }
	<Texts_Estate />
	{/if}
	
	{#if leaf === "platforms" }
	<Index_of_Platforms />
	{/if}
</div>
{/if}
{/if}
