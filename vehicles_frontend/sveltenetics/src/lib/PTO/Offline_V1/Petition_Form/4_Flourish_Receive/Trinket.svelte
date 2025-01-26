


<script>

////
//
import { onMount, onDestroy } from 'svelte'
import { RadioGroup, RadioItem } from '@skeletonlabs/skeleton';
//
//
import Barcode_Visual_2 from '$lib/trinkets/Barcode/Visual_2/Trinket.svelte'
import Code_Wall from '$lib/trinkets/Code_Wall/Trinket.svelte' 
import Slang from '$lib/trinkets/Slang/Trinket.svelte'
//
import Alert_Success from '$lib/trinkets/Alerts/Success.svelte'
import Alert_Problem from '$lib/trinkets/Alerts/Problem.svelte'
import Alert_Note from '$lib/trinkets/Alerts/Note.svelte'
//
import Petition_Truck from '$lib/PTO/Offline/Petition_Form/Truck/Ride.svelte'
//
//
import * as PT from './../Truck/index.js'
//
////
import Sound_Gem from '$lib/trinkets/Sound/Gem.svelte'
	

import Barcode_Camera from './Trinkets/Barcode_Camera.svelte'
import Hexadecimal_String_Field from './Trinkets/Hexadecimal.svelte'




let PT_Freight = false;
$:{
	let _PT_Freight = PT_Freight;
}
	
let elected_leaf = "Barcode";




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
	{#if typeof PT_Freight === "object"}
	<div
		style="
			max-width: 90%;
			margin: 0 auto;
			padding: 0.25cm 0;
			
			text-align: center;
		"
	>
		{#if PT_Freight.leaves.Flourish_Receive.alert_note.length >= 1 }
		<Alert_Note
			text={ PT_Freight.leaves.Flourish_Receive.alert_note }
			progress={{
				show: "yes"
			}}
		/>
		{/if}
		
		{#if PT_Freight.leaves.Flourish_Receive.alert_problem_1.length >= 1 }
		<Alert_Problem
			text={ PT_Freight.leaves.Flourish_Receive.alert_problem_1 }
			text_2={ PT_Freight.leaves.Flourish_Receive.alert_problem_2 }
			progress={{
				show: "yes"
			}}
		/>
		{/if}
		
		{#if PT_Freight.leaves.Flourish_Receive.alert_success.length >= 1 }
		<Alert_Success
			text={ PT_Freight.leaves.Flourish_Receive.alert_success }
		/>
		{/if}
	</div>

	<div
		style="
			text-align: center;
		"
	>
		<RadioGroup 
			rounded="rounded-container-token" 
		>				
			<RadioItem 
				bind:group={ elected_leaf } 
				name="justify" 
				value={ "Barcode" }
			>	
				<span monitor="barcode pad">Barcode</span>
			</RadioItem>
			<RadioItem 
				bind:group={ elected_leaf } 
				name="justify" 
				value={ "Hexadecimal" }
			>
				<span monitor="hexadecimal pad">Hexadecimal</span>
			</RadioItem>
		</RadioGroup>
	</div>
	
	<div style="height: 0.5cm" ></div>
	<hr class="!border-t-2" />
	<div style="height: 0.5cm" ></div>
	
	<div>
		{#if elected_leaf === "Barcode" }
		<Barcode_Camera />
		{:else if elected_leaf === "Hexadecimal" }
		<Hexadecimal_String_Field />
		{/if}
	</div>
	
	<div style="height: 200px"></div>



	{/if}
</div>