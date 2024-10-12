

<script>


////
//
import { Accordion, AccordionItem } from '@skeletonlabs/skeleton';
import { getModalStore } from '@skeletonlabs/skeleton';
import { TabGroup, Tab, TabAnchor } from '@skeletonlabs/skeleton';
import { ConicGradient } from '@skeletonlabs/skeleton';
import { getToastStore } from '@skeletonlabs/skeleton';	
import { RadioGroup, RadioItem } from '@skeletonlabs/skeleton';
//
import { onMount, onDestroy } from 'svelte';
import { fade } from 'svelte/transition';
//
import { Html5QrcodeScanner, Html5QrcodeScanType, Html5Qrcode } from "html5-qrcode";
//
//
import Barcode_Camera from './Barcode_Camera/Trinket.svelte'
import Hexadecimal_String_Field from './Hexadecimal_String_Field/Trinket.svelte'
//
import { 
	parse_styles 
} from '$lib/trinkets/styles/parse.js';
import UT_Stringified from '$lib/PTO/Transaction/Unsigned/Stringified.svelte'
import Leaf from '$lib/trinkets/Layout/Leaf/Trinket.svelte'
import Alert_Info from '$lib/trinkets/Alerts/Info.svelte'
import Alert_Success from '$lib/trinkets/Alerts/Success.svelte'
//
//
import Loyals_Truck from '../../Logistics/Truck.svelte'
//
//
////






let freight = {}
let prepared = "no"
const on_change = ({ freight: _freight, happening }) => {
	freight = _freight;
	
	if (happening === "mounted") {
		freight.current_land = "Unsigned_Transaction_Fields"
		prepared = "yes"
	}
}
	
		

let selected_option = "1"
$: {
	
}



let current_tab = 0;

</script>



<Leaf>
	<Loyals_Truck on_change={ on_change } />
	
	
	{#if prepared === "yes"}
	<div monitor="petition field leaf">
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
						>Petition Field</header>
					</svelte:fragment>
					<svelte:fragment slot="content">
						<p
							style="
								text-align: center;
							"
						>A <b>QR code picture</b> or a <b>hexadecimal string</b> of the petition can be added here.</p>
					</svelte:fragment>
				</AccordionItem>
			</Accordion>
		</div>
		
		<div style="height: 0.25cm" ></div>
		
		
		{#if freight.Unsigned_Transaction_Fields.info_text.length >= 1}
		<div
			style="
				display: flex;
				flex-direction: row;
				margin: 0.125cm auto;
				max-width: 600px;
				justify-content: center;
			"
		>
			<Alert_Info 
				text={ freight.Unsigned_Transaction_Fields.info_text } 
				progress={{
					show: "yes"
				}}
			/>
		</div>
		{/if}
		
		{#if freight.Unsigned_Transaction_Fields.alert_success.length >= 1}
		<div
			style="
				display: flex;
				flex-direction: row;
				margin: 0.125cm auto;
				max-width: 600px;
				justify-content: center;
			"
		>
			<Alert_Success text={ freight.Unsigned_Transaction_Fields.alert_success } />
		</div>
		{/if}
		
		<div
			style="
				max-width: 400px;
				margin: 0 auto;
				padding: 0.25cm 0;
				
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
					value="1"
				>
					<!-- <span>Barcode Picture</span> -->
					<span monitor="show barcode">Barcode</span>
				</RadioItem>
				<RadioItem 
					bind:group={selected_option} 
					name="justify" 
					value="2"
				>
					<!-- <span>Hexadecimal String</span> -->
					<span monitor="show hexadecimal">Hexadecimal</span>
				</RadioItem>
			</RadioGroup>
		</div>

		
		<div style="height: 0.25cm" ></div>
		<hr class="!border-t-2" />
		<div style="height: 0.25cm" ></div>

		<div>
			{#if selected_option === "1" }
			<div>
				<Barcode_Camera />
			</div>
			{:else if selected_option === "2" }
			<div>
				<Hexadecimal_String_Field />
			</div>
			{/if}
		</div>
	</div>
	{/if}
</Leaf>
