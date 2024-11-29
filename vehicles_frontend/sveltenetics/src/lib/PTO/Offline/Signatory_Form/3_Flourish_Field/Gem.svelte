
<script>

import { SlideToggle } from '@skeletonlabs/skeleton';

import Signatory_Truck from '$lib/PTO/Offline/Signatory_Form/Truck/Ride.svelte'
let ST_Freight = false

import Slang from '$lib/trinkets/Slang/Trinket.svelte'
import { sign_petition } from '$lib/PTO/Offline/Signatory/sign'

	
	
let private_key_hexadecimal_string = ""
let address_is_legacy = false

const sign_the_petition = async () => {
	console.info ("sign_the_petition", {
		petition_aptos_object: ST_Freight.petition_aptos_object,
		private_key_hexadecimal_string,
	});
	
	const {
		petition_signature_aptos_object,
		petition_signature_fiberized,
		petition_signature_hexadecimal_string
	} = await sign_petition ({
		petition_aptos_object: ST_Freight.petition_aptos_object,
		petition_hexadecimal_string: ST_Freight.petition_hexadecimal_string,
		
		private_key_hexadecimal_string,
		
		address_is_legacy: false
	});

	console.log ({ petition_signature_aptos_object });

	ST_Freight.petition_signature_fiberized = petition_signature_fiberized;
	ST_Freight.petition_signature_aptos_object = petition_signature_aptos_object;
	ST_Freight.petition_signature_hexadecimal_string = petition_signature_hexadecimal_string;
}

	

</script>

<div
	style="
		text-align: center;
		padding: 0.25cm;
	"
>
	<Signatory_Truck on_change={ ({ pro_freight }) => { ST_Freight = pro_freight; } } />
	
	{#if typeof ST_Freight === "object"}
	<header
		style="
			text-align: center;
			font-size: 2em;
			padding: 1cm 0;
		"
	><Slang text="Signature" /> Field</header>
	<p>The "Sign" button creates a <Slang text="signature" /> from the <Slang text="petition" /> with the <Slang text="private key" />.</p>
	
	<div style="height: 0.2cm"></div>
	
	<div 
		style="
			text-align: center;
		"
		class="card p-4"
	>
		<span style="font-size: 1.5em;"><Slang text="Private Key" /></span>
		<div style="height: 0.1cm"></div>
		<input 
			monitor="private key"
		
			bind:value={ private_key_hexadecimal_string }
			
			class="textarea"
			style="min-height: 50px; padding: 10px"
			
			type="password" 
			placeholder=""
		/>
	</div>

	<div style="height: 0.25cm"></div>


	<div class="card p-4">
		<span style="font-size: 1.5em;"><Slang text="Address" /> is Legacy</span>
		<div
			style="
				display: flex;
				justify-content: center;
				align-items: center;
				padding-top: 0.2cm;
			"
		>
			<span
				style="
					padding: 0 10px;
				"
			>No</span>
			<div
				monitor="address is legacy lot"
				style="inline-flex"
			>
				<SlideToggle 
					name="slide" 
					bind:checked={ address_is_legacy } 
				/>
			</div>
			<span
				style="
					padding: 0 10px;
				"
			>Yes</span>
		</div>
	</div>

	<div style="height: 0.5cm"></div>

	<div
		style="text-align: right; display: inline-block;"
	>
		<button 
			monitor="sign"
		
			on:click={ sign_the_petition }
			disabled={ ST_Freight.leaves.Flourish_Field.sign_button_can_sign != "yes" }

			type="button"
			
			style="padding-right: 64px; padding-left: 64px;"
			class="btn variant-filled"
			
		>{ ST_Freight.leaves.Flourish_Field.sign_button_text }</button>
	</div>
	
	<div style="height: 5cm"></div>
	
	{/if}
</div>