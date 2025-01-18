




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
import Extension_Winch_Ride from '$lib/Singles/Extension_Winch/Ride.svelte'

let Extension_Winch_Freight = false
let Versies_Freight = false

import Dapp_Network_Frontier from "$lib/Les_Talents/Dapp_Network/Frontier/Tome.svelte"


</script>


<Leaf>
	<Versies_Truck on_change={ ({ freight }) => { Versies_Freight = freight } } />
	{#if typeof Versies_Freight === "object" }
	<Accordion>
		<AccordionItem>
			<svelte:fragment slot="summary">
				<p
					style="text-align: center"
				>Dapp Network Status</p>
				
				<hr />
			
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
					
					{#if Versies_Freight.dapp_network.connected === "yes" }
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
						<span>Connected to</span>
						<span class="badge variant-soft-surface">{ Versies_Freight.dapp_network.status.chain_id }</span>
						<span class="badge variant-soft-surface"
							style="
								white-space: pre-wrap;
								word-break: break-all;
								overflow-wrap: break-word;
							"
						>{ Versies_Freight.dapp_network.net_path }</span>
					</div>
					{:else}
					disconnected from network
					{/if}
				</div>
			</svelte:fragment>
			<svelte:fragment slot="content">
				{#if Versies_Freight.dapp_network.connected === "yes" }
				
				
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
						<span class="badge variant-soft-surface">{ Versies_Freight.dapp_network.status.chain_id }</span>
					</span>
				</div>
				
				<div style="height: 0.1cm; margin: 0;" />
				
				<div
					style="
						display: grid;
						grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
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
						<span class="badge variant-soft-surface">{ Versies_Freight.dapp_network.status.epoch }</span>
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
							parse_with_commas ( Versies_Freight.dapp_network.status.block_height) 
						}</span>
					</span>
					
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
						<span class="badge variant-soft-surface">{ Versies_Freight.dapp_network.UTC_orbit }</span>
					</span>
					
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
						<span>Ledger Version</span>
						<span class="badge variant-soft-surface">{ Versies_Freight.dapp_network.status.ledger_version }</span>
					</span>
				</div>	
				
				{#if Versies_Freight.mode  === "nurture" }
				<Dapp_Network_Frontier />
				{/if}
				
				{/if}
			</svelte:fragment>
		</AccordionItem>
	</Accordion>
	{/if}
</Leaf>
