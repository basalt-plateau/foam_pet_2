


<script>


/*
	import Textboard_Leaf from "$lib/Les_Talents/Textboard/Leaf/Board.svelte"
	<Textboard_Leaf />
*/


/*
	Builder: 
	
*/

import { onMount } from "svelte"

import { SlideToggle } from '@skeletonlabs/skeleton';
import { Autocomplete } from '@skeletonlabs/skeleton';
import { popup } from '@skeletonlabs/skeleton';

import { view_fonction } from "$lib/PTO_API/View/index.js"
	

import Petition_APT_Button from "$lib/Singles/Extension_Winch/Petition/APT_Button.svelte"
let petition_APT_button = "";
	


const Builder_01 = "0x2F75DA076414103C721D195B0376C66897593B1F4E961671099A2DC9A24ADCFD";
const Vacations = async () => {
	const Fonctions = {
		Begin_Games: `${ Builder_01 }::Game_Module::Begin_Games`,
		End_Games: `${ Builder_01 }::Game_Module::End_Games`,
		
		send_text: `${ Builder_01 }::Game_Module::send_text`,
		delete_text: `${ Builder_01 }::Game_Module::delete_text`,
	};
	
	const View_Fonctions = {
		is_Game_built: `${ Builder_01 }::Game_Module::is_Game_built`,
		
		// platform names
		retrieve_vector_of_game_names: `${ Builder_01 }::Game_Module::retrieve_vector_of_game_names`,
		
		retrieve_texts: `${ Builder_01 }::Game_Module::retrieve_texts`
	};
	
	const { result } = await view_fonction ({
		body: {
			"function": View_Fonctions ["retrieve_vector_of_game_names"],
			"type_arguments": [],
			"arguments": []
		}
	});
	console.info ({ result });
}
const Scout = async () => {
	const View_Fonctions = {
		is_Game_built: `${ Builder_01 }::Game_Module::is_Game_built`,
		
		// platform names
		retrieve_vector_of_game_names: `${ Builder_01 }::Game_Module::retrieve_vector_of_game_names`,
		
		retrieve_texts: `${ Builder_01 }::Game_Module::retrieve_texts`
	};
	
	const { result } = await view_fonction ({
		body: {
			"function": View_Fonctions ["retrieve_vector_of_game_names"],
			"type_arguments": [],
			"arguments": []
		}
	});
	console.info ({ result });
}



let value = false;

let input_demo = '';


const flavorOptions = [
	{ label: 'Vanilla', value: 'vanilla' },
	{ label: 'Chocolate', value: 'chocolate' },
	{ label: 'Strawberry', value: 'strawberry' },
	{ label: 'Neapolitan', value: 'neapolitan' },
	{ label: 'Pineapple', value: 'pineapple' },
	{ label: 'Peach', value: 'peach' }
];


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


onMount (async () => {
	Scout ();
});

</script>


<div
	class="card p-4"
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
		class="card p-4 variant-soft-surface"
	>
		<header>Textboard</header>
		<div>
			<input
				class="input autocomplete p-1"
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
					options={flavorOptions}
					on:selection={onPopupDemoSelect}
				/>
			</div>
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