




<script>


/*
	Position

	.Scoreboard
	.Stats
	
	.Health
		.Monitor

	. Present
		. Now
		. Current
		. Story
		. Freshest
*/

////
//
import { onMount, onDestroy } from 'svelte'
import { ConicGradient } from '@skeletonlabs/skeleton';
import { Accordion, AccordionItem } from '@skeletonlabs/skeleton';
import _get from 'lodash/get'
//
//
import Panel from '$lib/trinkets/panel/trinket.svelte'
import Leaf from '$lib/trinkets/Layout/Leaf/Trinket.svelte'
import { parse_styles } from '$lib/trinkets/styles/parse.js';
import { ask_latest_block_number } from '$lib/PTO/Blocks/Latest'
import { parse_with_commas } from '$lib/taverns/numbers/parse_with_commas'
//	
import Progress_Wall from '$lib/trinkets/Progress/Wall/Trinket.svelte'
import Radial_Progress from '$lib/trinkets/Progress/Radial/Trinket.svelte'
//
import { check_roomies_truck, monitor_roomies_truck } from '$lib/Versies/Trucks'
//
////
import Versies_Truck from '$lib/Versies/Trucks.svelte'
let Versies_Freight = false
	
	
	
	


let RT_Prepared = "no"
let RT_Monitor;
$: RT_Freight = ""



let latest = ""
onMount (() => {
	const Truck = check_roomies_truck ()
	RT_Freight = Truck.freight; 
	
	RT_Monitor = monitor_roomies_truck ((_freight) => {
		RT_Freight = _freight;
	})
	
	RT_Prepared = "yes"
});
onDestroy (() => {
	RT_Monitor.stop ()
});


</script>

<style>

@media (max-width: 600px) {
    #latest-block-panel {
		flex-direction: column !important;
	}
}

</style>

{#if RT_Prepared === "yes" }
<Leaf>
	<Versies_Truck on_change={ ({ freight }) => { Versies_Freight = freight } } />
	{#if typeof Versies_Freight === "object"}
	<Accordion>
		<AccordionItem>
			<svelte:fragment slot="summary">
				<p>Dapp Network Status</p>
			
				<div
					style="
						position: relative;
						top: 0px;
						left: 0px;
						width: 100%;
						
						display: inline-flex;
						gap: 0.2cm;
						align-items: center;
						justify-content: center;
					"
				>
					<span class="badge variant-soft-surface">{ RT_Freight.wallet.net_name }</span>
					<span class="badge variant-soft-surface">{ RT_Freight.wallet.chain_id }</span>
					<span class="badge variant-soft-surface"
						style="
							white-space: pre-wrap;
							word-break: break-all;
							overflow-wrap: break-word;
						"
					>{ RT_Freight.wallet.net_path }</span>
				</div>
			
				<div
					style="
						position: relative;
						top: 0px;
						left: 0px;
						width: 100%;
						
						display: inline-flex;
						gap: 0.2cm;
						align-items: center;
						justify-content: center;
					"
				>		
					<Radial_Progress />
					
					{#if RT_Freight.consensus.connected === "yes" }
					<div
						style="
							margin: 0;
							padding: 0.15cm 0.25cm;
							border-radius: 0.25cm;
							
							white-space: pre-wrap;
							word-break: break-all;
							overflow-wrap: break-word;
							
							display: block;
						"
					>
						<span>Connected to Chain ID</span>
						<span class="badge variant-soft-surface">{ RT_Freight.consensus.status.chain_id }</span>
						
						<span>at Epoch</span>
						<span class="badge variant-soft-surface">{ RT_Freight.consensus.status.epoch }</span>
					</div>
					{:else}
					disconnected from network
					{/if}
				</div>
			
			</svelte:fragment>
			<svelte:fragment slot="content">
				{#if RT_Freight.consensus.connected === "yes" }
				<div
					style="
						display: grid;
						grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
						gap: 4px;
						width: 100%;
						margin: 4px 0;
					"
				>
					<span class="badge variant-soft"
						style="
							position: relative;
							font-size: 1.2em;
							
							display: flex;
							justify-content: center;
							flex-wrap: wrap;
						"
					>
						<span>Chain ID</span>
						<span class="badge variant-soft-surface">{ RT_Freight.consensus.status.chain_id }</span>
					</span>
				</div>
				
				<div style="height: 0.25cm" />
				
				<div
					style="
						display: grid;
						grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
						gap: 4px;
						width: 100%;
						margin: 4px 0;
					"
				>
					<span class="badge variant-soft"
						style="
							position: relative;
							font-size: 1.1em;
							
							display: flex;
							justify-content: center;
							flex-wrap: wrap;
						"
					>
						<span>Epoch</span>
						<span class="badge variant-soft-surface">{ RT_Freight.consensus.status.epoch }</span>
					</span>
				
					<span class="badge variant-soft"
						style="
							position: relative;
							font-size: 1.1em;
							
							display: flex;
							justify-content: center;
							flex-wrap: wrap;
						"
					>
						<span>Block Height</span>
						<span class="badge variant-soft-surface">{ 
							parse_with_commas ( RT_Freight.consensus.status.block_height) 
						}</span>
					</span>
				</div>	
				<div
					style="
						display: grid;
						grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
						gap: 4px;
						width: 100%;
						margin: 4px 0;
					"
				>
					<span class="badge variant-soft"
						style="
							position: relative;
							font-size: 1.2em;
							
							display: flex;
							justify-content: center;
							flex-wrap: wrap;
							
							//display: grid;
							//grid-template-columns: repeat(2, 1fr);
							//align-items: center;
						"
					>
						<span>Ledger Time</span>
						<span class="badge variant-soft-surface">{ RT_Freight.consensus.UTC_orbit }</span>
					</span>
					
					<span class="badge variant-soft"
						style="
							position: relative;
							font-size: 1.2em;
							
							display: flex;
							justify-content: center;
							flex-wrap: wrap;
						"
					>
						<span>Ledger Version</span>
						<span class="badge variant-soft-surface">{ 
							parse_with_commas (RT_Freight.consensus.status.ledger_version)
						}</span>
					</span>
				</div>
				{/if}
			</svelte:fragment>
		</AccordionItem>
	</Accordion>
	{/if}
</Leaf>
{/if}