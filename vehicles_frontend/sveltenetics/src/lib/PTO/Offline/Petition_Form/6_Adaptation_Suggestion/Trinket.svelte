
<script>

import * as AptosSDK from "@aptos-labs/ts-sdk"

import { Accordion, AccordionItem } from '@skeletonlabs/skeleton';

import Slang from '$lib/trinkets/Slang/Trinket.svelte'
import Code_Wall from '$lib/trinkets/Code_Wall/Trinket.svelte' 
//
import Alert_Success from '$lib/trinkets/Alerts/Success.svelte'
import Alert_Problem from '$lib/trinkets/Alerts/Problem.svelte'
import Alert_Note from '$lib/trinkets/Alerts/Note.svelte'
//

import { Uint8Array_from_string } from '$lib/taverns/hexadecimal/Uint8Array_from_string'

import Petition_Truck from '$lib/PTO/Offline/Petition_Form/Truck/Ride.svelte'
let PT_Freight = false


let asked = ""



//
import { find_transaction_by_hash } from '$lib/PTO/Transaction/find_by_hash'
//
//
//



export const hexadecimal_petition_to_Aptos_Object = (petition_hexadecimal_string) => {
	return AptosSDK.SimpleTransaction.deserialize (
		new AptosSDK.Deserializer (
			Uint8Array_from_string (petition_hexadecimal_string)
		)
	);
}

export const hexadecimal_Signature_to_Aptos_Object = (signature_hexadecimal_string) => {
	return AptosSDK.AccountAuthenticator.deserialize (
		new AptosSDK.Deserializer (
			Uint8Array_from_string (signature_hexadecimal_string)
		)
	)
}	
	


/*
	* suggest enhancement
	* wait for enhancement
	* search for the enhancement
*/
export const suggest = async () => {
	console.log ("suggest");
	
	try {
		PT_Freight.leaves.Adaptation_Suggestion.alert_note = ""
		PT_Freight.leaves.Adaptation_Suggestion.alert_success = ""
		PT_Freight.leaves.Adaptation_Suggestion.alert_problem_1 = ""
		PT_Freight.leaves.Adaptation_Suggestion.alert_problem_2 = ""
		
		
		const petition_Aptos_Object = hexadecimal_petition_to_Aptos_Object (
			PT_Freight.petition_AO_hexadecimal_string
		)
		const signature_Aptos_Object = hexadecimal_Signature_to_Aptos_Object (
			PT_Freight.signature_hexadecimal_string
		)
		
		PT_Freight.leaves.Adaptation_Suggestion.alert_note = "waiting for transaction"
		
		const aptos = new AptosSDK.Aptos (new AptosSDK.AptosConfig ({		
			fullnode: PT_Freight.net_path,
			network: AptosSDK.Network.CUSTOM
		}));
		
		
		console.info ({
			petition_Aptos_Object,
			signature_Aptos_Object
		});
		
		//
		//
		//		Suggest Enhancement
		//
		//
		const adaptation = await aptos.transaction.submit.simple ({ 
			transaction: petition_Aptos_Object, 
			senderAuthenticator: signature_Aptos_Object
		});
		PT_Freight.leaves.Adaptation_Suggestion.adaptation_hash = adaptation.hash;
		
		
		console.log ('waiting for transaction', { adaptation })


		//
		//
		//		Wait
		//
		//
		await aptos.waitForTransaction ({ 
			transactionHash: adaptation.hash 
		});
		console.log ('Perhaps the adaptation was added.')


		//
		//
		//		Adaptation Search
		//
		//
		const { enhanced, transaction_fiberized } = await find_transaction_by_hash ({
			net_path: PT_Freight.net_path,
			transaction_hash: adaptation.hash
		})
		PT_Freight.leaves.Adaptation_Suggestion.adaptation_fiberized = transaction_fiberized;
		
		
		
		
		if (enhanced.success === true) {
			PT_Freight.leaves.Adaptation_Suggestion.alert_note = ""
			PT_Freight.leaves.Adaptation_Suggestion.alert_success = "The consensus added the transaction to the blockchain."
			PT_Freight.leaves.Adaptation_Suggestion.alert_problem_1 = ""
			PT_Freight.leaves.Adaptation_Suggestion.alert_problem_2 = ""
		}
		else {
			throw new Error (`Transaction "${ adaptation.hash }" could not be could found.`)
		}
	}
	catch (anomaly) {
		console.error (anomaly)
		
		PT_Freight.leaves.Adaptation_Suggestion.alert_note = ""
		PT_Freight.leaves.Adaptation_Suggestion.alert_success = ""
		PT_Freight.leaves.Adaptation_Suggestion.alert_problem_1 = "The transaction was not added to the blockchain."
		PT_Freight.leaves.Adaptation_Suggestion.alert_problem_2 = anomaly.message;
	}
}



