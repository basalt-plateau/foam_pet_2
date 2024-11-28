


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
import Petition_Truck from '$lib/PTO/Offline/Petition_Form/Truck/Ride.svelte'
//
//
import * as PT from './../Truck/index.js'
//
////


import Barcode_Camera from './Trinkets/Barcode_Camera.svelte'
import Hexadecimal_String_Field from './Trinkets/Hexadecimal.svelte'


let PT_Freight = false
	
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