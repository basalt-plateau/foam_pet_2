

<script>


////
//
//
import _get from 'lodash/get'
//
import { onMount, onDestroy } from 'svelte'
//
import { Autocomplete } from '@skeletonlabs/skeleton';
import { ListBox, ListBoxItem } from '@skeletonlabs/skeleton';
import { Accordion, AccordionItem } from '@skeletonlabs/skeleton';
import { RadioGroup, RadioItem } from '@skeletonlabs/skeleton';	
//
//
import Slang from '$lib/trinkets/Slang/Trinket.svelte'
import Versies_Trucks from '$lib/Versies/Trucks.svelte'
import Code_Wall from '$lib/trinkets/Code_Wall/Trinket.svelte' 
//
import { check_roomies_truck } from '$lib/Versies/Trucks'
import { ask_account_module } from '$lib/PTO/Account_Module/Ask'
import { string_from_Uint8Array } from '$lib/taverns/hexadecimal/string_from_Uint8Array'
//
////


import { retrieve_fonction_parameters } from './screenplays/retrieve_fonction_parameters'
import { retrieve_fonction_type_parameters } from './screenplays/retrieve_fonction_type_parameters'



import * as PT from './../Truck/index.js'


////
//
//	Trucks
//
//
let PT_prepared = "no"
let PT_freight = {}
let PT_monitor;
onMount (() => {
	PT_freight = PT.retrieve_truck ().freight;
	PT_monitor = PT.monitor_truck ((_freight) => {
		PT_freight = _freight;
	})
	
	PT_prepared = "yes"
});
onDestroy (() => {
	PT_monitor.stop ()
});
//
//
let versies_freight = {}
let versies_trucks_prepared = "no"
const on_seeds_truck_change = ({ freight: _freight, happening }) => {
	versies_freight = _freight;
	if (happening === "mounted") {
		versies_trucks_prepared = "yes"
		search_for_module ();
	}
}
//
//
//
//
////



let header_size = "1.5em"

let le_move = {
	utf8_string: "",
	explorer_address: ""
}

let fonction_modes_shown = [ "view", "entry" ]
let fonction_search = "fields"

let fonction = {
	found: "no",
	
	fonction_mode: "",	
	
	fonction_name: "",
	
	signer_hexadecimal_address: "",
	
	type_parameters: [],
	parameters: []	
}

/*
	// The fonctions possible for the address::module_name
	exposed_fonctions: This is what is returned by API
	
	// The selected fonction
	fonction_selected: This is the fonction that is selected
	fonction_name_index: This is the index of the fonction that is selected.
	
	
	fonction_name:
	fonction_choose_accordion_open:
*/

let exposed_fonctions = [];
let fonction_selected = {}
let fonction_name_index = ""
let fonction_name = ""
let fonction_choose_accordion_open = true;


let fonction_spot = "0x1";
$: {
	let _fonction_spot = fonction_spot;
	search_for_module ();
}



/*



*/
const enhance = () => {
	console.log ("enhance", {
		fonction,
		fonction_spot,
		PT_freight
	});
	
	if (PT_freight && PT_freight.petition_fields) {}
	else {
		return;
	}
	
	fonction_selected = exposed_fonctions [ fonction_name_index ]
	if (fonction_selected === undefined) {
		fonction.found = "no"
		return;
	}
	
	/*
		{
			"name": "exists_at",
			"visibility": "public",
			"is_entry": false,
			"is_view": true,
			"generic_type_params": [],
			"params": [
				"address"
			],
			"return": [
				"bool"
			]
		}
	*/
	console.log ({ fonction_selected });
	
	//
	//	This is the link to aptoslabs explorer.
	//
	if (fonction_selected) {
		le_move.explorer_address = [
			"https://explorer.aptoslabs.com/account",
			fonction_spot,
			"modules/run",
			fonction_module_name,
			fonction_selected.name
		].join ("/");	
	}
	
	let mode = ""
	if (fonction_selected.is_entry) {
		mode = "entry"
	}
	else if (fonction_selected.is_view) {
		mode = "view"
	}
	
	PT_freight.petition_fields = {
		mode,
				
		address: fonction_spot,
		module_name: fonction_module_name,
		fonction_name: fonction_selected.name,
		
		type_parameters: retrieve_fonction_type_parameters ({ fonction_selected }),
		parameters: retrieve_fonction_parameters ({ fonction_selected })
	}
	

	
}

