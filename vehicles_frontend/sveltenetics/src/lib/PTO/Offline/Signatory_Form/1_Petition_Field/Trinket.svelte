
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
		<Hexadecimal_String_Field />
		{/if}
	</div>
	
	{/if}
</div>


