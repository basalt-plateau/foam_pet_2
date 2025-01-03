

<script>


/*
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



let RT_Prepared = "no"
let RT_Monitor;
$: RT_Freight = ""

let plays = {
	epoch: "",
	block_height: ""
}

$: got_consensus_info = "no"
const block_height_number = async () => {
	if (running !== "yes") {
		return;
	}
	
	const { 
		enhanced
	} = await ask_latest_block_number ({
		net_path: RT_Freight.net_path
	})
	plays = enhanced
	
	got_consensus_info = "yes"
	
	
	await new Promise ((resolve) => {
		setTimeout (() => {
			resolve ()
		}, 2000)
	})
	
	block_height_number ()
}

let latest = ""
let running = "no"
onMount (() => {
	const Truck = check_roomies_truck ()
	RT_Freight = Truck.freight; 
	
	RT_Monitor = monitor_roomies_truck ((_freight) => {
		RT_Freight = _freight;
	})
	
	RT_Prepared = "yes"
	running = "yes"
	block_height_number ()
})
onDestroy (() => {
	console.log ("on destroy")
	RT_Monitor.stop ()
	running = "no"
})

const conicStops = [
	{ color: 'transparent', start: 0, end: 25 },
	{ color: 'rgb(var(--color-primary-500))', start: 75, end: 100 }
];

</script>

<style>

@media (max-width: 600px) {
    #latest-block-panel {
		flex-direction: column !important;
	}
}

</style>

{#if RT_Prepared === "yes" && got_consensus_info === "yes" }
<Leaf>
	<Accordion>
		<AccordionItem>
			<svelte:fragment slot="summary">
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
					
					{#if RT_Freight.net_connected === "yes" }
					<div
						class="badge variant-soft-surface"
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
						<span>Connected to</span>
						<span class="badge variant-soft-surface">{ plays.chain_id }</span>
						<span class="badge variant-soft-surface">{ RT_Freight.net_name }</span>
						<span class="badge variant-soft-surface"
							style="
								white-space: pre-wrap;
							word-break: break-all;
							overflow-wrap: break-word;
							"
						>{ RT_Freight.net_path }</span>
						<span>at Epoch</span>
						<span class="badge variant-soft-surface">{ plays.epoch }</span>
					</div>
					{:else}
					disconnected from network
					{/if}
				</div>
			
			</svelte:fragment>
			<svelte:fragment slot="content">
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
						<span>Net Name</span>
						{#if got_consensus_info === "yes" }
						<span class="badge variant-soft-surface">{ RT_Freight.net_name }</span>
						{/if}
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
						<span>Chain ID</span>
						{#if got_consensus_info === "yes" }
						<span class="badge variant-soft-surface">{ plays.chain_id }</span>
						{/if}
					</span>
				</div>
				<div>		
					<span class="badge variant-soft"
						style="
							position: relative;
							font-size: 1.2em;
							
							display: flex;
							justify-content: center;
							flex-wrap: wrap;
						"
					>
						<span>Net Path</span>
						{#if got_consensus_info === "yes" }
						<span class="badge variant-soft-surface">{ RT_Freight.net_path }</span>
						{/if}
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
						{#if got_consensus_info === "yes" }
						<span class="badge variant-soft-surface">{ plays.epoch }</span>
						{/if}
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
						{#if got_consensus_info === "yes" }
						<span class="badge variant-soft-surface">{ 
							parse_with_commas (plays.block_height) 
						}</span>
						{/if}
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
						{#if got_consensus_info === "yes" }
						<span class="badge variant-soft-surface">{ 
							new Date (plays.ledger_timestamp / 1000).toUTCString () 
						}</span>
						{/if}
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
						{#if got_consensus_info === "yes" }
						<span class="badge variant-soft-surface">{ 
							parse_with_commas (plays.ledger_version)
						}</span>
						{/if}
					</span>
					
				</div>
			</svelte:fragment>
		</AccordionItem>
	</Accordion>
</Leaf>
{/if}