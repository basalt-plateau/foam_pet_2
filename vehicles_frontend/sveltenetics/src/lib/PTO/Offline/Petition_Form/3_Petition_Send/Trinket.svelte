


<script>

////
//
import { onMount, onDestroy } from 'svelte'
import { RadioGroup, RadioItem } from '@skeletonlabs/skeleton';
//
//
//
//
//
import * as PT from './../Truck/index.js'
//
////

import Barcode from './Trinkets/Barcode.svelte'
import Barcode_Visual_2 from '$lib/trinkets/Barcode/Visual_2/Trinket.svelte'
import Code_Wall from '$lib/trinkets/Code_Wall/Trinket.svelte' 
import Slang from '$lib/trinkets/Slang/Trinket.svelte'

import Petition_Truck from '$lib/PTO/Offline/Petition_Form/Truck/Ride.svelte'
let PT_Freight = false


let selected_option = "barcode"
	



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
			max-width: 400px;
			margin: 0 auto;
			text-align: center;
		"
	>
		<RadioGroup 
			rounded="rounded-container-token" 
		>				
			<RadioItem 
				bind:group={ selected_option } 
				name="justify" 
				value="barcode"
			>
				<span monitor="barcode">Barcode</span>
			</RadioItem>
			<RadioItem 
				bind:group={ selected_option } 
				name="justify" 
				value="hexadecimal"
			>
				<span monitor="hexadecimal">Hexadecimal</span>
			</RadioItem>
		</RadioGroup>
	</div>


	{#if selected_option === "barcode"}
	<div class="card p-4">
		<p
			style="
				padding: 0.5cm 0cm;
				text-align: center;
			"
		>
			<span>This <b>Barcode</b> can be scanned and signed by an <Slang text="Offline_Machine" />.</span> 
		</p>
	
		<Barcode_Visual_2
			hexadecimal_string={ PT_Freight.petition_envelope }
		/>
		
		<Barcode_Visual_2
			hexadecimal_string={ PT_Freight.petition_AO_hexadecimal_string }
		/>
	</div>
	{:else}
	<div class="card p-4">
		<div monitor="hexadecimal">
			<Code_Wall 
				can_clone={ "yes" }
				text={ PT_Freight.petition_envelope } 
			/>
		</div>
	</div>
	{/if}


	{/if}
</div>