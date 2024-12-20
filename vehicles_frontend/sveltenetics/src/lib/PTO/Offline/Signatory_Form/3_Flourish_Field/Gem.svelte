
<script>

import { SlideToggle } from '@skeletonlabs/skeleton';

import Alert_Success from '$lib/trinkets/Alerts/Success.svelte'
import Alert_Problem from '$lib/trinkets/Alerts/Problem.svelte'
import Alert_Note from '$lib/trinkets/Alerts/Note.svelte'

import Signatory_Truck from '$lib/PTO/Offline/Signatory_Form/Truck/Ride.svelte'
let ST_Freight = false

import Slang from '$lib/trinkets/Slang/Trinket.svelte'
import { sign_petition } from '$lib/PTO/Offline/Signatory/sign'



	

const refresh = async () => {
	ST_Freight.leaves.Flourish_Field.alert_note = "waiting for signature";
	ST_Freight.leaves.Flourish_Field.alert_problem_1 = ""
	ST_Freight.leaves.Flourish_Field.alert_problem_2 = ""	
	ST_Freight.leaves.Flourish_Field.alert_success = ""
	
	ST_Freight.leaves.Flourish_Field.sign_button_text = "Sign"
	ST_Freight.leaves.Flourish_Field.sign_button_can_sign = "yes"
}

const sign_the_petition = async () => {
	console.info ("sign_the_petition", {
		petition_aptos_object: ST_Freight.petition_aptos_object
	});
	
	try {
		const {
			petition_signature_aptos_object,
			petition_signature_fiberized,
			petition_signature_hexadecimal_string
		} = await sign_petition ({
			petition_aptos_object: ST_Freight.petition_aptos_object,
			petition_hexadecimal_string: ST_Freight.petition_hexadecimal_string,
			private_key_hexadecimal_string: ST_Freight.leaves.Flourish_Field.private_key_hexadecimal_string,
			address_is_legacy: ST_Freight.leaves.Flourish_Field.address_is_legacy
		});


		ST_Freight.petition_signature_fiberized = petition_signature_fiberized;
		ST_Freight.petition_signature_aptos_object = petition_signature_aptos_object;
		ST_Freight.petition_signature_hexadecimal_string = petition_signature_hexadecimal_string;
		
		ST_Freight.leaves.Flourish_Field.sign_button_can_sign = "no"
		
		ST_Freight.leaves.Flourish_Field.alert_success = "The signature has been created successfully."		
		ST_Freight.leaves.Flourish_Field.alert_note = ""	
		ST_Freight.leaves.Flourish_Field.alert_problem_1 = ""
		ST_Freight.leaves.Flourish_Field.alert_problem_2 = ""
	}
	catch (anomaly) {
		console.error (anomaly);
		
		ST_Freight.leaves.Flourish_Field.alert_success = ""		
		ST_Freight.leaves.Flourish_Field.alert_note = ""	
		ST_Freight.leaves.Flourish_Field.alert_problem_1 = anomaly.message
		ST_Freight.leaves.Flourish_Field.alert_problem_2 = ""
	}
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
	<div
		style="
			max-width: 90%;
			margin: 0 auto;
			padding: 0.25cm 0;
			
			text-align: center;
		"
	>
		{#if ST_Freight.leaves.Flourish_Field.alert_note.length >= 1 }
		<Alert_Note
			text={ ST_Freight.leaves.Flourish_Field.alert_note }
			progress={{
				show: "yes"
			}}
		/>
		{/if}
		
		{#if ST_Freight.leaves.Flourish_Field.alert_problem_1.length >= 1 }
		<Alert_Problem
			text={ ST_Freight.leaves.Flourish_Field.alert_problem_1 }
			text_2={ ST_Freight.leaves.Flourish_Field.alert_problem_2 }
			progress={{
				show: "yes"
			}}
		/>
		{/if}
		
		{#if ST_Freight.leaves.Flourish_Field.alert_success.length >= 1 }
		<Alert_Success
			text={ ST_Freight.leaves.Flourish_Field.alert_success }
		/>
		{/if}
	</div>
	
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
		
			bind:value={ ST_Freight.leaves.Flourish_Field.private_key_hexadecimal_string }
			on:keyup={ refresh }
			
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
					bind:checked={ ST_Freight.leaves.Flourish_Field.address_is_legacy } 
					on:change={ refresh }
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