</script>

<div
	style="
		display: flex;
		gap: 0.1cm;
		
		flex-direction: column;
		
		padding: 0.25cm;
	"
>
	<Petition_Truck on_change={ ({ pro_freight }) => { PT_Freight = pro_freight; } } />
	{#if typeof PT_Freight === "object"}


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
	
	

	<div class="card">
		<Accordion>
			<AccordionItem>
				<svelte:fragment slot="summary">
					<div 
						style="
							text-align: center;
						"
						class="card p-2 variant-filled-primary"
					>Hints</div>
				</svelte:fragment>
				<svelte:fragment slot="content">
					<div
						class="p-4"
						style="
							text-align: center;
						"
					>
						<p
							style="
								font-size: 1.1em;
							"
						><Slang text="Petition" /> + <Slang text="Signature" /> + <Slang text="Consensus" /> approval = <Slang text="Transaction" /> to <Slang text="Blockchain" /></p>
					</div>
				</svelte:fragment>
			</AccordionItem>
		</Accordion>
	</div>
	
	
	<div class="card">
		<Accordion>
			<AccordionItem>
				<svelte:fragment slot="summary">
					<div 
						style="
							text-align: center;
						"
						class="card p-2 variant-filled-primary"
					>
						<Slang text="Signature" />
					</div>
				</svelte:fragment>
				<svelte:fragment slot="content">
					<div class="card p-1 variant-filled-surface">
						<Code_Wall text={ PT_Freight.leaves.Flourish_Receive.Aptos_object_fiberized  } />
					</div>
				</svelte:fragment>
			</AccordionItem>
		</Accordion>
	</div>
	
	<div class="card">
		<Accordion>
			<AccordionItem>
				<svelte:fragment slot="summary">
					<div 
						style="
							text-align: center;
						"
						class="card p-2 variant-filled-primary"
					>
						<Slang text="Transaction_Petition" />
					</div>
				</svelte:fragment>
				<svelte:fragment slot="content">
					<div class="card p-1 variant-filled-surface">
						<Code_Wall text={ PT_Freight.petition_AO_fiberized  } />
					</div>
				</svelte:fragment>
			</AccordionItem>
		</Accordion>
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
			<span style="display: block;">To Suggest the <Slang text="Petition" /> with <Slang text="Signature" /> to the <Slang text="Consensus" />,
			<span style="display: block;">press <b>Suggest</b>.</span>
		</p>
	
		<div style="height: 1cm"></div>
	
		<button 
			monitor="suggestion pad"
			
			on:click={ suggest }
			disabled={ asked === "yes" }
		
			
			type="button" 
			class="btn variant-filled-primary"
			style="
				white-space: preserve;
				word-wrap: break-word;
				
				_width: 200px;
				_border: 0.25cm solid rgb(var(--color-tertiary-500));
				
				padding: 0.5cm 1.5cm;
				
				font-size: 1.5em;
			"
			
		>Suggest</button>
		
		<div style="height: 1cm"></div>		
	</div>
	
	<div
		style="
			max-width: 90%;
			margin: 0 auto;
			padding: 0.25cm 0;
			
			text-align: center;
		"
	>
		{#if PT_Freight.leaves.Adaptation_Suggestion.alert_note.length >= 1 }
		<Alert_Note
			text={ PT_Freight.leaves.Adaptation_Suggestion.alert_note }
			progress={{
				show: "yes"
			}}
		/>
		{/if}
		
		{#if PT_Freight.leaves.Adaptation_Suggestion.alert_problem_1.length >= 1 }
		<Alert_Problem
			text={ PT_Freight.leaves.Adaptation_Suggestion.alert_problem_1 }
			text_2={ PT_Freight.leaves.Adaptation_Suggestion.alert_problem_2 }
			progress={{
				show: "no"
			}}
		/>
		{/if}
		
		{#if PT_Freight.leaves.Adaptation_Suggestion.alert_success.length >= 1 }
		<Alert_Success
			text={ PT_Freight.leaves.Adaptation_Suggestion.alert_success }
		/>
		{/if}
	</div>
	
	
	{#if PT_Freight.leaves.Adaptation_Suggestion.adaptation_fiberized.length >= 1}
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
					>The <Slang text="Blockchain_Transaction" /> on the <Slang text="Blockchain" /></header>
				</svelte:fragment>
				<svelte:fragment slot="content">
					<div>
						<Code_Wall
							text={ PT_Freight.leaves.Adaptation_Suggestion.adaptation_fiberized }
						/>
					</div>
				</svelte:fragment>
			</AccordionItem>
		</Accordion>
	</div>
	{/if}
	
	
	<div style="height: 5cm"></div>		

	{/if}
</div>