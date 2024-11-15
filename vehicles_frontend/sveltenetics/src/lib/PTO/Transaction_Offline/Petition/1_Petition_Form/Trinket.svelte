

<script>


////
//
import { onMount } from 'svelte'
//
import { Autocomplete } from '@skeletonlabs/skeleton';
import { ListBox, ListBoxItem } from '@skeletonlabs/skeleton';
import { Accordion, AccordionItem } from '@skeletonlabs/skeleton';
import { RadioGroup, RadioItem } from '@skeletonlabs/skeleton';	
//
import _get from 'lodash/get'
//
//
import Slang from '$lib/trinkets/Slang/Trinket.svelte'
import Versies_Trucks from '$lib/Versies/Trucks.svelte'
import { check_roomies_truck } from '$lib/Versies/Trucks'
import { ask_account_module } from '$lib/PTO/Account_Module/Ask'
//
////
import { string_from_Uint8Array } from '$lib/taverns/hexadecimal/string_from_Uint8Array'
import Code_Wall from '$lib/trinkets/Code_Wall/Trinket.svelte' 

import { verify_leaf } from './../Truck/index.js'

import { retrieve_fonction_parameters } from './screenplays/retrieve_fonction_parameters'
import { retrieve_fonction_type_parameters } from './screenplays/retrieve_fonction_type_parameters'

	
/*
	possibilities:
		view
		entry
*/

let versies_trucks_prepared = "no"

let header_size = "1.5em"

let le_move = {
	utf8_string: "",
	explorer_address: ""
}

let fonction_type = "view"
let fonction_search = "fields"

let fonction = {
	found: "no",
	
	name: "",
	module: "",
	
	fonction_name: "",
	fonction_type: "",	
	
	type_parameters: [],
	parameters: []	
}



let fonction_placeholder = "0x1::account::exists_at"
let fonction_spot = "0x1"

let exposed_fonctions = [];
let fonction_selected = {}

let fonction_name_index = ""

let fonction_name = ""

let fonction_choose_accordion_open = true;

let fonction_name_changed = () => {
	enhance ();
}

const verify_can_go_on = () => {
	
	return "yes"
}

const enhance = () => {
	// verify_leaf
		
	fonction_selected = exposed_fonctions [ fonction_name_index ]
	fonction.parameters = retrieve_fonction_parameters ({
		fonction_selected
	});
	
	if (fonction_selected === undefined) {
		fonction.found = "no"
		return;
	}
		
	if (fonction_selected) {
		fonction.type_parameters = retrieve_fonction_type_parameters ({
			fonction_selected
		});
	}
	
	if (fonction_selected) {
		le_move.explorer_address = [
			"https://explorer.aptoslabs.com/account",
			fonction_spot,
			"modules/run",
			fonction_module,
			fonction_selected.name
		].join ("/");	
	}
	
	verify_can_go_on ()
	
	verify_leaf ({});
	
	fonction.found = "yes"
}

let exposed_fonction_name = ""
$: {
	if (versies_trucks_prepared === "yes") {
		let _fonction_name_index = fonction_name_index;
		enhance ();
	}
}

/*
let retrieve_module = async () => {
	const { enhanced } = await ask_account_module ({ 
		net_path: versies_freight.net_path,
		address_hexadecimal_string: fonction_spot,
		module_name: fonction_module
	})
}
*/



let on_fonction_select = () => {}




/*
	::exists_at
*/
let fonction_module = "account"
$: {
	if (versies_trucks_prepared === "yes") {
		let _fonction_module = fonction_module;
		search_for_module ();
	}
}

let search_for_module = async () => {
	const { enhanced, successful } = await ask_account_module ({ 
		net_path: versies_freight.net_path,
		address_hexadecimal_string: fonction_spot,
		module_name: fonction_module
	});
	if (successful === "yes") {
		exposed_fonctions = enhanced.abi.exposed_functions;
		
		le_move.explorer_address = [
			"https://explorer.aptoslabs.com/account",
			fonction_spot,
			"modules/code",
			fonction_module
		].join ("/");
		
		enhance ();
		
		return;
	}
	
	fonction.found = "no"	
	exposed_fonctions = []
}


let versies_freight = {}

const on_seeds_truck_change = ({ freight: _freight, happening }) => {
	versies_freight = _freight;
	if (happening === "mounted") {
		versies_trucks_prepared = "yes"
		search_for_module ();
	}
}


onMount (() => {})

</script>


<div
	style="
		display: flex;
		gap: 0.25cm;
		
		flex-direction: column;
	"
