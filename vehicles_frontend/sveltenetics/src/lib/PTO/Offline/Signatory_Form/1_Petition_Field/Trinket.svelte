
<script>

import { RadioGroup, RadioItem } from '@skeletonlabs/skeleton';

import Slang from '$lib/trinkets/Slang/Trinket.svelte'
import Alert_Success from '$lib/trinkets/Alerts/Success.svelte'
import Alert_Problem from '$lib/trinkets/Alerts/Problem.svelte'
import Alert_Note from '$lib/trinkets/Alerts/Note.svelte'

import Barcode_Eye from './Trinkets/Barcode_Eye.svelte'
import Hexadecimal_String_Field from './Trinkets/Hexadecimal_String_Field.svelte'

import Signatory_Truck from '$lib/PTO/Offline/Signatory_Form/Truck/Ride.svelte'
let ST_Freight = false


const add_hexadecimal_string_petition = ({ hexadecimal_string }) => {
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


let leaf_elected = "Barcode"

</script>

<div class="p-1">
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
		{#if ST_Freight.leaves.Petition_Field.alert_note.length >= 1 }
		<Alert_Note
			text={ ST_Freight.leaves.Petition_Field.alert_note }
			progress={{
				show: "yes"
			}}
		/>
		{/if}
		
		{#if ST_Freight.leaves.Petition_Field.alert_problem_1.length >= 1 }
		<Alert_Problem
			text={ ST_Freight.leaves.Petition_Field.alert_problem_1 }
			text_2={ ST_Freight.leaves.Petition_Field.alert_problem_2 }
			progress={{
				show: "yes"
			}}
		/>
		{/if}
		
		{#if ST_Freight.leaves.Petition_Field.alert_success.length >= 1 }
		<Alert_Success
			text={ ST_Freight.leaves.Petition_Field.alert_success }
		/>
		{/if}
	</div>

	<div
		style="
			max-width: 400px;
			margin: 0 auto;
			padding: 0.25cm 0;
			
			text-align: center;
		"
	>
		<RadioGroup 
			rounded="rounded-container-token" 
			_flexDirection="flex-col"
		>				
			<RadioItem 
				bind:group={ leaf_elected } 
				name="justify" 
				value="Barcode"
			>
				<span monitor="show barcode">Barcode</span>
			</RadioItem>
			<RadioItem 
				bind:group={ leaf_elected } 
				name="justify" 
				value="Hexadecimal"
			>
				<span monitor="show hexadecimal">Hexadecimal</span>
			</RadioItem>
		</RadioGroup>
	</div>

	

	<div class="card p-2">
		{#if leaf_elected === "Barcode" }
		<Barcode_Eye />
		{:else}
		<Hexadecimal_String_Field 
			add_hexadecimal_string_petition={ add_hexadecimal_string_petition }
		/>
		{/if}
	</div>
	
	{/if}
</div>


