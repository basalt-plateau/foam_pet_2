


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
import { onMount, onDestroy } from 'svelte';
import { ConicGradient } from '@skeletonlabs/skeleton';
import { Accordion, AccordionItem } from '@skeletonlabs/skeleton';
import CircleAlert from 'lucide-svelte/icons/circle-alert'
//
//
import Code_Wall from '$lib/trinkets/Code_Wall/Trinket.svelte' 
import Slang from '$lib/trinkets/Slang/Trinket.svelte'
import Alert_Success from '$lib/trinkets/Alerts/Success.svelte'
import Alert_Info from '$lib/trinkets/Alerts/Info.svelte'
import Problem_Alert from '$lib/trinkets/Alerts/Problem.svelte'
//
//
import { ask_consensus_to_add_transaction } from './ask_consensus_to_add_transaction'
//
//\
//\\


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
		><Slang text="Transaction" /> Suggestion</header>
		
		<div style="height: 0.5cm"></div>
	</div>

	<div
		class="card p-4"
		style="
			text-align: center;
		"
	>
		<p
			style="
				font-size: 1.1em;
			"
		><Slang text="Petition" /> + <Slang text="Signature" /> + <Slang text="Consensus" /> approval = <Slang text="Blockchain" /> <Slang text="Transaction" /> </p>
	</div>

	<div style="height: 0.5cm"></div>

	<div
		class="card p-4"
		style="
			text-align: center;
		"
	>
		<div style="height: 1cm"></div>
	
		<p>
			<span style="display: block;">To Suggest the <Slang text="Petition" /> + <Slang text="Signature" /> to the <Slang text="Consensus" />,
			<span style="display: block;">press suggest:</span>
		</p>
	
		<div style="height: 1cm"></div>
	
		<button 
			monitor="suggestion pad"
			
			disabled={ asked === "yes" }
		
			on:click={ ask }
			type="button" 
			class="btn variant-filled-primary"
			style="
				white-space: preserve;
				word-wrap: break-word;
				
				width: 200px;
				height: 100px;
				
				background: linear-gradient(22deg, rgb(var(--color-surface-500)), rgb(var(--color-primary-500)), rgb(var(--color-success-300)));
				border: 0.1cm solid rgb(var(--color-tertiary-500));
				
				font-size: 2em;
			"
			
		>Suggest</button>
		
		<div style="height: 1cm"></div>		
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