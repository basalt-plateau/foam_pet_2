


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


/*
	Fonctions:
		

*/
import { onMount, onDestroy } from 'svelte'
import * as Textboard_Truck from '$lib/Les_Talents/Textboard/Truck/index.js'




import { SlideToggle } from '@skeletonlabs/skeleton';
import { Autocomplete } from '@skeletonlabs/skeleton';
import { popup } from '@skeletonlabs/skeleton';

import { view_fonction } from "$lib/PTO_API/View/index.js"
import Textboard_Truck_Ride from '$lib/Les_Talents/Textboard/Truck/Ride.svelte'
let Textboard_Freight = false

	

import Petition_APT_Button from "$lib/Singles/Extension_Winch/Petition/APT_Button.svelte"
let petition_APT_button = "";
	

let hull_names = [
	{ label: 'Vanilla', value: 'vanilla' },
	{ label: 'Chocolate', value: 'chocolate' },
	{ label: 'Strawberry', value: 'strawberry' },
	{ label: 'Neapolitan', value: 'neapolitan' },
	{ label: 'Pineapple', value: 'pineapple' },
	{ label: 'Peach', value: 'peach' }
];


const Bourgeoisie_01_LA = "0x2F75DA076414103C721D195B0376C66897593B1F4E961671099A2DC9A24ADCFD"
const Builder_01 = Bourgeoisie_01_LA;


const Vacations = async () => {
	const Fonctions = {
		Begin_Hulls: `${ Builder_01 }::Hulls_Module::Begin_Hulls`,
		End_Hulls: `${ Builder_01 }::Hulls_Module::End_Hulls`,
		
		send_text: `${ Builder_01 }::Hulls_Module::send_text`,
		delete_text: `${ Builder_01 }::Hulls_Module::delete_text`,
	};
	
	const View_Fonctions = {
		is_Hull_built: `${ Builder_01 }::Hulls_Module::is_Hull_built`,
		
		// platform names
		retrieve_vector_of_Hull_names: `${ Builder_01 }::Hulls_Module::retrieve_vector_of_Hull_names`,
		
		retrieve_texts: `${ Builder_01 }::Hulls_Module::retrieve_texts`
	};
	
	const { result } = await view_fonction ({
		body: {
			"function": View_Fonctions ["retrieve_vector_of_Hull_names"],
			"type_arguments": [],
			"arguments": []
		}
	});
	console.info ({ result });
}
const Scout = async () => {
	const View_Fonctions = {
		is_Hull_built: `${ Builder_01 }::Hulls_Module::is_Hull_built`,
		
		// platform names
		retrieve_vector_of_hull_names: `${ Builder_01 }::Hulls_Module::retrieve_vector_of_hull_names`,
		
		retrieve_texts: `${ Builder_01 }::Hulls_Module::retrieve_texts`
	};
	
	const { result } = await view_fonction ({
		body: {
			"function": View_Fonctions ["retrieve_vector_of_hull_names"],
			"type_arguments": [],
			"arguments": []
		}
	});
	console.info ({ result });
	
	hull_names = result[0].map (name => {
		if (name === "") {
			return {
				value: name,
				label: "front"
			}
		}
		
		return {
			value: name,
			label: name
		}
	});
}



let value = false;

let input_demo = '';



function onFlavorSelection (event) {
	
}


let platform = '';
let popupSettings = {
	event: 'focus-click',
	target: 'popupAutocomplete',
	placement: 'bottom',
};

let onPopupDemoSelect = (event) => {
	platform = event.detail.label;
	console.log ("onPopupDemoSelect", { platform });
}
				

// on_write
let on_send = () => {
	
}

let Textboard_Truck_Made = "no";
onMount (async () => {	
	Textboard_Truck.make ()
	Textboard_Truck_Made = "yurp";
	
	Scout ();
});
onDestroy (() => {
	Textboard_Truck.destroy ()
});

</script>

{#if Textboard_Truck_Made === "yurp" }
<Textboard_Truck_Ride on_change={ ({ pro_freight }) => { Textboard_Freight = pro_freight; } } />
{#if typeof Textboard_Freight === "object"}
<div
	class="card p-2"
	style="
		width: 100%;
		height: 15cm;
	"
>	
	<div
		style="
			display: flex;
			border-radius: 4px;
			justify-content: center;
			align-items: center;
			gap: 0.25cm;
		"
		class="card p-2 variant-soft-surface"
	>
		<header>Textboard</header>
		<div>
			
			<input
				class="input autocomplete p-2"
				type="search"
				name="autocomplete-search"
				bind:value={platform}
				placeholder="Search..."
				use:popup={popupSettings}
			/>
			<div 
				class="card p-1"
				data-popup="popupAutocomplete"
			>
				<Autocomplete
					bind:input={platform}
					options={hull_names}
					on:selection={onPopupDemoSelect}
				/>
			</div>
		</div>
		<div>
		
		</div>
	</div>
	
	<div style="height: 1cm" />
	
	<div
		style="
			display: flex;
			border-radius: 4px;
			justify-content: right;
			flex-direction: column;
			
			gap: 0.1cm;
		"
		class="card p-4 variant-soft-surface"
	>
		<textarea
			style="
				width: 100%;
			"
			class="textarea"
		></textarea>
		
		<div
			style="
				display: flex;
				border-radius: 4px;
				justify-content: right;
				flex-direction: row;
				gap: 0.25cm;
			"
		>	
			
			<Petition_APT_Button
				bind:this={ petition_APT_button }
				
				onMount={() => {
					petition_APT_button.mode ("on");
				}}
			
				button_text={ 
					platform === "" ? "Tag" : `Tag on ${ platform }` 
				}
				
				APT="1"
				clicked={ on_send }
			/>

		</div>
		
		
	</div>

	<div style="height: 1cm" />
</div>
{/if}
{/if}

