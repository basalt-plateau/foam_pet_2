

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
////

import Extension_Winch_Ride from '$lib/Singles/Extension_Winch/Ride.svelte'
let EWF = false



</script>



<Leaf>
	<Extension_Winch_Ride on_change={ ({ pro_freight }) => { EWF = pro_freight; } } />
	{#if typeof EWF === "object"}
	<Accordion>
		<AccordionItem open>
			<svelte:fragment slot="summary">
				<p
					style="
						text-align: center;
					"
				>Wallet Network Status</p>
				<hr />
				
				{#if EWF.stage_name_connected.length >= 1 }
				
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
					
					{#if EWF.stage_name_connected.length >= 1 }
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
						<span class="badge variant-soft-surface">{ _get (EWF, [ "stage", "network", "chain_id" ], "") }</span>
						<span class="badge variant-soft-surface"
							style="
								white-space: pre-wrap;
								word-break: break-all;
								overflow-wrap: break-word;
							"
						>{ _get (EWF, [ "stage", "network", "address" ], "") }</span>
					</div>
					{:else}
					<p
						style="
							text-align: center;
						"
					><span class="badge variant-soft-surface">A wallet is not connected.</span></p>
					{/if}
				</div>
				{:else}
				<p
					style="
						text-align: center;
					"
				><span class="badge variant-soft-surface">A wallet is not connected.</span></p>
				{/if}
			</svelte:fragment>
			<svelte:fragment slot="content">
				{#if EWF.stage_name_connected.length >= 1 }
				<div
					style="
						display: grid;
						grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
						gap: 4px;
						width: 100%;
						margin: 4px 0;
					"
				>
					<span 
						style="
							position: relative;
							font-size: 1.1em;
							
							display: flex;
							justify-content: center;
							flex-wrap: wrap;
						"
						class="badge variant-soft"
					>
						<span>Chain ID</span>
						<span class="badge variant-soft-surface">{ _get (EWF, [ "network_status", "status", "chain_id" ], "") }</span>
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
						<span class="badge variant-soft-surface">{ _get (EWF, [ "network_status", "status", "epoch" ], "") }</span>
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
						<span class="badge variant-soft-surface">{ _get (EWF, [ "network_status", "status", "block_height" ], "") }</span>
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
						<span class="badge variant-soft-surface">{ _get (EWF, [ "network_status", "UTC_orbit" ], "") }</span>
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
						<span class="badge variant-soft-surface">{ _get (EWF, [ "network_status", "status", "ledger_version" ], "") }</span>
					</span>
				</div>
				{/if}
			</svelte:fragment>
		</AccordionItem>
	</Accordion>
	{/if}
</Leaf>
