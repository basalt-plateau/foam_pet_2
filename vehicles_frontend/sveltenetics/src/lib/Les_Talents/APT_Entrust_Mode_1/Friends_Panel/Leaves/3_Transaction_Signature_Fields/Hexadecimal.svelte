




<script>

//
import { verify_signature } from './verify_signature'
//
//
import { onMount, onDestroy } from 'svelte';
import * as AptosSDK from "@aptos-labs/ts-sdk";
//


let button_text = "Add"
let can_add = true;

import { 
	refresh_truck, 
	retrieve_truck, 
	monitor_truck 
} from '$lib/Les_Talents/APT_Entrust_Mode_1/Friends_Panel/Logistics/Truck'
let prepared = "no"
let Truck_Monitor;
let freight;
onMount (async () => {
	const Truck = retrieve_truck ()
	freight = Truck.freight; 
	
	if (freight.transaction_signature.hexadecimal_string.length >= 1) {
		button_text = "Added"
		can_add = false;
	}
	
	prepared = "yes"
});
onDestroy (() => {
	
});


const add_Signature_hexadecimal_string = async () => {		
	verify_signature ({ freight })
	
	freight.transaction_signature.hexadecimal_land.added = "yes"
	button_text = "Added"
}


</script>


{#if prepared === "yes"}
<div monitor="hexadecimal panel">
	<div style="padding: 5px 0 10px;">
		<header
			style="
				text-align: center;
				font-size: 1.4em;
				padding: .2cm 0;
			"
		>
		Signature Hexadecimal String</header>
		<p
			style="
				text-align: center;
			"
		>The hexadecimal string of the signature can be pasted here.</p>
	</div>
	
	<label class="label">
		<textarea 
			monitor="hexadecimal string"
		
			bind:value={ freight.transaction_signature.hexadecimal_string }
			
			rows="4" 
			placeholder="" 
			
			style="padding: 10px"
			class="textarea" 
		/>
	</label>
			
	<div style="text-align: right; margin-top: 10px;">
		<button 
			monitor="add hexadecimal string"
		
			disabled={ freight.transaction_signature.hexadecimal_land.added === "yes" }
			on:click={ add_Signature_hexadecimal_string }
			
			type="button" 
			
			style="padding: 10px 60px"
			class="btn variant-filled"
			
		>{ button_text }</button>
	</div>
</div>
{/if}