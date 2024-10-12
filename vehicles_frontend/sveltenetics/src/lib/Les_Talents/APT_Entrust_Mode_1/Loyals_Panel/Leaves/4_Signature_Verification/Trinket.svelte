






<script>

///
//
import AO from './Object/Trinket.svelte'
//
import { string_from_Uint8Array } from '$lib/taverns/hexadecimal/string_from_Uint8Array'
//
import { onMount, onDestroy } from 'svelte';
import { TabGroup, Tab, TabAnchor } from '@skeletonlabs/skeleton';
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
	
	freight.current_land = "Signature_Verification"
	
	Truck_Monitor = monitor_truck ((_freight) => {
		freight = _freight;
		// console.log ("Transaction Fields: Truck_Monitor", { freight })
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
	monitor="signature verfication leaf"
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
		>Signature Verification</header>
		<p>
			<span>This is the signature as a <b>bracket</b>.</span>
			<span>The next slide has a format that can be sent.</span>
		</p>
	</div>

	<div style="height: 0.5cm" ></div>
	<hr class="!border-t-2" />
	<div style="height: 0.5cm" ></div>
	
	<div>
		<AO />
	</div>
	
	<div
		style="height: 2cm"
	>
	</div>
</div>
{/if}