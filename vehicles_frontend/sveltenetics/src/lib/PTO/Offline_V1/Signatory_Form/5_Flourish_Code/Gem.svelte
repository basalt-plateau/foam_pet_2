
<script>

import { RadioGroup, RadioItem } from '@skeletonlabs/skeleton';

import Slang from '$lib/trinkets/Slang/Trinket.svelte'
import Barcode_Visual_2 from '$lib/trinkets/Barcode/Visual_2/Trinket.svelte'
import Code_Wall from '$lib/trinkets/Code_Wall/Trinket.svelte' 

import Signatory_Truck from '$lib/PTO/Offline/Signatory_Form/Truck/Ride.svelte'
let ST_Freight = false

	
let leaf_elected = "Barcode"

</script>

<div>
	<Signatory_Truck on_change={ ({ pro_freight }) => { ST_Freight = pro_freight; } } />
	{#if typeof ST_Freight === "object"}
	<div
		style="
			text-align: center;
			padding: 0cm 0 .3cm;
		"
	>
		<p>
			<span>This <Slang text="signature" /> can be sent to the publicist.</span>			
		</p>
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
		<p
			style="
				padding: 0.5cm 0cm;
				text-align: center;
			"
		>
			<span>This <b>Barcode</b> can be scanned and signed by an <Slang text="Offline_Machine" />.</span> 
		</p>
		<Barcode_Visual_2
			hexadecimal_string={ ST_Freight.petition_signature_hexadecimal_string }
		/>
		{:else}
		<div monitor="hexadecimal">
			<Code_Wall 
				can_clone={ "yes" }
				text={ ST_Freight.petition_signature_hexadecimal_string } 
			/>
		</div>
		{/if}
	</div>
	
	<div style="height: 5cm"></div>
	
	{/if}
</div>