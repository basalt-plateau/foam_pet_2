

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

let fonction_search = "fields"

let fonction = {
	// fonction_mode: "",	
	
	fonction_name: "",
	
	// signer_hexadecimal_address: "",
	
	// type_parameters: [],
	// parameters: []	
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
}

let module_name_choosen = async ({ module_name }) => {
	console.log ("module_name_choosen:", module_name);
	fonction_module_name = module_name;
}

let fonction_choosen = async () => {
	console.log ("fonction_choosen:");
}

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
	
	PT_freight.petition_fields = {
		mode: fonction_mode,
		
		signer_hexadecimal_address: fonction_signer_hexadecimal_address,
				
		address: fonction_spot,
		module_name: fonction_module_name,
		fonction_name: fonction_selected.name,
		
		type_parameters: fonction_type_parameters,
		parameters: fonction_parameters
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


/*
$: {
	if (versies_trucks_prepared === "yes") {
		let _fonction_module_name = fonction_module_name;
		search_for_module ();
	}
}
*/

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
	
	fonction_found = "no"	
	exposed_fonctions = []
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
	<Versies_Trucks on_change={ on_seeds_truck_change } />

	{#if versies_trucks_prepared === "yes" && PT_prepared === "yes" }		
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

			<!-- <div class="input-group input-group-divider grid-cols-[auto_1fr_auto]">
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
			</div> -->
			
			<Chooser_Address 
				address_chosen={ address_chosen } 
			/>
			
			<div style="height: 0.1cm" ></div>
			
			<Chooser_Module_Name 
				net_path={ versies_freight.net_path }
			
				address={ fonction_spot }
				
				
				module_name_choosen={ module_name_choosen }
			/>
			
			<div style="height: 0.1cm" ></div>
			
			<Chooser_Fonction 
				net_path={ versies_freight.net_path }
			
				address={ fonction_spot }
				module_name={ fonction_module_name }
				
				fonction_choosen={ fonction_choosen }
			/>
		</div>
			
		{/if}
		
		{#if fonction_mode === "entry" }
		<div class="card p-1 variant-ringed-primary">
			<div class="input-group-shim">signer hexadecimal address</div>
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
	</div>
	
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
		
		{#if fonction_type_parameters.length === 0}
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
				bind:value={ fonction_parameters_contents [index] }
			
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
		
		
		<div
			style="
				text-align: right;
			"
		>
			<button 
				type="button" 
				class="btn variant-filled btn-xl"
			>Next</button>
		</div>
		{/if}
	</div>
	
	
	
	<!-- <Options /> -->
	{/if}
	
	<div style="height: 0.5cm" />
	
	{/if}

</div>