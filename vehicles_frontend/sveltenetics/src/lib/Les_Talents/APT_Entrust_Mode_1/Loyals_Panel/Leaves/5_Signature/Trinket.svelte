




<script>

///
//
import Barcode from './Barcode/Trinket.svelte'
import Hexadecimal from './Hexadecimal/Trinket.svelte'
//
import { string_from_Uint8Array } from '$lib/taverns/hexadecimal/string_from_Uint8Array'
//
import { onMount, onDestroy } from 'svelte';
import { TabGroup, Tab, TabAnchor } from '@skeletonlabs/skeleton';
import { RadioGroup, RadioItem } from '@skeletonlabs/skeleton';
//
//\


import { 
	retrieve_truck, 
	monitor_truck,
} from '$lib/Les_Talents/APT_Entrust_Mode_1/Loyals_Panel/Logistics/Truck'
let prepared = "no"
let Truck_Monitor;
let freight;
onMount (async () => {
	const Truck = retrieve_truck ()
	freight = Truck.freight; 
	
	freight.current_land = "Transaction_Signature"
	
	Truck_Monitor = monitor_truck ((_freight) => {
		freight = _freight;
		console.log ("Transaction Fields: Truck_Monitor", { freight })
	})
	
	prepared = "yes"
});
onDestroy (() => {
	Truck_Monitor.stop ()
});



let selected_option = "barcode"

</script>





{#if prepared === "yes" }
<div 
	monitor="signature leaf"
	style="
		height: 100%; 
		overflow: scroll;
		padding: 0cm;
	"
>
	<div
		style="
			text-align: center;
			padding: 0cm 0 .3cm;
		"
	>
		<header
			style="
				text-align: center;
				font-size: 2em;
				padding: .3cm 0;
			"
		>Signature</header>
		<p>
			<span>The barcode (or hexadecimal string) signature can be sent to the friends modal.</span>			
		</p>
	</div>
	
	
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
				bind:group={selected_option} 
				name="justify" 
				value="barcode"
			>
				<span monitor="barcode pad">Barcode</span>
			</RadioItem>
			<RadioItem 
				bind:group={selected_option} 
				name="justify" 
				value="hexadecimal"
			>
				<span monitor="hexadecimal pad">Hexadecimal</span>
			</RadioItem>
		</RadioGroup>
	</div>
		
	<div style="height: 0.5cm" ></div>
	<hr class="!border-t-2" />
	<div style="height: 0.5cm" ></div>
	
	<div>
		{#if selected_option === "barcode" }
			<Barcode />
		{:else if selected_option === "hexadecimal" }
			<Hexadecimal />
		{/if}
	</div>

	
	<div
		style="height: 200px"
	>
	</div>
</div>
{/if}