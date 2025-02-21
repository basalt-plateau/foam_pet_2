


<script>


/*
	import Textboard_Leaf from "$lib/Les_Talents/Textboard/Leaf/Board.svelte"
	<Textboard_Leaf />
*/


/*
	Producer: 
		1. Hulls_Module::Begin_Hulls
	
	Then anyone can start sending texts..?
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
import Textboard_Truck_Ride from '$lib/Les_Talents/Textboard/Truck/Ride.svelte'
import Petition_APT_Button from "$lib/Singles/Extension_Winch/Petition/APT_Button.svelte"
import * as Textboard_Truck from '$lib/Les_Talents/Textboard/Truck/index.js'
import Progress_Wall from '$lib/trinkets/Progress/Wall/Trinket.svelte'
import { address_to_hexadecimal } from "$lib/PTO/Address/to_hexadecimal"
//
//
import { retrieve_hull_names, retrieve_texts_for_platform, Send_Text } from './Board'
//
import Platforms_Estate from "./Platforms/Estate.svelte"
import Texts_Estate from "./Texts/Estate.svelte"
//
////
import { ask_for_freight } from '$lib/Versies/Trucks'
	
import Extension_Winch_Ride from '$lib/Singles/Extension_Winch/Ride.svelte'
import Versies_Truck from '$lib/Versies/Trucks.svelte'
	
	
	

let Extension_Winch_Freight = false
let Versies_Freight = false
	
		
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

let leaf = "platforms";

const Vacations = async () => {
	const Fonctions = {
		Begin_Hulls: `${ Builder_01 }::Hulls_Module::Begin_Hulls`,
		End_Hulls: `${ Builder_01 }::Hulls_Module::End_Hulls`,
		
		Send_Text: `${ Builder_01 }::Hulls_Module::Send_Text`,
		delete_text: `${ Builder_01 }::Hulls_Module::delete_text`,
	};
}
const Scout = async () => {
	const View_Fonctions = {
		is_Hull_built: `${ Builder_01 }::Hulls_Module::is_Hull_built`,
		
		// platform names
		retrieve_vector_of_hull_names: `${ Builder_01 }::Hulls_Module::retrieve_vector_of_hull_names`,
		
		retrieve_texts: `${ Builder_01 }::Hulls_Module::retrieve_texts`
	};
}

const Search = async () => {
	le_textboard = platform_name;
	
	searching_for_texts = "yup"
	le_texts = []
	
	const { texts } = await retrieve_texts_for_platform ({
		Builder_01,
		platform_name
	});
	
	le_texts = texts;
	searching_for_texts = "no"
}


let on_popup_select = (event) => {
	platform_name = event.detail.label;
	Search ();
}


// on_write
let on_send = async () => {
	await Send_Text ({
		Builder_01,
		le_textboard,
		le_text
	});
	
	Search ();
}

let Textboard_Truck_Made = "no";
onMount (async () => {	
	Textboard_Truck.make ()
	Textboard_Truck_Made = "yurp";
	
	hull_names = await retrieve_hull_names ({ Builder_01 });
	Search ();
});
onDestroy (() => {
	Textboard_Truck.destroy ()
});

let account_address = "";
const change_account_address = () => {
	try {
		account_address = address_to_hexadecimal (
			_get (Extension_Winch_Freight, [ "stage", "account", "address" ], "")
		);
	}
	catch (impefection) {
		console.error (imperfection);
	}
}
</script>

{#if Textboard_Truck_Made === "yurp" }
<Textboard_Truck_Ride on_change={ ({ pro_freight }) => { Textboard_Freight = pro_freight; } } />
<Extension_Winch_Ride 
	on_change={ ({ pro_freight }) => { 
		Extension_Winch_Freight = pro_freight; 
		change_account_address ();
	}} 
/>
<Versies_Truck on_change={ ({ freight }) => { Versies_Freight = freight } } />
{#if 
	typeof Versies_Freight === "object" &&
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
		<RadioGroup>
			<RadioItem bind:group={ leaf } name="justify" value={ "texts" }>Texts</RadioItem>
			<RadioItem bind:group={ leaf } name="justify" value={ "platforms" }>Platforms</RadioItem>
		</RadioGroup>
		
		<div
			style=""
		>
			<span 
				style="
					font-size: 1.3em;
					padding: 0.25cm;
				"
				class="badge variant-soft-surface"
			>{ le_textboard }</span>
		</div>
		
		<div
			style="
				display: flex;
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
	
	<!-- Producer Options -->
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
	
	{#if leaf === "texts" }
	<Texts_Estate />
	{/if}
	
	<!-- Texts -->
	<div
		style="
			position: relative;
			height: 100%;
			width: 100%;
		"
		class="card p-2 variant-soft-surface"
	>
		{#if searching_for_texts === "yup" }
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
			{#each le_texts as text }
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
							
						>{ text.writer_balance }</span>
					</div>
				</div>
				
				{#if text.writer_address === account_address }
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
						clicked={() => {
							
						}}
					/>
				</div>
				{/if}
				
				{#if Versies_Freight.is_producer === "yup" }
				<div
					style="
						display: flex;
						justify-content: space-between;
						gap: 0.1cm;
					"
					class="card p-2 variant-filled-surface"
				>
					<input 
						style="
							text-indent: 0.1cm;
						"
						class="input" 
						type="text" 
						placeholder="Refund" 
					/>
					<Petition_APT_Button
						onMount={({ mode }) => {
							mode ("on");
						}}
						button_text="Delete Text as Producer"
						APT="0"
						clicked={() => {
							
						}}
					/>
				</div>
				{/if}
			</div>
			{/each}
			
			{#if le_texts.length === 0 }
			<p>There are zero texts about "{ le_textboard }".</p>
			{/if}
		</div>
	</div>
	
	
	{#if leaf === "platforms" }
	
	{/if}
	
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
{/if}
