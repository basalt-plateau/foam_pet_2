

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
import Code_Wall from '$lib/trinkets/Code_Wall/Trinket.svelte' 
//
import { check_roomies_truck } from '$lib/Versies/Trucks'
import { ask_account_module } from '$lib/PTO/Account_Module/Ask'
import { string_from_Uint8Array } from '$lib/taverns/hexadecimal/string_from_Uint8Array'
//
////

import Options from "./Trinkets/Options.svelte"
//


/*
	Cards, Rolls, Roller
*/
import Chooser_Address from "./Trinkets/Chooser_Address.svelte"
import Chooser_Module_Name from "./Trinkets/Chooser_Module_Name.svelte"
import Chooser_Fonction from "./Trinkets/Chooser_Fonction.svelte"
//
import { retrieve_fonction_parameters } from './screenplays/retrieve_fonction_parameters'
import { retrieve_fonction_type_parameters } from './screenplays/retrieve_fonction_type_parameters'


	

import * as PT from './../Truck/index.js'


////
//
//	Truck Freight
//
//
import Petition_Truck from '$lib/PTO/Transaction_Offline/Petition/Truck/Ride.svelte'
import Versies_Truck from '$lib/Versies/Trucks.svelte'
//
let PT_Freight = false
let Versies_Freight = false
//
////



let header_size = "1.5em"

let le_move = {
	utf8_string: "",
	explorer_address: ""
}

let fonction_search = "fields"

/*
let fonction = {
	// fonction_mode: "",	
	
	// fonction_name: "",
	
	// signer_hexadecimal_address: "",
	
	// type_parameters: [],
	// parameters: []	
}
*/



let exposed_fonctions = [];
let fonction_selected = {}
let fonction_found = "no"
//


//
let fonction_mode = ""
//
//
let fonction_spot = "";
//
let fonction_name_index = ""
let fonction_name = ""
//
let fonction_module_name = ""
//
//
let fonction_parameters = []
let fonction_parameters_contents = []
//
let fonction_type_parameters = []
let fonction_type_parameters_contents = []
//
let fonction_signer_hexadecimal_address = "991378D74FAC384404B971765BEF7525CCE26C8EFD84B9FF27D202E10D7FFBE5"
//



let address_chosen = async ({ address }) => {
	console.log ("address_chosen:", address);
	fonction_spot = address;
	
	fonction_module_name = ""
	fonction_found = "no"
}
let module_name_choosen = async ({ module_name }) => {
	console.log ("module_name_choosen:", module_name);
	fonction_module_name = module_name;
}
let fonction_choosen = async ({ 
	fonction, 
	fonction_mode: _fonction_mode
}) => {
	console.log ("fonction_choosen:", fonction);
	
	fonction_selected = fonction;
	fonction_type_parameters = retrieve_fonction_type_parameters ({ fonction_selected: fonction })
	
	/*
		[
			{ "name": "address", "field": "" ],
			[ "u64": "" ],
			[ "address": "" ],
			[ "address": "" ]
		]
	*/
	fonction_parameters = retrieve_fonction_parameters ({ fonction_selected: fonction })
	
	
	fonction_mode = _fonction_mode;
	fonction_found = "yes"
	
	PT_Freight.petition_fields = {
		mode: fonction_mode,
		
		signer_hexadecimal_address: fonction_signer_hexadecimal_address,
				
		address: fonction_spot,
		module_name: fonction_module_name,
		fonction_name: fonction_selected.name,
		
		type_parameters: fonction_type_parameters,
		parameters: fonction_parameters
	}
}

let fonction_parameters_changed = ({ index, contents }) => {
	console.log ({ fonction_parameters });
	
	fonction_parameters [ index ].field = contents;
	
	const fresh_petition_fields = {
		mode: fonction_mode,
		
		signer_hexadecimal_address: fonction_signer_hexadecimal_address,
				
		address: fonction_spot,
		module_name: fonction_module_name,
		fonction_name: fonction_selected.name,
		
		type_parameters: fonction_type_parameters,
		parameters: fonction_parameters
	}
	
	PT_Freight.petition_fields = fresh_petition_fields;
}

