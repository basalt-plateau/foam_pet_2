



<script>


////
///
//
import * as AptosSDK from "@aptos-labs/ts-sdk";
//
import { Accordion, AccordionItem } from '@skeletonlabs/skeleton';
import { Modal, getModalStore } from '@skeletonlabs/skeleton';
import { getToastStore } from '@skeletonlabs/skeleton';
import { onMount, onDestroy } from 'svelte';
//
//
import { parse_styles } from '$lib/trinkets/styles/parse.js';
import Panel from '$lib/trinkets/panel/trinket.svelte'
import Net_Choices from '$lib/PTO/Nets/Choices.svelte'
//
import Amount_Field from '$lib/trinkets/Amount_Field/Trinket.svelte'
import Address_Qualities_Trinket from '$lib/trinkets/Address_Qualities/Trinket.svelte'
import { ask_for_freight } from '$lib/Versies/Trucks'
import Field from '$lib/trinkets/Field/Trinket.svelte'
import Slang from '$lib/trinkets/Slang/Trinket.svelte'
//
import { 
	retrieve_truck, 
	monitor_truck,
	verify_land
} from '$lib/Les_Talents/APT_Entrust_Mode_1/Friends_Panel/Logistics/Truck'
//
import { assert_is_natural_numeral_string } from '$lib/taverns/numerals/natural/is_string'
//
//\
//\\



let prepared = "no"
let Truck_Monitor;
let freight;
onMount (() => {
	const Truck = retrieve_truck ()
	freight = Truck.freight; 
	
	//
	//
	//
	//
	freight.current_land = "Transaction_Fields"

	Truck_Monitor = monitor_truck ((_freight) => {
		let freight = _freight;
	})
	
	//
	//	This prepares the modal logistics with the
	//	
	//
	const roomies_freight = ask_for_freight ();
	freight.fields.ICANN_net_path = roomies_freight.net_path;
	freight.fields.net_name = roomies_freight.net_name;
	
	prepared = "yes"
});
onDestroy (() => {
	Truck_Monitor.stop ()
});




const check_can_go_on = () => {
	
	freight.current.back = "no"
	
	/*
	if (freight.fields.from_address_permitted !== "yes") {
		freight.current.next = "no"
		freight.current.note = `There's a problem with the "Origin Address".` + freight.fields.from_address_exception 
		return;
	}
	*/
	
	/*
	if (freight.fields.to_address_permitted !== "yes") {
		freight.current.next = "no"
		freight.current.note = `There's a problem with the "To Address".`
		return;
	}
	*/
	
	
	if (freight.fields.actual_amount_of_Octas_problem !== "") {
		freight.current.next = "no"
		freight.current.note = `There's a problem with the "Amount".  ` + freight.fields.actual_amount_of_Octas_problem
		return;
	}
	
	
	
	// verify_land ();
	
	
	freight.current.next = "yes"
}


////
//
//	Origin Address
//
//
let origin_address_trinket = ""
const on_prepare_origin_address = () => {
	origin_address_trinket.change_address_hexadecimal_string (
		freight.fields.from_address_hexadecimal_string
	)
}
const on_change_origin_address = ({
	effective,
	address_hexadecimal_string,
	exception
}) => {
	// console.log ("on_change_origin_address", { effective, exception });
	
	freight.fields.from_address_permitted = effective;
	freight.fields.from_address_exception = exception;
	freight.fields.from_address_hexadecimal_string = address_hexadecimal_string;
	
	check_can_go_on ();
}
//
////


////
//
//	To Address
//
//
let to_address_trinket = ""
const on_prepare_to_address = () => {
	to_address_trinket.change_address_hexadecimal_string (
		freight.fields.to_address_hexadecimal_string
	)
}
const on_change_to_address = ({
	effective,
	address_hexadecimal_string,
	exception
}) => {
	// console.log ("on_change_to_address", { effective, exception });
	
	freight.fields.to_address_permitted = effective;
	freight.fields.to_address_exception = exception;
	freight.fields.to_address_hexadecimal_string = address_hexadecimal_string;
	
	check_can_go_on ();
}
//
////

////
//
//	Amount Field
//
let amount_field = ""
const on_amount_change = ({ 
	effects,
	actual_amount_of_Octas
}) => {
	console.log ("on_amount_change", actual_amount_of_Octas)
	
	
	freight.fields.actual_amount_of_Octas_problem = effects.problem;
	
	if (effects.problem === "") {
		freight.fields.actual_amount_of_Octas = actual_amount_of_Octas;
	}
}
const on_amount_prepare = () => {
	amount_field.modify ({ 
		Octas: freight.fields.actual_amount_of_Octas 
	})
}
//
////


