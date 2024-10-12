



<script>

///
//
import { sign } from './../../Screenplays/sign'
//
//
import { fiberize_signed_transaction } from '$lib/PTO/Transaction/Signed/Fiberize'
import Net_Choices from '$lib/PTO/Nets/Choices.svelte'
import Code_Wall from '$lib/trinkets/Code_Wall/Trinket.svelte' 
//
//
import { SlideToggle } from '@skeletonlabs/skeleton';
import { onMount, onDestroy } from 'svelte';
//
//\
import Slang from '$lib/trinkets/Slang/Trinket.svelte'
	
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
	
	freight.current_land = "Unsigned_Transaction_Signature"
	
	Truck_Monitor = monitor_truck ((_freight) => {
		freight = _freight;
	})
	
	prepared = "yes"
});
onDestroy (() => {
	Truck_Monitor.stop ()
});

let private_key_hexadecimal_string = ""
let address_is_legacy = false

const sign_the_transaction = async () => {
	freight.Unsigned_Transaction_Signature.private_key_hexadecimal_string = private_key_hexadecimal_string
	
	const {
		signed_transaction,
		signed_transaction_hexadecimal_string
	} = await sign ({
		unsigned_tx_hexadecimal_string: freight.Unsigned_Transaction_Fields.hexadecimal_string,
		private_key_hexadecimal_string,
		
		address_is_legacy
	})
	
	freight.Unsigned_Transaction_Signature.Aptos_object_fiberized = fiberize_signed_transaction ({ signed_transaction })
	freight.Unsigned_Transaction_Signature.hexadecimal_string = signed_transaction_hexadecimal_string
	
	freight.Unsigned_Transaction_Signature.signed = "yes"
}



</script>



{#if prepared === "yes"}
<div monitor="signature field leaf">
	<div
		style="
			text-align: center;
			padding: 0 1cm 1cm;
		"
	>
		<header
			style="
				text-align: center;
				font-size: 2em;
				padding: 1cm 0;
			"
		>Signature Field</header>
		<p>The "Sign" button creates a <b>signature</b> from the <b>petition</b> with the <Slang text="private key" />.</p>
		
		<div style="height: 0.2cm"></div>
		
		<div class="card p-4">
			<span style="font-size: 1.5em;">Private Key</span>
			<div style="height: 0.1cm"></div>
			<textarea 
				monitor="private key"
			
				bind:value={ private_key_hexadecimal_string }
				
				class="textarea"
				style="min-height: 50px; padding: 10px"
				type="text" 
				placeholder=""
			/>
		</div>
		
		<div style="height: 0.2cm"></div>
		
		<div class="card p-4">
			<span style="font-size: 1.5em;">Address is Legacy</span>
			<div
				style="
					display: flex;
					justify-content: center;
					align-items: center;
					padding-top: 0.2cm;
				"
			>
				<span
					style="
						padding: 0 10px;
					"
				>No</span>
				<div
					monitor="address is legacy lot"
					style="inline-flex"
				>
					<SlideToggle 
						name="slide" 
						bind:checked={ address_is_legacy } 
					/>
				</div>
				<span
					style="
						padding: 0 10px;
					"
				>Yes</span>
			</div>
		</div>
		
		<div
			style="margin: 2cm 0 0cm; text-align: right; display: inline-block;"
		>
			<button 
				monitor="sign"
			
				on:click={ sign_the_transaction }
				disabled={ freight.Unsigned_Transaction_Signature.hexadecimal_string.length >= 1 }

				type="button"
				
				style="padding-right: 64px; padding-left: 64px;"
				class="btn variant-filled"
				
			>{ freight.Unsigned_Transaction_Signature.hexadecimal_string.length === 0 ? "Sign" : "Signed" }</button>
		</div>
	</div>
</div>
{/if}