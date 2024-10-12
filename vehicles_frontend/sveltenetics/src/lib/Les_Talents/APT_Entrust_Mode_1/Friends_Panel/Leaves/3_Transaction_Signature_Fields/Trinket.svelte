

<script>

//\
//
import { getModalStore } from '@skeletonlabs/skeleton';
import { TabGroup, Tab, TabAnchor } from '@skeletonlabs/skeleton';
import { ConicGradient } from '@skeletonlabs/skeleton';
import { Accordion, AccordionItem } from '@skeletonlabs/skeleton';
import { RadioGroup, RadioItem } from '@skeletonlabs/skeleton';
//
import * as AptosSDK from "@aptos-labs/ts-sdk";
import { onMount, onDestroy } from 'svelte';
import { Html5QrcodeScanner, Html5QrcodeScanType, Html5Qrcode } from "html5-qrcode";
//
import { parse_styles } from '$lib/trinkets/styles/parse.js';
//
import { string_from_Uint8Array } from '$lib/taverns/hexadecimal/string_from_Uint8Array'
import { Uint8Array_from_string } from '$lib/taverns/hexadecimal/Uint8Array_from_string'
//
import Barcode_Camera from './Barcode_Camera.svelte'
import Hexadecimal_String_Field from './Hexadecimal.svelte'
//
///



import { 
	refresh_truck, 
	retrieve_truck, 
	monitor_truck 
} from '$lib/Les_Talents/APT_Entrust_Mode_1/Friends_Panel/Logistics/Truck'
let prepared = "no"
let Truck_Monitor;
let freight;
onMount (async () => {
	const Truck = retrieve_truck ()
	freight = Truck.freight; 
	
	freight.current_land = "Transaction_Signature_Fields"
	
	Truck_Monitor = monitor_truck ((_freight) => {
		console.log ("Transaction Signature Fields: Truck_Monitor", { _freight })
		freight = _freight;
		
	})
	
	prepared = "yes"
});
onDestroy (() => {
	Truck_Monitor.stop ()
});

let current_tab = 0;

</script>

{#if prepared === "yes"}
<div
	monitor="signature field leaf"
>
	<div class="card p-2">
		<Accordion>
			<AccordionItem>
				<svelte:fragment slot="summary">
					<header
						style="
							text-align: center;
							font-size: 2em;
							padding: .25cm 0;
						"
					>Signature Field</header>
				</svelte:fragment>
				<svelte:fragment slot="content">
					<p
						style="text-align: center"
					>
						<span>A signature made in the Loyals form can be added here.</span> 
					</p>
				</svelte:fragment>
			</AccordionItem>
		</Accordion>
	</div>
	
	<div style="height: 0.5cm" ></div>
	
	<aside 
		
	
		class="alert variant-filled"
		style="
			display: flex;
			flex-direction: row;
			margin: 0 auto;
			max-width: 500px;
		"
	>
		<div>
			{#if freight.transaction_signature.verified != "yes" }
			<ConicGradient 
				stops={[
					{ color: 'transparent', start: 0, end: 25 },
					{ color: 'rgb(var(--color-primary-500))', start: 75, end: 100 }
				]} 
				spin
				width="w-5"
			/>
			{/if}
		</div>
		<p
			monitor="signature alert text"
			style="
				margin: 0;
				padding-left: 12px;
			"
		>{ freight.transaction_signature.info_text }</p>
	</aside>

	<div style="height: 0.5cm" ></div>

	<div
		style="
			text-align: center;
		"
	>
		<RadioGroup 
			rounded="rounded-container-token" 
			_flexDirection="flex-col"
		>				
			<RadioItem 
				bind:group={current_tab} 
				name="justify" 
				value={ 0 }
			>	
				<!-- Barcode Camera -->
				<span monitor="barcode pad">Barcode</span>
			</RadioItem>
			<RadioItem 
				bind:group={current_tab} 
				name="justify" 
				value={1}
			>
				<span monitor="hexadecimal pad">Hexadecimal</span>
			</RadioItem>
		</RadioGroup>
	</div>
	
	<div style="height: 0.5cm" ></div>
	<hr class="!border-t-2" />
	<div style="height: 0.5cm" ></div>
	
	{#if current_tab === 0}
		<Barcode_Camera />
	{:else if current_tab === 1}
		<Hexadecimal_String_Field />
	{/if}
	
	<div style="height: 200px"></div>
</div>
{/if}