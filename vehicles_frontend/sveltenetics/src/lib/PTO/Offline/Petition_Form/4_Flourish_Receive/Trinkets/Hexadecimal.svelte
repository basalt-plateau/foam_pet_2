




<script>

//
import { onMount, onDestroy } from 'svelte';
import * as AptosSDK from "@aptos-labs/ts-sdk";
//
//
import Slang from '$lib/trinkets/Slang/Trinket.svelte'
//
//
import { verify_signature } from './verify_signature'
//


import * as PT from '$lib/PTO/Offline/Petition_Form/Truck/index.js'
import Petition_Truck from '$lib/PTO/Offline/Petition_Form/Truck/Ride.svelte'
let PT_Freight = false




let button_text = "Add"
let can_add = true;

let hexadecimal_string = ""


const add_Signature_hexadecimal_string = async () => {		
	// verify_signature ({ freight })
	
	// freight.transaction_signature.hexadecimal_land.added = "yes"
	button_text = "Added"
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
		
			bind:value={ hexadecimal_string }
			
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
