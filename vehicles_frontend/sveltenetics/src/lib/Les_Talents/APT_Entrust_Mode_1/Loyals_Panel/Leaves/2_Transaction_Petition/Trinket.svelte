


<script>


//\\
//
import { Accordion, AccordionItem } from '@skeletonlabs/skeleton';
import { TabGroup, Tab, TabAnchor } from '@skeletonlabs/skeleton';
import { RadioGroup, RadioItem } from '@skeletonlabs/skeleton';
import { onMount, onDestroy } from 'svelte';
//
//
import { has_field } from '$lib/taverns/procedures/object/has_field'
//
//
import { 
	build_unsigned_tx_from_hexadecimal_string 
} from '$lib/PTO/Transaction/Unsigned/from_hexadecimal_string'
import UT_Stringified from '$lib/PTO/Transaction/Unsigned/Stringified.svelte'
import Code_Wall from '$lib/trinkets/Code_Wall/Trinket.svelte' 
import Slang from '$lib/trinkets/Slang/Trinket.svelte'
//
////
import { 
	parse_bracket 
} from '$lib/Les_Talents/APT_Entrust_Mode_1/Screenplays/transaction_petition/bracket/parse.js'

import Info_Alert from '$lib/trinkets/Alerts/Info.svelte'


///
//
export let unsigned_tx_hexadecimal_string;
export let unsigned_tx_stringified;
export let unsigned_tx_scanned;
//
//\

let unsigned_tx = ""

let current_tab = 0;
let selected_option = "object"

let alert_1 = ""


let show_outline = "no"
let parsed_alert_2 = {}



const make_info_alerts = () => {
	const parsed = freight.Unsigned_Transaction_Fields.Aptos_object_parsed;
	
	if (
		has_field (parsed, "amount_as_base_10") !== true &&
		has_field (parsed, "amount_as_base_16")	!== true
	) {
		return;
	}
		
	if (
		parsed.amount_as_base_10.length >= 1 &&
		parsed.amount_as_base_16.length >= 1	
	) {		
		alert_1 = `"${ parsed.amount_as_base_16 }" is equal to "${ parsed.amount_as_base_10 }"`
	}
	
	show_outline = "yes"
	parsed_alert_2 = parsed;
}

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
	freight.current_land = "Unsigned_Transaction"
	make_info_alerts ();
	
	Truck_Monitor = monitor_truck ((_freight) => {
		freight = _freight;
		make_info_alerts ();
	})
	
	prepared = "yes"
});
onDestroy (() => {
	Truck_Monitor.stop ()
});

</script>


{#if prepared === "yes" }
<div monitor="petition verification leaf">
	<div
		style="
			text-align: center;
		"
	>
		<header
			style="
				text-align: center;
				font-size: 2em;
			"
		>Petition Verification</header>
		<p>This petition should be the same as the one that was created on the other trinket.</p>
	</div>
	
	<div style="height: 1cm" ></div>

	<div
		style="
			max-width: 400px;
			margin: 0 auto;
			text-align: center;
		"
	>
		<RadioGroup 
			rounded="rounded-container-token" 
			_flexDirection="flex-col"
		>				
			<RadioItem 
				bind:group={ selected_option } 
				name="justify" 
				value="object"
			>
				<span
					monitor="petition bracket"
				>Bracket</span>
			</RadioItem>
			<RadioItem 
				bind:group={ selected_option } 
				name="justify" 
				value="hexadecimal"
			>
				<span
					monitor="petition hexadecimal"
				>Hexadecimal</span>
			</RadioItem>
		</RadioGroup>
		
	</div>
		
	<div style="height: 1cm" ></div>
	<hr class="!border-t-2" />
	<div style="height: 1cm" ></div>

	<div>
		{#if selected_option === "object" }
		<div 
			monitor="bracket panel"
		>			
			<div class="card p-1">
				<Accordion>
					<AccordionItem>
						<svelte:fragment slot="summary">
							<header
								style="
									text-align: center;
									font-size: 1.25em;
									padding: 0cm 0;
								"
							>Notes</header>
						</svelte:fragment>
						<svelte:fragment slot="content">
							<div style="text-align: center">
								<p
									style="
										text-align: center;
										padding: 10px 0 20px;
									"
								>This is the petition as a bracket.</p>
							
								<p>For the purpose of showing the bracket,</p>
								<p>Fields of type <b>Uint8Array</b> were adapted into type <b>hexadecimal</b>.</p>
								<p>Fields of type <b>BigInts</b> were adapted into type <b>string</b>.</p>
							</div>
						</svelte:fragment>
					</AccordionItem>
				</Accordion>
			</div>
			
			<div style="height: 0.5cm" ></div>
			
			{#if show_outline === "yes" }
			<div 
				style="
					padding: 0.25cm;
				"
				class="card"
			>
				<p
					style="
						display: none;
						white-space: pre;
					"
				>{ JSON.stringify (parsed_alert_2, null, 4) }</p>
				
				<Accordion>
					<AccordionItem open>
						<svelte:fragment slot="summary">
							<header
								style="
									text-align: center;
									font-size: 1.25em;
									padding: 0cm 0;
								"
							>Details</header>
						</svelte:fragment>
						<svelte:fragment slot="content">
							<div class="table-container">
								<table class="table table-compact">
									<tbody>
										<tr>
											<td>Origin Address</td>
											<td>{ parsed_alert_2.address_of_sender }</td>
										</tr>
										<tr>
											<td>To Address</td>
											<td>{ parsed_alert_2.address_of_recipient }</td>
										</tr>
										<tr>
											<td>Amount</td>
											<td>{ parsed_alert_2.amount_as_base_10 } Octas</td>
										</tr>
										<tr>
											<td>Max Gas Amount</td>
											<td>{ parsed_alert_2.max_gas_amount } Octas</td>
										</tr>
										<tr>
											<td>Gas Unit Price</td>
											<td>{ parsed_alert_2.gas_unit_price } Octas</td>
										</tr>
									</tbody>
								</table>
							</div>
						</svelte:fragment>
					</AccordionItem>
				</Accordion>				
			</div>
			{/if}
			
			<div style="height: 0.25cm" ></div>
			
			<div 
				monitor="bracket panel 2"
			
				class="card p-2"
			>
				<Accordion>
					<AccordionItem open>
						<svelte:fragment slot="summary">
							<header
								style="
									text-align: center;
									font-size: 1.25em;
									padding: 0cm 0;
								"
							>Bracket</header>
						</svelte:fragment>
						<svelte:fragment slot="content">
							<div>
								{#if alert_1.length >= 1 }
								<Info_Alert 
									text={ alert_1 }
								/>
								{/if}
								
								<div style="height: 0.25cm" ></div>
								
								<Code_Wall 
									text={ freight.Unsigned_Transaction_Fields.Aptos_object_fiberized } 
								/>
							</div>
						</svelte:fragment>
					</AccordionItem>
				</Accordion>
			</div>
		</div>
		{:else if selected_option === "hexadecimal" }
		<div>
			<p
				style="
					text-align: center;
					padding: 10px 0 20px;
				"
			>This is the petition as a hexadecimal string.</p>

			<div TP_hexadecimal_string>
				<Code_Wall 
					text={ freight.Unsigned_Transaction_Fields.hexadecimal_string } 
				/>
			</div>
		</div>
		{/if}
	</div>	
</div>
{/if}