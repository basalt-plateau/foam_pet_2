


<script>

/*
	requires:
*/

//
// @Invite @Suggest
//
//

////
///
//
// import { ask_commit } from './../Screenplays/ask_consensus_to_commit_transaction' 
//
//
import { ConicGradient } from '@skeletonlabs/skeleton';

import CircleAlert from 'lucide-svelte/icons/circle-alert'

import { ask_consensus_to_add_transaction } from './ask_consensus_to_add_transaction'
import Code_Wall from '$lib/trinkets/Code_Wall/Trinket.svelte' 

import { onMount, onDestroy } from 'svelte';
//
//\
//\\
import Slang from '$lib/trinkets/Slang/Trinket.svelte'
import { Accordion, AccordionItem } from '@skeletonlabs/skeleton';
import Alert_Success from '$lib/trinkets/Alerts/Success.svelte'
import Alert_Info from '$lib/trinkets/Alerts/Info.svelte'
import Problem_Alert from '$lib/trinkets/Alerts/Problem.svelte'
	

import { 
	retrieve_truck, 
	monitor_truck,
} from '$lib/Les_Talents/APT_Entrust_Mode_1/Friends_Panel/Logistics/Truck'

let prepared = "no"
let Truck_Monitor;
let freight;
onMount (async () => {
	const Truck = retrieve_truck ()
	freight = Truck.freight; 
	
	freight.current_land = "Ask_Consensus"
	
	Truck_Monitor = monitor_truck ((_freight) => {
		freight = _freight;
		console.log ("Transaction Fields: Truck_Monitor", { freight })
	})
	
	prepared = "yes"
});

onDestroy (() => {
	Truck_Monitor.stop ()
});


/*
let waiting_for_transaction_message = ""
let exception_message = ""
let success_message = ""
let transaction_object = ""
*/

let asked = "no"
const ask = () => {
	asked = "yes"
	ask_consensus_to_add_transaction ({ freight })
}




</script>

{#if prepared === "yes" }
<div monitor="suggestion leaf">
	<div style="height: 0.5cm"></div>

	<div
		style="
			text-align: center;
		"
	>
		<header
			style="
				text-align: center;
				font-size: 2em;
				padding: .2cm 0;
			"
		>Suggestion</header>
		
		<div style="height: 0.5cm"></div>
		
		<p
			style="
				font-size: 1.1em;
			"
		><Slang text="Petition" /> + <Slang text="Signature" /> + <Slang text="consensus" /> approval = A <Slang text="transaction" /> on the <Slang text="Blockchain" /></p>
	</div>

	<div style="height: 1cm"></div>

	<div
		style="
			text-align: center;
		"
	>
		<button 
			monitor="suggestion pad"
			
			disabled={ asked === "yes" }
		
			on:click={ ask }
			type="button" 
			class="btn variant-filled-primary"
			style="
				max-width: 15cm;
				white-space: preserve;
				word-wrap: break-word;
			"
			
		>	
			<p>Suggest the <Slang text="Petition" /> + <Slang text="Signature" /> to the <Slang text="Consensus" />.</p>
			
			<!-- <p>Suggest that the <Slang text="Consensus" /> make the <Slang text="Transaction" /> on the <Slang text="Blockchain" /> based on the <b>Petition</b> + <b>Signature</b>.</p> -->
		</button>
	</div>
	
	<div style="height: 1cm"></div>
	
	{#if freight.ask_consensus.exception_info.length >= 1 }
	<aside 
		style="
			margin: 12px auto;
			max-width: 500px;
			width: 100%;
		"
	>
		<Problem_Alert 
			text={ freight.ask_consensus.exception_info } 
		/>
	</aside>
	{/if}
	
	{#if freight.ask_consensus.show_alert_success === "yes"}
	<div 
		monitor="ask was successful"
		alert_success
		style="
			display: flex; 
			flex-direction: row; 
			margin: 20px 0; 
			justify-content: center;
		"
	>		
		<Alert_Success show="yes">
			<p>The <Slang text="consensus" /> added the <Slang text="transaction" /> to the <Slang text="blockchain" />.</p>
		</Alert_Success>
	</div>
	{/if}

	{#if freight.ask_consensus.waiting_info.length >= 1}
	<div 
		style="
			margin: 12px auto;
			max-width: 500px;
			width: 100%;
		"
	>
		<Alert_Info 
			text={ freight.ask_consensus.waiting_info }
			progress={{
				show: "yes"
			}}
		/>
	</div>
	{/if}
	
	{#if freight.ask_consensus.transaction_Aptos_object_fiberized.length >= 1}
	<hr class="!border-t-4" style="margin: 5px 0"/>

	<div class="card p-2">
		<Accordion>
			<AccordionItem open>
				<svelte:fragment slot="summary">
					<header
						style="
							text-align: center;
							font-size: 1em;
						"
					>The <Slang text="Transaction" /> on the <Slang text="Blockchain" /></header>
				</svelte:fragment>
				<svelte:fragment slot="content">
					<div full_transaction_on_blockchain>
						<Code_Wall
							text={ freight.ask_consensus.transaction_Aptos_object_fiberized }
						/>
					</div>
				</svelte:fragment>
			</AccordionItem>
		</Accordion>
	</div>
		
	{/if}
	
	
</div>
{/if}