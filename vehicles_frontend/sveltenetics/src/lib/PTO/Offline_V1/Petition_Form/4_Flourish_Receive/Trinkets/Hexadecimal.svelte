




<script>

//
import { onMount, onDestroy } from 'svelte';
import * as AptosSDK from "@aptos-labs/ts-sdk";
//
//
import Slang from '$lib/trinkets/Slang/Trinket.svelte'
import Petition_Truck from '$lib/PTO/Offline/Petition_Form/Truck/Ride.svelte'
//
//
import { verify_signature } from './verify_signature'
//

import { Uint8Array_from_string } from '$lib/taverns/hexadecimal/Uint8Array_from_string'
import { fiberize_signature } from '$lib/PTO/Offline/Signatory/fiberize'


import * as PT from '$lib/PTO/Offline/Petition_Form/Truck/index.js'
let PT_Freight = false



let button_text = "Add"
let can_add = true;

let hexadecimal_string = ""


const add_Signature_hexadecimal_string = async () => {		
	console.log ("add_Signature_hexadecimal_string");
	
	// freight.transaction_signature.hexadecimal_land.added = "yes"
	
	
	try {
		const signature_Aptos_object = AptosSDK.AccountAuthenticator.deserialize (
			new AptosSDK.Deserializer (
				Uint8Array_from_string (
					PT_Freight.signature_hexadecimal_string
				)
			)
		);
		PT_Freight.leaves.Flourish_Receive.signature_Aptos_object = signature_Aptos_object
		PT_Freight.leaves.Flourish_Receive.Aptos_object_fiberized = fiberize_signature (signature_Aptos_object)
		
		PT_Freight.leaves.Flourish_Receive.alert_success = "The signature was added successfully."
		PT_Freight.leaves.Flourish_Receive.alert_note = ""
		PT_Freight.leaves.Flourish_Receive.alert_problem_1 = ""
		PT_Freight.leaves.Flourish_Receive.alert_problem_2 = ""
		
		PT_Freight.sound_gem.playa ();
		
		button_text = "Added"
	}
	catch (anomaly) {
		console.error (anomaly);
		
		PT_Freight.leaves.Flourish_Receive.alert_success = ""
		PT_Freight.leaves.Flourish_Receive.alert_note = ""
		PT_Freight.leaves.Flourish_Receive.alert_problem_1 = "The signature was not added successfully."
		PT_Freight.leaves.Flourish_Receive.alert_problem_2 = anomaly.message;
	}
}


</script>


<div monitor="hexadecimal panel">
	<Petition_Truck on_change={ ({ pro_freight }) => { PT_Freight = pro_freight; } } />
	{#if typeof PT_Freight === "object"}
	

	<div style="padding: 5px 0 10px;">
		<header
			style="
				text-align: center;
				font-size: 1.4em;
				padding: .2cm 0;
			"
		><Slang text="Signature" /> Hexadecimal String</header>
		<p
			style="
				text-align: center;
			"
		>The <Slang text="signature" /> as a hexadecimal string can be pasted here.</p>
	</div>
	
	
	<label class="label">
		<textarea 
			monitor="hexadecimal string"
		
			bind:value={ PT_Freight.signature_hexadecimal_string }
			
			rows="4" 
			placeholder="" 
			
			style="padding: 10px"
			class="textarea" 
		/>
	</label>



	<div style="text-align: right; margin-top: 10px;">
		<button 
			monitor="add hexadecimal string"
		
			disabled={ button_text === "Added" }
			on:click={ add_Signature_hexadecimal_string }
			
			type="button" 
			
			style="padding: 10px 60px"
			class="btn variant-filled"
			
		>{ button_text }</button>
	</div>
	
	{/if}
</div>