let exposed_fonction_name = ""
$: {
	if (versies_trucks_prepared === "yes") {
		let _fonction_name_index = fonction_name_index;
		enhance ();
	}
}




/*
	::exists_at
*/
let fonction_module_name = "account"
$: {
	if (versies_trucks_prepared === "yes") {
		let _fonction_module_name = fonction_module_name;
		search_for_module ();
	}
}

let search_for_module = async () => {
	const { enhanced, successful } = await ask_account_module ({ 
		net_path: versies_freight.net_path,
		
		address_hexadecimal_string: fonction_spot,
		module_name: fonction_module_name
	});
	if (successful === "yes") {
		exposed_fonctions = enhanced.abi.exposed_functions;
		
		le_move.explorer_address = [
			"https://explorer.aptoslabs.com/account",
			fonction_spot,
			"modules/code",
			fonction_module_name
		].join ("/");
		
		enhance ();
		
		return;
	}
	
	fonction.found = "no"	
	exposed_fonctions = []
}







</script>


<div
	style="
		display: flex;
		gap: 0.25cm;
		
		flex-direction: column;
	"
>
	<Versies_Trucks on_change={ on_seeds_truck_change } />

	{#if versies_trucks_prepared === "yes" && PT_prepared === "yes" }
	<div class="card p-4"
	>
		<div
			style={ `
				text-align: center;
				font-size: ${ header_size };
				padding: 0.25cm 0;
			` }
		>
			<Slang text="Function" /> Mode
		</div>
		
		<div
			style="
				text-align: center;
				width: 100%;
				max-width: 300px;
				margin: 0 auto;
			"
		>
			<ListBox multiple>
				<ListBoxItem bind:group={fonction_modes_shown} name="view" value="view">View</ListBoxItem>
				<ListBoxItem bind:group={fonction_modes_shown} name="entry" value="entry">Entry</ListBoxItem>
			</ListBox>

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
				<div class="input-group-shim">address</div>
				<input
					bind:value={ fonction_spot }
					on:change={ enhance }
			
					class="input" 
					type="text" 
					style="
						padding: 0.25cm;
					"
				/>
			</div>
			
			<div style="height: 0.1cm" ></div>
			
			<div class="input-group input-group-divider grid-cols-[auto_1fr_auto]">
				<div class="input-group-shim">module name</div>
				<input
					bind:value={ fonction_module_name }
					on:change={ enhance }
			
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
										(fonction_modes_shown.includes ("entry") && exposed_fonction.is_entry === true) ||
										(fonction_modes_shown.includes ("view") && exposed_fonction.is_view === true)
									)}
									<ListBoxItem 
										bind:group={ fonction_name_index } 
										name="medium" 
										value={ index }
										
										disabled={(
											exposed_fonction.is_entry !== true &&
											exposed_fonction.is_view !== true 
										)}
										
										on:change={ enhance }
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
		
		{#if fonction_modes_shown.includes ("entry") }
		<div class="card p-1 variant-ringed-primary">
			<div class="input-group-shim">signer hexadecimal address</div>
			<textarea 
				style="
					padding: 0.25cm;
				"
				class="textarea"  
				
				bind:value={ fonction.signer_hexadecimal_address }
				on:change={ enhance }
			/>
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
					on:change={ enhance }
				/>
			</div>
			{/each}
			
			{#if fonction.type_parameters.length === 0}
			<p
				style="
					text-align: center;
				"
			>0 Type Parameters</p>
			{/if}
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
				
				<div style="height: 0.1cm;"></div>
				
				<textarea 
					style="
						padding: 0.25cm;
					"
					class="textarea"  
					
					on:change={ enhance }
				/>
			</div>
			{/each}
			
			{#if fonction.parameters.length === 0}
			<p
				style="
					text-align: center;
				"
			>0 Type Parameters</p>
			{/if}
		{/if}
	</div>
	{/if}
	
	<div style="height: 0.5cm" />
	
	{/if}

</div>