////
//
//	Seconds Until Expiration
//
//
let seconds_until_expiration_field = ""
const seconds_until_expiration_on_change = ({ packet }) => {
	const actual_packet_type = typeof packet;
	
	try {
		assert_is_natural_numeral_string (packet)
	}
	catch (exception) {
		return {
			"problem": exception.message
		}
	}
	
	freight.fields.seconds_until_expiration = packet;
	
	return {}
}
const seconds_until_expiration_on_prepare = () => {
	seconds_until_expiration_field.modify_packet ("600")
}
//
////

////
//
//	Max Gas Amount
//
//
let max_gas_amount_field = ""
const max_gas_amount_on_change = ({ packet }) => {
	const actual_packet_type = typeof packet;
	
	try {
		assert_is_natural_numeral_string (packet)
	}
	catch (exception) {
		return {
			"problem": exception.message
		}
	}
	
	freight.fields.max_gas_amount = packet
	
	return {}
}
const max_gas_amount_on_prepare = () => {
	max_gas_amount_field.modify_packet ("200000")
}
//
////


////
//
//	Gas Unit Price
//
//
let gas_unit_price_field = ""
const gas_unit_price_on_change = ({ packet }) => {
	const actual_packet_type = typeof packet;
	
	try {
		assert_is_natural_numeral_string (packet)
	}
	catch (exception) {
		return {
			"problem": exception.message
		}
	}
	
	freight.fields.gas_unit_price = packet;
	
	return {}
}
const gas_unit_price_on_prepare = () => {
	gas_unit_price_field.modify_packet ("100")
}
//
////









const link = [
	"https://explorer.aptoslabs.com/account/",
	"0x0000000000000000000000000000000000000000000000000000000000000001",
	"/modules/run/aptos_account/transfer"
].join ("");


const maximum_gas_amount_link = (
	"https://aptos.dev/en/network/glossary#maximum-gas-amount"
)

const gas_unit_price_link = (
	"https://aptos.dev/en/network/glossary#gas-unit-price"
)

</script>


<style>

td {
	display: flex;
	flex-direction: column;
}

p {
	white-space: normal;
}

</style>

