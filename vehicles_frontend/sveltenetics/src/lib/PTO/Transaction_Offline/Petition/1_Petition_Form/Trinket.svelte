

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


//


/*
	Cards, Rolls, Roller
	
	Electors
*/
import Elector_Address from "./Trinkets/Elector_Address.svelte"
import Elector_Module_Name from "./Trinkets/Elector_Module_Name.svelte"
import Elector_Fonction from "./Trinkets/Elector_Fonction.svelte"
import Elector_Address_of_Flourisher from "./Trinkets/Elector_Address_of_Flourisher.svelte"
import Elector_Fonction_Parameters from "./Trinkets/Elector_Fonction_Parameters.svelte"
import Elector_Fonction_Type_Parameters from "./Trinkets/Elector_Fonction_Type_Parameters.svelte"
import Elector_Options from "./Trinkets/Elector_Options.svelte"


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



/*
	TODO:
		partially designated:
		fully designated:
	
		partially elected fields:
	
			PT_Freight.petition_fields = {
				mode: "entry",
				
				address: "",
				module_name: "",
				fonction_name: "",
				
				flourisher_address_hexadecimal: "991378D74FAC384404B971765BEF7525CCE26C8EFD84B9FF27D202E10D7FFBE5",
				
				type_parameters: [{
					
				}],
				parameters: [{
					
				}]
			}
			
			
		let use_partially_elected_petition_fields = "yes"
		let use_fully_elected_petition_fields = "yes"
		let partially_elected_petition_fields = {
			mode: "entry",
									
			address: "",
			module_name: "",
			fonction_name: "",

			flourisher_address_hexadecimal: "",

			type_parameters: [{
				
			}],
			parameters: [{
				
			}]
		}
*/

/**/



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
let fonction_signer_hexadecimal_address = ""
//
let fonction_parameters = []
let fonction_type_parameters = []
//
//

let build_petition = () => {
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

	build_petition ();
}

let address_of_flourisher_chosen = ({
	address_of_flourisher
}) => {
	fonction_signer_hexadecimal_address = address_of_flourisher;
}

let fonction_type_parameters_changed = ({ index, contents }) => {
	fonction_type_parameters [ index ].field = contents;
	
	build_petition ();
}

let fonction_parameters_changed = ({ index, contents }) => {
	fonction_parameters [ index ].field = contents;
	
	build_petition ();
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
			
			<Elector_Address 
				address_chosen={ address_chosen } 
			/>
			
			<div style="height: 0.1cm" ></div>
			
			<Elector_Module_Name 
				net_path={ Versies_Freight.net_path }
			
				address={ fonction_spot }
				
				module_name_choosen={ module_name_choosen }
			/>
			
			<div style="height: 0.1cm" ></div>
			
			<Elector_Fonction 
				net_path={ Versies_Freight.net_path }
			
				address={ fonction_spot }
				module_name={ fonction_module_name }
				
				fonction_choosen={ fonction_choosen }
			/>
		</div>
		{/if}
	</div>

	
	{#if fonction_mode === "entry" }
	<Elector_Address_of_Flourisher 
		header_size={ header_size }
		address_of_flourisher_chosen={ address_of_flourisher_chosen }
	/>
	{/if}
	
	{#if fonction_found === "yes"}
	<Elector_Fonction_Parameters 
		header_size={ header_size }
		bind:fonction_parameters={ fonction_parameters }
	/>
	<Elector_Fonction_Type_Parameters 
		header_size={ header_size }
		bind:fonction_type_parameters={ fonction_type_parameters }
	/>
	<!-- <Options /> -->
	{/if}
	
	<div style="height: 2.5cm" />
	
	{/if}

</div>