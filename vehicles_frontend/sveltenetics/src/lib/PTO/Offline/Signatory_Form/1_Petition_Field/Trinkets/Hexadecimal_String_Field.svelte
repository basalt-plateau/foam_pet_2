


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
//
//
//
//\
//\\


import * as ST from '../../Truck/index.js'
import Signatory_Truck from '../../Truck/Ride.svelte'
let ST_Freight = false


import { fiberize_TP_AO } from '$lib/PTO/Offline/Petition/Fiberize'
	
import { UTF8_from_hexadecimal_string } from '$lib/taverns/hexadecimal/UTF8'


const add_petition_hexadecimal_string = async () => {
	console.log ("add_petition_hexadecimal_string");
	
	try {
		ST_Freight.leaves.Petition_Field.hexadecimal_string_problem = ""
		ST_Freight.leaves.Petition_Field.hexadecimal_string_problem_verbose = ""
		
		//
		//	Parse the petition_kit_hexadecimal_string
		//
		//
		const UTF8_string = JSON.parse (
			UTF8_from_hexadecimal_string (ST_Freight.petition_kit_hexadecimal_string)
		);
		console.info ({ UTF8_string })
		
		
		const { notes, petition: _petition_hexadecimal_string } = UTF8_string;
		console.info ({ _petition_hexadecimal_string })
		
		//
		//
		//
		//
		const TP_AO = AptosSDK.SimpleTransaction.deserialize (
			new AptosSDK.Deserializer (
				Uint8Array_from_string (
					_petition_hexadecimal_string
				)
			)
		);
		
		console.log ({ TP_AO });
		
		ST_Freight.petition_fiberized = fiberize_TP_AO ({ TP_AO })
		
		ST_Freight.leaves.Petition_Field.hexadecimal_string_button_text = "Added"
		ST_Freight.leaves.Petition_Field.hexadecimal_string_can_add = "no"		
	}
	catch (anomaly) {
		console.error (anomaly);
		ST_Freight.leaves.Petition_Field.hexadecimal_string_problem = "That hexadecimal string could not be converted into an transaction petition bracket.";	
		ST_Freight.leaves.Petition_Field.hexadecimal_string_problem_verbose = anomaly.message		
		ST_Freight.leaves.Petition_Field.hexadecimal_string_button_text = "Add"
		ST_Freight.leaves.Petition_Field.hexadecimal_string_can_add = "yes"	
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
			
				bind:value={ ST_Freight.petition_kit_hexadecimal_string }
				
				rows="4" 
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
		
		<!--
		{#if freight.Unsigned_Transaction_Fields.hexadecimal.textarea_exception.length >= 1 }
			<aside class="alert variant-filled-error">
				<div class="alert-message">
					<p>{ freight.Unsigned_Transaction_Fields.hexadecimal.textarea_exception_summary }</p>
					<p>{ freight.Unsigned_Transaction_Fields.hexadecimal.textarea_exception }</p>
				</div>
			</aside>
		{/if}
		
		
		<div style="text-align: right; margin-top: 10px;">
			<button 
				monitor="add hexadecimal string"

				type="button" 

				disabled={ freight.Unsigned_Transaction_Fields.hexadecimal.hexadecimal_string_can_add != "Add" }
				on:click={ add_UT_hexadecimal_string }
				
				style="padding: 10px 60px"
				class="btn variant-filled"
			>{ freight.Unsigned_Transaction_Fields.hexadecimal.hexadecimal_string_button_text }</button>
		</div>
		-->
	</div>
	{/if}
</Leaf>