{#if prepared === "yes"}
<div transaction_petition_fields>
	<div class="card p-4">
		<header
			style="
				text-align: center;
				font-size: 2em;
			"
		>Petition Form</header>
	</div>
	
	<hr class="!border-t8" 
		style="
			border-style: dotted;
			border-top-width: 0.2cm;
			margin: 0.5cm 0;
		" 
	/>
	
	<div class="card p-2">
		<Accordion>
			<AccordionItem>
				<svelte:fragment slot="summary">
					<header
						style="
							text-align: center;
							font-size: 1.5em;
							padding: 0cm 0;
						"
					>Hints</header>
				</svelte:fragment>
				<svelte:fragment slot="content">
					<div>
						<p
							style="text-align: center; font-size: 1em"
						>This is for transfering APT from one address to another address.</p>
						
						<div class="card p-2"
							style="margin: .25cm 0"
						>
							<a 
								href={ link }
								target="_blank"
								style="
									word-break: break-all;
								"
							>{ link }</a>
						</div>
						
						<p>The procedure is:</p>
						<ol class="list">
							<li>
								<span class="badge p-2 variant-soft-primary">1. online</span>
								<span class="flex-auto">Petition Form</span>
							</li>
							<li>
								<span class="badge p-2 variant-soft-tertiary">2. offline</span>
								<span class="flex-auto">Petition QR Code Scan</span>
							</li>
							<li>
								<span class="badge p-2 variant-soft-tertiary">3. offline</span>
								<span class="flex-auto">Petition Verification</span>
							</li>
							<li>
								<span class="badge p-2 variant-soft-tertiary">3. offline</span>
								<span class="flex-auto">Petition Signature</span>
							</li>
							<li>
								<span class="badge p-2 variant-soft-primary">4. online</span>
								<span class="flex-auto">Signature QR Code Scan</span>
							</li>
							<li>
								<span class="badge p-2 variant-soft-primary">5. online</span>
								<span class="flex-auto">Petition Throw</span>
							</li>
						</ol>
					</div>
				</svelte:fragment>
			</AccordionItem>
		</Accordion>
	</div>
	
	
	<hr class="!border-t8" 
		style="
			border-style: dotted;
			border-top-width: 0.2cm;
			margin: 0.5cm 0;
		" 
	/>
	
	
	<div
		style="
			text-align: center;
			
			display: grid;
			grid-template-columns: repeat(auto-fit, minmax(400px, 1fr));
			grid-template-rows: auto;
			gap: 10px;
		"
	>
		<span class="badge variant-soft"
			style="
				position: relative;
				
				font-size: 1.2em;
			"
		>
			<span>Net Name</span>
			<span 
				icann_net_name
				class="badge variant-filled-surface"
			>{ freight.fields.net_name }</span>
		</span>
		<span class="badge variant-soft"
			style="
				position: relative;
				
				font-size: 1.2em;
			"
		>
			<span>Net Path</span>
			<span 
				icann_net_path
				class="badge variant-filled-surface"
			>{ freight.fields.ICANN_net_path }</span>
		</span>
		<span class="badge variant-soft"
			style="
				position: relative;
				
				font-size: 1.2em;
			"
		>
			<span>Function</span>
			<span class="badge variant-filled-surface">0x1::aptos_account::transfer</span>
		</span>
	</div>

	<hr class="!border-t8" 
		style="
			border-style: dotted;
			border-top-width: 0.2cm;
			margin: 0.5cm 0;
		" 
	/>
	
	<div 
		from_aptos_address
		class="card variant-soft-primary p-2" 
		style="color: inherit"
	>
		<Address_Qualities_Trinket 
			name="Origin Address"
			bind:this={ origin_address_trinket }
			on_change={ on_change_origin_address }
			on_prepare={ on_prepare_origin_address }
		/>
	</div>
	
	<div style="height: 0.5cm"></div>
		
	<div 
		to_aptos_address
		class="card variant-soft-primary p-2" 
		style="color: inherit"
	>
		<Address_Qualities_Trinket 
			name="To Address"
			bind:this={ to_address_trinket }
			on_change={ on_change_to_address }
			on_prepare={ on_prepare_to_address }
		/>
	</div>

	<div style="height: 0.5cm"></div>

	<div class="card variant-soft-primary p-4" style="color: inherit">
		<div style="text-align: center;">
			<span 
				class="badge variant-soft-primary" 
				style="
					margin: 0 auto;
					padding: 0.2cm 1cm;
				"
			>
				<p style="font-size: 1.2em; font-weight: bold;">Amount</p>
			</span>
		</div>
		
		<p
			style="text-align: center; padding-bottom: 10px"
		>1 APT = 1e8 Octas</p>
		
		<Amount_Field 
			bind:this={ amount_field }
			on_change={ on_amount_change }
			on_prepare={ on_amount_prepare }			
		/>
	</div>

	<div style="height: 0.2cm"></div>
	
	<Field 
		monitor="seconds until expiration"
		logo="Seconds Until Expiration"
		
		bind:this={ seconds_until_expiration_field }
		on_change={ seconds_until_expiration_on_change }
		on_prepare={ seconds_until_expiration_on_prepare }
	>
		<div 
			style="
				margin: 0.1cm 0;
			"
			class="card p-1 variant-soft-primary"
		>
			<p
				style="
					text-align: center;
				"
			>After the duration has elapsed, the <Slang text="consensus" /> won't approve the <Slang text="petition" />.</p>
		</div>
	</Field>

	<div style="height: 0.2cm"></div>
	
	<Field 
		monitor="gas unit price"
		logo="Gas Unit Price, in Octas"
		
		
		bind:this={ gas_unit_price_field }
		on_change={ gas_unit_price_on_change }
		on_prepare={ gas_unit_price_on_prepare }
	>
		<div 
			style="
				margin: 0.1cm 0;
			"
			class="card p-1 variant-soft-primary"
		>
			<p
				style="
					text-align: center;
				"
			>	
				<span>Details can be found at:</span>
				<a
					class="anchor"
					target="_blank"
					href={ gas_unit_price_link }
				>{ gas_unit_price_link }</a>
			</p>
		</div>
	</Field>
	
	
	<div style="height: 0.2cm"></div>
	
	<Field 
		monitor="max gas amount"
		logo="Max Gas Amount, in Octas"
		
		bind:this={ max_gas_amount_field }
		on_change={ max_gas_amount_on_change }
		on_prepare={ max_gas_amount_on_prepare }
	>
		<div 
			style="
				margin: 0.1cm 0;
			"
			class="card p-1 variant-soft-primary"
		>
			<p
				style="
					text-align: center;
				"
			>	
				<span>Details can be found at:</span>
				<a
					class="anchor"
					target="_blank"
					href={ maximum_gas_amount_link }
				>{ maximum_gas_amount_link }</a>
			</p>
		</div>
	</Field>
	
</div>
{/if}