const enhance = () => {

	if (PT_Freight && PT_Freight.petition_fields) {}
	else {
		return;
	}
	
	fonction_selected = exposed_fonctions [ fonction_name_index ]
	if (fonction_selected === undefined) {
		fonction_found = "no"
		return;
	}
	else {
		fonction_found = "yes"
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
	// console.log ({ fonction_selected });
	
	
	let mode_explorer = ""
	if (fonction_selected.is_entry) {
		fonction_mode = "entry"
		mode_explorer = "run"
	}
	else if (fonction_selected.is_view) {
		fonction_mode = "view"
		mode_explorer = "view"
	}
	
	//
	//	This is the link to aptoslabs explorer.
	//
	if (fonction_selected) {
		le_move.explorer_address = [
			"https://explorer.aptoslabs.com/account",
			fonction_spot,
			"modules",
			mode_explorer,
			fonction_module_name,
			fonction_selected.name
		].join ("/");	
	}
	
	
	
	console.log ("building petition fields");
	
	fonction_parameters = retrieve_fonction_parameters ({ fonction_selected })
	fonction_type_parameters = retrieve_fonction_type_parameters ({ fonction_selected })
	
	PT_Freight.petition_fields = {
		mode: fonction_mode,
		
		signer_hexadecimal_address: fonction_signer_hexadecimal_address,
				
		address: fonction_spot,
		module_name: fonction_module_name,
		fonction_name: fonction_selected.name,
		
		type_parameters: fonction_type_parameters,
		parameters: fonction_parameters
	}
}








</script>


<div
	style="
		display: flex;
		gap: 0.25cm;
		
		flex-direction: column;
		
		padding: 0.25cm;
	"
>
	<Petition_Truck on_change={ ({ freight }) => { PT_Freight = freight; } } />
	<Versies_Truck on_change={ ({ freight }) => { Versies_Freight = freight } } />
	
	{#if (
		typeof Versies_Freight === "object" && 
		typeof PT_Freight === "object" 
	)}		
	<div 
		style="
			display: flex;
			flex-direction: column;
			gap: 0.1cm;
		"
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
		
		
		<!-- whether to have multiple fields or __::__::__ -->
		<div
			style="
				display: none;
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
			<div 
				style="
					text-align: center;
				"
				class="card p-4"
			>
				<a 
					href={ le_move.explorer_address }
					target="_blank"
					
					style="
						text-align: center;
					"
					class="anchor" 
				>{ le_move.explorer_address }</a>
			</div>
			
			<Chooser_Address 
				address_chosen={ address_chosen } 
			/>
			
			<div style="height: 0.1cm" ></div>
			
			<Chooser_Module_Name 
				net_path={ Versies_Freight.net_path }
			
				address={ fonction_spot }
				
				
				module_name_choosen={ module_name_choosen }
			/>
			
			<div style="height: 0.1cm" ></div>
			
			<Chooser_Fonction 
				net_path={ Versies_Freight.net_path }
			
				address={ fonction_spot }
				module_name={ fonction_module_name }
				
				fonction_choosen={ fonction_choosen }
			/>
		</div>
		{/if}
	</div>

	
	{#if fonction_mode === "entry" }
	<div class="card p-4">
		<div
			style={ `
				text-align: center;
				font-size: ${ header_size };
				padding: 0.25cm 0;
			` }
		>
			<Slang text="Signer" /> Hexadecimal Address
		</div>
		
		<textarea 
			style="
				padding: 0.25cm;
			"
			class="textarea"  
			
			bind:value={ fonction_signer_hexadecimal_address }
			on:change={ enhance }
		/>
	</div>
	{/if}
	
	{#if fonction_found === "yes"}
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
		{#each fonction_type_parameters as type_parameter, index }
		<div 
			style="
				text-align: center;
			"
			class="card p-1"
		>				
			<textarea 
				bind:value={ fonction_type_parameters_contents [index] }
			
				style="
					padding: 0.25cm;
				"
				class="textarea"  
				on:change={ enhance }
			/>
		</div>
		{/each}
		
		{#if Array.isArray (fonction_type_parameters) && fonction_type_parameters.length === 0}
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
		{#each fonction_parameters as parameter, index }
		<div 
			style="
				text-align: left;
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
				
				on:keyup={(event) => {
					const contents = event.target.value;
					
					// fonction_parameters [index].field
					
					console.log ("changed");
					
					fonction_parameters_changed ({
						index,
						contents
					})
				}}
			/>
		</div>
		{/each}
		
		{#if Array.isArray (fonction_parameters) && fonction_parameters.length === 0}
		<p
			style="
				text-align: center;
			"
		>0 Parameters</p>
		{/if}
		
		
		
		{/if}
	</div>
	

	
	<!-- <Options /> -->
	{/if}
	
	<div style="height: 0.5cm" />
	
	{/if}

</div>