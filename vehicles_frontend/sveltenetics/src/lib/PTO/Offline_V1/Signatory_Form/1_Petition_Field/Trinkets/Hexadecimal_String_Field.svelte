


<script>


////
///
//
import * as AptosSDK from "@aptos-labs/ts-sdk";
//
import { onMount, onDestroy } from 'svelte';
//
//
import Leaf from '$lib/trinkets/Layout/Leaf/Trinket.svelte'
import Slang from '$lib/trinkets/Slang/Trinket.svelte'
//
import { string_from_Uint8Array } from '$lib/taverns/hexadecimal/string_from_Uint8Array'
import { Uint8Array_from_string } from '$lib/taverns/hexadecimal/Uint8Array_from_string'
import { UTF8_from_hexadecimal_string } from '$lib/taverns/hexadecimal/UTF8'
//
import { fiberize_TP_AO } from '$lib/PTO/Offline/Petition/Fiberize'
import { unpack_petition_envelope } from "$lib/PTO/Offline/Petition/Envelope"
//
//
//
//\
//\\


import * as ST from '../../Truck/index.js'
import Signatory_Truck from '../../Truck/Ride.svelte'
let ST_Freight = false


const refresh = async () => {		
	const production_freight = {
		alert_note: "waiting for petition",
		alert_problem_1: "",
		alert_problem_2: "",
		alert_success: "",
		
		hexadecimal_string_can_add: "yes",
		hexadecimal_string_button_text: "add",
		hexadecimal_string_problem: ""
	}
	
	for (let key in production_freight) {		
		ST_Freight.leaves.Petition_Field [ key ] = production_freight [ key ];
	}
	
	// add_petition_hexadecimal_string ();
}

const add_petition_hexadecimal_string = async () => {
	console.log ("add_petition_hexadecimal_string");
	
	try {
		ST_Freight.leaves.Petition_Field.hexadecimal_string_problem = ""
		ST_Freight.leaves.Petition_Field.hexadecimal_string_problem_verbose = ""
		

		const { petition_aptos_object, envelope_show, petition_hexadecimal_string } = unpack_petition_envelope ({
			TPE: ST_Freight.petition_envelope_hexadecimal_string
		});
		ST_Freight.envelope_show = envelope_show;
		ST_Freight.petition_aptos_object = petition_aptos_object;
		
		ST_Freight.petition_hexadecimal_string = petition_hexadecimal_string;
		ST_Freight.leaves.Petition_Field.hexadecimal_string_button_text = "Added"
		ST_Freight.leaves.Petition_Field.hexadecimal_string_can_add = "no"
		
		ST_Freight.leaves.Petition_Field.alert_success = "The petition was added."		
		ST_Freight.leaves.Petition_Field.alert_note = ""	
		ST_Freight.leaves.Petition_Field.alert_problem_1 = ""	
		ST_Freight.leaves.Petition_Field.alert_problem_2 = ""	
		
		/*
		console.log ("truck:", ST.retrieve_truck ())
		const original_freight = ST.retrieve_truck ().original_freight;
		original_freight.sound_gem.playa ();
		*/
		
		ST_Freight.sound_gem.playa ();
	}
	catch (anomaly) {
		console.error (anomaly);
		
		ST_Freight.leaves.Petition_Field.hexadecimal_string_problem = "That hexadecimal string could not be converted into an transaction petition bracket.";	
		ST_Freight.leaves.Petition_Field.hexadecimal_string_problem_verbose = anomaly.message	
		
		ST_Freight.leaves.Petition_Field.hexadecimal_string_button_text = "Add"
		ST_Freight.leaves.Petition_Field.hexadecimal_string_can_add = "yes"	
		
		ST_Freight.leaves.Petition_Field.alert_success = ""		
		ST_Freight.leaves.Petition_Field.alert_note = ""	
		ST_Freight.leaves.Petition_Field.alert_problem_1 = "That hexadecimal string could not be converted into an transaction petition bracket.";	
		ST_Freight.leaves.Petition_Field.alert_problem_2 = anomaly.message
	}
}


</script>

<Leaf>
	<Signatory_Truck on_change={ ({ pro_freight }) => { ST_Freight = pro_freight; } } />
	
	{#if typeof ST_Freight === "object"}
	<div monitor="hexadecimal string panel"
		class="p-4"
	>
		<div>
			<div style="padding: 5px 0 10px;">
				<header
					style="
						text-align: center;
						font-size: 1.4em;
						padding: .2cm 0;
					"
				>Hexadecimal String</header>
				<p
					style="
						text-align: center;
					"
				>The hexadecimal string of the <Slang text="petition" /> can be pasted here.</p>
			</div>
		</div>
		
		<label class="label">
			<textarea 
				monitor="hexadecimal string field"
			
				bind:value={ ST_Freight.petition_envelope_hexadecimal_string }
				on:keyup={ refresh }
				
				rows="8" 
				placeholder="" 
				
				style="padding: 10px"
				class="textarea" 
			/>
		</label>
		
		
		<div style="text-align: right; margin-top: 10px;">
			<button 
				monitor="add hexadecimal string"

				type="button" 

				disabled={ ST_Freight.leaves.Petition_Field.hexadecimal_string_can_add != "yes" }
				on:click={ add_petition_hexadecimal_string }
				
				style="padding: 10px 60px"
				class="btn variant-filled"
			>{ ST_Freight.leaves.Petition_Field.hexadecimal_string_button_text }</button>
		</div>
		
		<div style="height: 5cm" />		
	</div>
	{/if}
</Leaf>


