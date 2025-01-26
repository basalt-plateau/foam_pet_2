
<script>

import { onMount, onDestroy } from 'svelte'

import { Autocomplete } from '@skeletonlabs/skeleton';
import { ListBox, ListBoxItem } from '@skeletonlabs/skeleton';
import { popup } from '@skeletonlabs/skeleton';

/*
	Allowed Addresses:
		Allow Every: Address::__::__
		
		0x1 Framework
		
		0x3 Legacy Token
		0x4 Digital Assets

		
	Allowed Modules:
		Allow Every: Address::module::___

	Allowed Fonctions:
		Allow Every: Address::module::function
*/

export let mod_chosen = () => {}

const endorsed_mods_tree = {
	"0x1": "every",
	"0x3": "every",
	"0x4": "every"
};

// let endorsed_mods = []
let endorsed_mods = [
	"Vanilla"
]

let mod_name = "";
$: {
	let _mod_name = mod_name;
	if (endorsed_mods.includes (mod_name)) {
		mod_chosen ({ mod_name });
	}
}





function on_choose (event) {
	address = event.detail.label;
}

let auto_complete_style_preset = `
	position: absolute;
	z-index: 1;
`
let auto_complete_style = auto_complete_style_preset  + `
	display: none;
`;
const on_click = () => {
	auto_complete_style = auto_complete_style_preset + `
		display: block;
	`
}
const on_blur = () => {
	auto_complete_style = auto_complete_style_preset + `
		display: none;
	`
}
		
	
let inputPopupDemo = '';
let popupSettings = {
	event: 'focus-click',
	target: 'popupAutocomplete',
	placement: 'bottom',
};
const flavorOptions = [
	{ label: 'Vanilla', value: 'vanilla'},
	{ label: 'Vanilla', value: 'vanilla'},
	{ label: 'Vanilla', value: 'vanilla'},
	{ label: 'Vanilla', value: 'vanilla'},
	{ label: 'Vanilla', value: 'vanilla'},
	{ label: 'Vanilla', value: 'vanilla'},
	{ label: 'Vanilla', value: 'vanilla'},
	{ label: 'Vanilla', value: 'vanilla'},
	{ label: 'Vanilla', value: 'vanilla'},
	{ label: 'Vanilla', value: 'vanilla'},
	{ label: 'Vanilla', value: 'vanilla'},
	{ label: 'Vanilla', value: 'vanilla'},
	{ label: 'Vanilla', value: 'vanilla'},
	
];
function onPopupDemoSelect () {
	console.log ("onPopupDemoSelect");
	
	inputPopupDemo = event.detail.label;
}
				
				
	
/*
	if click outside of ListBox, close the listbox
*/
		
onMount (() => {
	
})


</script>

<div
	style="
		display: flex;
	"
>
	<div>
		<span 
			style="
				padding: 0.4cm;
			"
			class="badge variant-ringed-surface"
		>Module</span>
	</div>

	<div
		style="
			width: 5px;
		"
	/>

	<div
		style="
			display: nonee;
			width: 100%;
		"
	>
		<input
			class="input autocomplete"
			type="search"
			name="autocomplete-search"
			bind:value={ inputPopupDemo }
			placeholder="Search..."
			use:popup={ popupSettings }
			
			style="
				padding: 0.25cm;
			"
		/>
		
		<div 
			data-popup="popupAutocomplete"
			style="
				max-height: 300px;
				overflow: scroll;
			"
			class="card p-2"
		>
			<Autocomplete
				bind:input={inputPopupDemo}
				options={flavorOptions}
				on:selection={onPopupDemoSelect}
			/>
		</div>
	</div>
		
	
</div>


