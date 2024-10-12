







<script>

///
//
import { onMount, onDestroy } from 'svelte';
//
//\
import { Accordion, AccordionItem } from '@skeletonlabs/skeleton';
import Code_Wall from '$lib/trinkets/Code_Wall/Trinket.svelte' 
import Info_Alert from '$lib/trinkets/Alerts/Info.svelte'
import Slang from '$lib/trinkets/Slang/Trinket.svelte'

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
					<div>
						<p
							style="
								text-align: center;
							"
						>This is the <b>Petition</b> as a <b>Bracket</b>.</p>
					
						<div style="height: 0.5cm"></div>
						
						<div
							style="
								text-align: center;
							"
						>
							<p>For the purpose of showing the bracket,</p>
							<p>Each <b>Uint8Array</b> was adapted into a <b>hexadecimal</b>.</p>
							<p>Each <b>BigInt</b> was adapted into a <b>string</b>.</p>
						</div>
					
						<div style="height: 0.5cm"></div>
					
						<p
							style="
								text-align: center;
							"
						>
							<span>After making sure the <b>Petition</b> is good,<br/></span>
							<span>the <Slang text="Transaction" /> as a <b>Barcode</b> can be scanned from the next panel.</span>
						</p>
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
	
	<div monitor="petition as bracket">
		<Code_Wall 
			text={ freight.unsigned_transaction.Aptos_object_fiberized } 
		/>
	</div>
</div>
{/if}