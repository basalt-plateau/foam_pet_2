

<script>

import { Autocomplete } from '@skeletonlabs/skeleton';
import { Accordion, AccordionItem } from '@skeletonlabs/skeleton';
import { ListBox, ListBoxItem } from '@skeletonlabs/skeleton';
//
import Slang from '$lib/trinkets/Slang/Trinket.svelte'
//
import { retrieve_fonctions_for_module } from './../screenplays/retrieve_fonctions_for_module'
//

let fonction_choose_accordion_open = true;
let le_fonction_index = ""
let le_fonctions = [];
let fonction_found = "no"
let les_fonctions = []

export let net_path = ""
export let address = ""
export let module_name = ""
$: {
	let _module_name = module_name;
	if (typeof module_name === "string" && module_name.length >= 1) {
		show_fonctions ();
	}
}

const show_fonctions = async () => {
	console.log ("module_name:", { module_name, address });
		
	const { les_fonctions: _les_fonctions } = await retrieve_fonctions_for_module ({
		net_path,
		
		address_hexadecimal_string: address,
		module_name
	});
	
	les_fonctions = _les_fonctions;
	
	console.log ({ les_fonctions });
}


const fonction_changed = () => {
	
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
							{#each Object.keys(fonction_modes_shown) as f}
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