>
	<Versies_Trucks on_change={ on_seeds_truck_change } />

	{#if versies_trucks_prepared === "yes"}
	<div class="card p-4"
	>
		<div
			style={ `
				text-align: center;
				font-size: ${ header_size };
				padding: 0.25cm 0;
			` }
		>
			<Slang text="Function" /> Type
		</div>
		
		<div
			style="
				text-align: center;
			"
		>
			<RadioGroup>
				<RadioItem bind:group={fonction_type} name="justify" value={"view"}>view</RadioItem>
				<RadioItem bind:group={fonction_type} name="justify" value={"entry"}>entry</RadioItem>
				<RadioItem bind:group={fonction_type} name="justify" value={"every"}>every</RadioItem>
			</RadioGroup>
		</div>
	</div>
		
	<div 
		style="
			display: flex;
			flex-direction: column;
			gap: 0.1cm;
		"
		class="card p-4"
	>	
		
		<div
			style={ `
				text-align: center;
				font-size: ${ header_size };
				padding: 0;
			` }
		>
			<Slang text="Function" />
		</div>
		
		<div
			style="
				text-align: center;
			"
		>
			<RadioGroup>
				<RadioItem bind:group={ fonction_search } name="justify" value={"fields"}>fields</RadioItem>
				<RadioItem bind:group={ fonction_search } name="justify" value={"entire"}>entire</RadioItem>
			</RadioGroup>
		</div>
		
		<div style="height: 0.25cm" ></div>
		
		
		{#if fonction_search === "fields" }
		<div>
			<div class="card p-4">
				<a class="anchor" href={ le_move.explorer_address }>{ le_move.explorer_address }</a>
			</div>

			<div class="input-group input-group-divider grid-cols-[auto_1fr_auto]">
				<div class="input-group-shim">name</div>
				<input
					bind:value={ fonction_spot }
			
					class="input" 
					type="text" 
					style="
						padding: 0.25cm;
					"
				/>
			</div>
			
			<div class="input-group input-group-divider grid-cols-[auto_1fr_auto]">
				<div class="input-group-shim">module</div>
				<input
					bind:value={ fonction_module }
			
					class="input" 
					type="text" 
					style="
						padding: 0.25cm;
					"
				/>
			</div>
			
			<div
				style="
					border-width: 4px;
				"
				class="card p-2 variant-ringed-primary"
			>
				<Accordion>
					<AccordionItem
						open={ fonction_choose_accordion_open }
					>
						<svelte:fragment slot="summary">
							<div
								style="
									display: flex;
									align-items: center;
									
								"
							>
								<div class="badge variant-soft-primary"
									style="
										font-size: 1.5em;
										padding: 0.25cm;
									"
								>function name</div>
								
								<div style="width: 1cm;"></div>
						
								{#if fonction_selected && Object.keys (fonction_selected).length >= 1}
								
								<div>
									{ fonction_type }
									{ fonction_selected.name }
									
									{#if fonction_selected.is_entry === true }
									<span class="badge variant-filled">Entry</span>
									{/if}
									
									{#if fonction_selected.is_view === true }
									<span class="badge variant-filled">View</span>
									{/if}
								</div>
								{/if}
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
									{#each exposed_fonctions as exposed_fonction, index }	
									{#if (
										(fonction_type === "entry" && exposed_fonction.is_entry === true) ||
										(fonction_type === "view" && exposed_fonction.is_view === true) ||
										(fonction_type === "every")
									)}
									<ListBoxItem 
										bind:group={ fonction_name_index } 
										name="medium" 
										value={ index }
										
										disabled={(
											exposed_fonction.is_entry !== true &&
											exposed_fonction.is_view !== true 
										)}
										
										on:change={ fonction_name_changed }
									>
										<div>
											{ exposed_fonction.name }

											{#if exposed_fonction.is_entry === true }
											<span class="badge variant-filled">Entry</span>
											{/if}
											
											{#if exposed_fonction.is_view === true }
											<span class="badge variant-filled">View</span>
											{/if}
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
		</div>
		{/if}
	</div>
	
	{#if fonction.found === "yes"}
	<div class="card p-4">	
		<div
			style={ `
				text-align: center;
				font-size: ${ header_size };
				padding: 0.25cm 0;
			` }
		>
			<Slang text="Function" /> Type Parameters
		</div>
		
		{#if fonction_selected && Object.keys (fonction_selected).length >= 1}
			{#each fonction.type_parameters as type_parameter, index }
			<div 
				style="
					text-align: center;
				"
				class="card p-1"
			>				
				<textarea 
					style="
						padding: 0.25cm;
					"
					class="textarea"  
				/>
			</div>
			{/each}
		{/if}
	</div>
	
	<div class="card p-4">	
		<div
			style={ `
				text-align: center;
				font-size: ${ header_size };
				padding: 0.25cm 0;
			` }
		>
			<Slang text="Function" /> Parameters
		</div>
		
		{#if fonction_selected && Object.keys (fonction_selected).length >= 1}
			{#each fonction.parameters as parameter, index }
			<div 
				style="
					text-align: center;
				"
				class="card p-1"
			>
				<div style="height: 0.25cm;"></div>
			
				<div>
					<span 
						style="
							padding: 0.25cm 0.5cm;
							font-size: 1.5em;
						"
						class="badge variant-soft-primary"
					>{ parameter.name }</span>
				</div>
				
				<div style="height: 0.25cm;"></div>
				
				<textarea 
					style="
						padding: 0.25cm;
					"
					class="textarea"  
				/>
			</div>
			{/each}
		{/if}
	</div>
	{/if}
	
	<div style="height: 0.5cm" />
	
	{/if}

</div>