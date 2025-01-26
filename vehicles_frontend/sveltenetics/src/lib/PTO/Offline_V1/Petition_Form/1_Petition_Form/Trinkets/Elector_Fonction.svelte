

<script>

import { Autocomplete } from '@skeletonlabs/skeleton';
import { Accordion, AccordionItem } from '@skeletonlabs/skeleton';
import { ListBox, ListBoxItem } from '@skeletonlabs/skeleton';
//
import Slang from '$lib/trinkets/Slang/Trinket.svelte'
//
import { retrieve_fonctions_for_module } from './../screenplays/retrieve_fonctions_for_module'
//

import { ask_for_freight } from '$lib/Versies/Trucks'
	

let fonction_choose_accordion_open = true;
let le_fonction_index = ""
let le_fonctions = [];
let fonction_found = "no"
let les_fonctions = []
let le_move_explorer_address = ""
let le_fonction_chosen = ""

let fonction_mode = ""

export let endorsed = "";



export let fonction_choosen = () => {}
export let net_path = ""
export let address = ""
export let module_name = ""
$: {
	let _module_name = module_name;
	if (typeof module_name === "string" && module_name.length >= 1) {
		parse_endorsed_fonctions ();
		show_fonctions ();
		
	}
}


/*
	
	This is for showing endorsed fonctions.
	
*/
let endorsed_fonctions = [];
const parse_endorsed_fonctions = () => {
	console.log ("parse_endorsed_fonctions:", { address, endorsed });
	
	endorsed_fonctions = "zero"
	
	try {
		if (endorsed === "every") {
			endorsed_fonctions = "every"
			return;
		}
		
		const modules_of_address = endorsed [ address ];
		const fonctions_of_module = modules_of_address [ module_name ];
		
		console.info ({ fonctions_of_module });
		
		if (fonctions_of_module === "every") {
			endorsed_fonctions = "every"
			return;
		}
		if (Array.isArray (fonctions_of_module)) {
			endorsed_fonctions = fonctions_of_module
			return;
		}
	}
	catch (imperfection) {
		console.error ("parse_endorsed_fonctions:", imperfection);
	}
}


/*
	
	This is for asking for the "fonctions" for the "module".
	
*/
const show_fonctions = async () => {
	console.log ("module_name:", { module_name, address });
	
	const { les_fonctions: _les_fonctions } = await retrieve_fonctions_for_module ({
		net_path: ask_for_freight ().dapp_network.net_path,
		
		address_hexadecimal_string: address,
		module_name
	});
	
	console.info ({ _les_fonctions, endorsed_fonctions });
	
	if (endorsed_fonctions === "every") {
		les_fonctions = _les_fonctions;
		return;
	}
	
	les_fonctions = _les_fonctions.filter (le_fonction => {
		if (endorsed_fonctions.includes (le_fonction.name)) {
			return true;
		} 
		
		return false;
	});
	
	fonction_changed ();
}


/*
	le_fonction_chosen
*/
const fonction_changed = () => {
	le_fonction_chosen = les_fonctions [ le_fonction_index ]
	if (le_fonction_chosen === undefined) {
		fonction_found = "no"
		return;
	}
	else {
		fonction_found = "yes"
	}
	
	let mode_explorer = ""
	if (le_fonction_chosen.is_entry) {
		fonction_mode = "entry"
		mode_explorer = "run"
	}
	else if (le_fonction_chosen.is_view) {
		fonction_mode = "view"
		mode_explorer = "view"
	}
	
	if (le_fonction_chosen) {
		le_move_explorer_address = [
			"https://explorer.aptoslabs.com/account",
			address,
			"modules",
			mode_explorer,
			module_name,
			le_fonction_chosen.name
		].join ("/");	
	}
	
	fonction_choosen ({
		fonction: le_fonction_chosen,
		fonction_mode
	});
}

let fonction_modes_shown = {
	view: true,
	entry: true
}
function fonction_modes_shown_toggle (flavor) {
	console.log ("fonction_modes_shown_toggle", flavor);
	fonction_modes_shown [flavor] = !fonction_modes_shown [flavor];
}

</script>


<div
	style="
		border-width: 4px;
	"
	class="card p-2 variant-ringed-primary"
>
	<Accordion>
		<AccordionItem open={ fonction_choose_accordion_open }>
			<svelte:fragment slot="summary">
				<div
					style="
						align-items: center;
					"
				>
					<div class="badge variant-soft-primary"
						style="
							font-size: 1.5em;
							padding: 0.25cm;
						"
					>function name</div>
					
					<div
						style="
							margin-top: 4px;
							
							display: flex;
							gap: 2px;
						"
						class="card p-2"
					>
						<div
							style={ `
								padding-right: 0.5cm;
								
							` }
						>
							<Slang text="Function" /> Mode Filter
						</div>
						<div
							style="
								display: flex;
								gap: 8px;
							"
						>
							{#each Object.keys (fonction_modes_shown) as f}
							<button
								class="chip {fonction_modes_shown[f] ? 'variant-filled' : 'variant-soft'}"
								on:click={(event) => { 
									event.stopPropagation ();
									fonction_modes_shown_toggle(f); 
								}}
								on:keypress
							>
								{#if false && fonction_modes_shown [f]}<span></span>{/if}
								<span class="capitalize">{f}</span>
							</button>
							{/each}
						</div>
					</div>
					
					<div style="height: 0.25cm" />
					
					<div 
						style="
							text-align: left;
						"
						class="card p-4"
					>
						<a 
							href={ le_move_explorer_address }
							target="_blank"
							class="anchor" 
						>{ le_move_explorer_address }</a>
					</div>

				</div>
				
			</svelte:fragment>
			<svelte:fragment slot="content">
				<div
					class="card p-2"
					style="
						height: 300px;
						overflow-y: scroll;
					"
				>
					{#if false }
					<RadioGroup>
						{#each les_fonctions as le_fonction, index }	
						{#if (
							(fonction_modes_shown.entry === true && le_fonction.is_entry === true) ||
							(fonction_modes_shown.view === true && le_fonction.is_view === true)
						)}
						<RadioItem 
							bind:group={ le_fonction.name } 
							name="justify" 
							value={ le_fonction.name }
						>
							{#if le_fonction.is_entry === true }
							<span class="badge variant-soft">Entry</span>
							{/if}
							
							{#if le_fonction.is_view === true }
							<span class="badge variant-soft">View</span>
							{/if}
							
							{ le_fonction.name }
						</RadioItem>
						{/if}
						{/each}
					</RadioGroup>
					{/if}
				
					<ListBox>
						{#each les_fonctions as le_fonction, index }	
						{#if (
							(fonction_modes_shown.entry === true && le_fonction.is_entry === true) ||
							(fonction_modes_shown.view === true && le_fonction.is_view === true)
						)}
						<ListBoxItem 
							bind:group={ le_fonction_index } 
							name="medium" 
							value={ index }
							
							disabled={(
								le_fonction.is_entry !== true &&
								le_fonction.is_view !== true 
							)}
							
							on:change={ fonction_changed }
						>
							<div>
								{#if le_fonction.is_entry === true }
								<span class="badge variant-filled">Entry</span>
								{/if}
								
								{#if le_fonction.is_view === true }
								<span class="badge variant-filled">View</span>
								{/if}
								
								{ le_fonction.name }
							</div>
						</ListBoxItem>
						{/if}
						{/each}
					</ListBox>
				</div>
			</svelte:fragment>
		</AccordionItem>
	</Accordion>
</div>
