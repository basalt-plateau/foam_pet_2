

<script>


/*
	const petition_fields = {
		mode: "entry",
								
		address: "0x1",
		module_name: "aptos_account",
		fonction_name: "transfer",

		flourisher_address_hexadecimal: "991378D74FAC384404B971765BEF7525CCE26C8EFD84B9FF27D202E10D7FFBE5",

		type_parameters: [],
		parameters: [
			{
				"name": "address",
				"field": "991378D74FAC384404B971765BEF7525CCE26C8EFD84B9FF27D202E10D7FFBE6"
			},
			{
				"name": "u64",
				"field": "1234"
			}
		]
	}

	<Petition_Form 
		use_fully_elected_petition_fields="yes"
		fully_elected_petition_fields={ petition_fields }
	/>
*/


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
import Petition_Truck from '$lib/PTO/Offline/Petition_Form/Truck/Ride.svelte'
import Versies_Truck from '$lib/Versies/Trucks.svelte'
//
let PT_Freight = false
let Versies_Freight = false
//
////


/*
	Example:
		0x1::aptos_account::transfer
*/


/*
	TODO:
		* fully designated:
			let use_fully_elected_petition_fields = "yes"
			let fully_elected_petition_fields = {
				mode: "entry",
										
				address: "0x1",
				module_name: "aptos_account",
				fonction_name: "transfer",

				flourisher_address_hexadecimal: "",

				type_parameters: [],
				parameters: [
					{
						"name": "address",
						"field": ""
					},
					{
						"name": "u64",
						"field": ""
					}
				]
			}

	
		* partially designated:
			let use_partially_elected_petition_fields = "yes"
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

*/
/**/



let header_size = "1.5em"

let le_move = {
	utf8_string: "",
	explorer_address: ""
}

let fonction_search = "fields"


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
let fonction_mode = ""
let fonction_found = "no"
let fonction_selected = {}
//
//
let fonction_signer_hexadecimal_address = ""
//
let fonction_parameters = []
let fonction_type_parameters = []
//
//

let build_petition = () => {
	var petition_fields = {
		mode: fonction_mode,
		
		signer_hexadecimal_address: fonction_signer_hexadecimal_address,
				
		address: fonction_spot,
		module_name: fonction_module_name,
		fonction_name: fonction_selected.name,
		
		type_parameters: fonction_type_parameters,
		parameters: fonction_parameters
	};
	
	console.log (`
	
		build_petition called!
		
			fonction_signer_hexadecimal_address: ${ fonction_signer_hexadecimal_address }
		
			petition fields: ${ JSON.stringify (petition_fields, null, 4) }
	`);
	
	PT_Freight.petition_fields = petition_fields;
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
	
	console.log ({ fonction_found });

	build_petition ();
}

let address_of_flourisher_chosen = ({
	address_of_flourisher
}) => {
	console.log ("address_of_flourisher_chosen", { address_of_flourisher });
	fonction_signer_hexadecimal_address = address_of_flourisher;
	build_petition ();
}

let fonction_parameters_changed = ({ index, contents }) => {
	fonction_parameters [ index ].field = contents;
	build_petition ();
}

let fonction_type_parameters_changed = ({ index, contents }) => {
	fonction_type_parameters [ index ].field = contents;
	build_petition ();
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
	<Petition_Truck on_change={ ({ pro_freight }) => { PT_Freight = pro_freight; } } />
	<Versies_Truck on_change={ ({ freight }) => { Versies_Freight = freight } } />
	
	{#if (
		typeof Versies_Freight === "object" && 
		typeof PT_Freight === "object" 
	)}
	
	{#if PT_Freight.use_fully_elected_petition_fields === "yes" }
	<div>
		The petition has already been built.
	</div>	
	{:else}
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
		on_change={ fonction_parameters_changed }
	/>
	<Elector_Fonction_Type_Parameters 
		header_size={ header_size }
		bind:fonction_type_parameters={ fonction_type_parameters }
		on_change={() => {
			
		}}
	/>
	<!-- <Options /> -->
	{/if}
	
	<div style="height: 2.5cm" />
	
	{/if}
	{/if}

</div>