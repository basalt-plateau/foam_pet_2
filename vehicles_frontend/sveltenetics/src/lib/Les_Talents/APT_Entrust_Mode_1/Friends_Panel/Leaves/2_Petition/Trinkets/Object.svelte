







<script>

///
//
import { onMount, onDestroy } from 'svelte';
//
//\
import { Accordion, AccordionItem } from '@skeletonlabs/skeleton';
import Code_Wall from '$lib/trinkets/Code_Wall/Trinket.svelte' 
import Info_Alert from '$lib/trinkets/Alerts/Info.svelte'


import { 
	refresh_truck, 
	 retrieve_truck, 
	 monitor_truck 
} from '$lib/Les_Talents/APT_Entrust_Mode_1/Friends_Panel/Logistics/Truck'


let barcode_element = ""

let prepared = "no"
let Truck_Monitor;
let freight;
onMount (() => {
	const Truck = retrieve_truck ()
	freight = Truck.freight; 
	Truck_Monitor = monitor_truck ((_freight) => { freight = _freight; })
	prepared = "yes"
});

onDestroy (() => {
	Truck_Monitor.stop ()
});




</script>

{#if prepared === "yes"}
<div>
	<div class="card p-1">
		<Accordion>
			<AccordionItem>
				<svelte:fragment slot="summary">
					<header
						style="
							text-align: center;
							font-size: 1em;
							font-weight: bold;
						"
					>Details</header>
				</svelte:fragment>
				<svelte:fragment slot="content">
					<div
						style="
							text-align: center;
						"
					>
						<p>This is the petition as an Object.</p>
						<div style="height: 8px"></div>
						<p>For the purpose of showing the object,</p>
						<p>Each <b>Uint8Array</b> was adapted into a <b>hexadecimal</b>.</p>
						<p>Each <b>BigInt</b> was adapted into a <b>string</b>.</p>
						<div style="height: 8px"></div>
						<p>Those conversions were not applied to the Hexadecimal or Barcode.</p>
					</div>
				</svelte:fragment>
			</AccordionItem>
		</Accordion>
	</div>
	
	{#if freight.unsigned_transaction.alerts_info.length >= 1 }
	{#each freight.unsigned_transaction.alerts_info as alert_info }
	<Info_Alert 
		text={ alert_info.text }
	/>
	<div style="height: 0.1cm"></div>
	{/each}
	{/if}
	
	<div unsigned_transaction_fiberized>
		<Code_Wall 
			text={ freight.unsigned_transaction.Aptos_object_fiberized } 
		/>
	</div>
</div>
{/if}