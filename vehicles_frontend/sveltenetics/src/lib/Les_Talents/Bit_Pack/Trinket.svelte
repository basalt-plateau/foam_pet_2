











<script>

/*
	import Bit_Pack from '$lib/Les_Talents/Bit_Pack/Trinket.svelte'
	import { open_bit_throw } from '$lib/Les_Talents/Bit_Pack/open.js'
*/


//
//
import { RadioGroup, RadioItem } from '@skeletonlabs/skeleton';
import _merge from 'lodash/merge'
//
//
import Polytope from '$lib/trinkets/Polytope/Fabric.svelte'
import Barcode_Visual from '$lib/trinkets/Barcode/Visual/Trinket.svelte'
import Leaf from '$lib/trinkets/Layout/Leaf/Trinket.svelte'
import Barcode_Vision from '$lib/trinkets/Barcode/Vision/Trinket.svelte'
//
//
import Alert_Success from '$lib/trinkets/Alerts/Success.svelte'
import Code_Wall from '$lib/trinkets/Code_Wall/Trinket.svelte' 
	

const alert_success_note = "The bits were received successfully."
let received_bits = "";
let barcode_vision = ""
const on_barcode_found = async ({ hexadecimal_string }) => {
	received_bits = hexadecimal_string;
	barcode_vision.stop_the_scan ();
	
	on_next_pressed ();
}
	
let panel_name = "Send Bits"

let direction = "send"
$: {
	let _direction = direction;
	if (typeof polytope_modal === "object") {
		if (_direction === "send") {
			polytope_modal.advance (({ freight }) => {
				panel_name = "Send Bits"
				freight.next.permitted = "yes"
				freight.back.permitted = "no"
				
				return freight;		
			})
		}
		else {
			polytope_modal.advance (({ freight }) => {
				panel_name = "Receive Bits"
				freight.next.permitted = "no"
				freight.back.permitted = "no"
				
				return freight;		
			})
		}
	}
}

let bits = ""
$: {
	let _bits = bits;
	
	console.info ("bits changed", _bits, typeof polytope_modal === "object");
	
	if (typeof polytope_modal === "object") {
		if (panel_name === "Send Bits") {
			if (_bits.length >= 1) {
				polytope_modal.advance (({ freight }) => {
					freight.next.permitted = "yes"
					return freight;		
				})
			}
			else {
				polytope_modal.advance (({ freight }) => {
					freight.next.permitted = "no"
					return freight;		
				})
			}
		}

	}
}


const prepare = () => {
	return {
		name: "Transfer",
		next: "yes",
		back: "yes"
	}
}

let polytope_modal;

const on_click = () => {
	polytope_modal.advance (({ freight }) => {
		freight.name = "panel"
		return freight;
	})
}

let polytope_freight = {}
const on_modal_change = () => {
	
}


const on_next_pressed = () => {
	console.info ("on_next_pressed")
	
	polytope_modal.advance (({ freight }) => {
		
		if (panel_name === "Send Bits") {
			panel_name = "Send Bits, QR Code"
			freight.next.permitted = "no"
			freight.next.has_alert = "no"
			
			freight.back.permitted = "yes"
		}
		else if (panel_name === "Receive Bits") {
			if (received_bits.length >= 1) {
				panel_name = "Receive Bits, Received"
				freight.next.permitted = "no"
				freight.back.permitted = "yes"
			}
		}
		
		return freight;		
	})
}
const on_back_pressed = () => {
	console.info ("on_back_pressed")
	
	polytope_modal.advance (({ freight }) => {
		if (panel_name === "Send Bits, QR Code") {
			panel_name = "Send Bits"
			freight.next.permitted = "yes"
			freight.back.permitted = "no"
		}
		else if (panel_name === "Receive Bits, Received") {
			panel_name = "Receive Bits"
			freight.next.permitted = "yes"
			freight.back.permitted = "no"
			
			bits = ""
			received_bits = ""
		}

		
		return freight;		
	})
}

const on_prepare = () => {
	polytope_modal.advance (({ freight }) => {
		return _merge ({}, freight, {
			showing: 'yes',
			name: 'Bit Pack',
			
			unfinished: {
				showing: 'no',
			},
			
			
			back: {
				text: 'Back',
				permitted: "yes",
				go: () => {
					console.log ('back pressed')
					on_back_pressed ()
				}
			},
			next: {
				//
				//	{ text: "Unfinished", permitted: "no" }
				//
				text: 'Next',
				permitted: "no",
				has_alert: "yes",
				go: () => {
					on_next_pressed ()
				}
			},
			panel: {
				text: ''
			}
		})
		
		// freight.name = "panel"
		// freight.show = "yes"
		return freight;
	})
}

</script>


<Polytope 
	bind:this={ polytope_modal }
	on_change={ on_modal_change }
	on_prepare={ on_prepare }
>
	
	<div 
		slot="leaves"
		style="
				height: 100%;
				width: 100%;
				
				display: flex;
				// justify-content: center;
				align-items: center;
				
				flex-direction: column;
				
				max-width: 25cm;
				
				margin: 0 auto;
			"
	>
		<div style="height: 1cm" />
	
		<p>Bits can be sent and received from here.</p>

		<div style="height: 1cm" />

		<RadioGroup>
			<RadioItem bind:group={ direction } name="justify" value={ "send" }>Send</RadioItem>
			<RadioItem bind:group={ direction } name="justify" value={ "receive" }>Receive</RadioItem>
		</RadioGroup>
		
		{#if panel_name === "Send Bits" }
		<div 
			style="
				width: 100%;
				margin: 1em;
			"
			class="card p-4"
		>
			<p
				style="
					text-align: center;
					padding: 0.5cm;
				"
			>After entering bits, the "Next" button forms a barcode.</p>
		
			<label 
				style="
					
					width: 100%;
				"
				class="label"
			>
				<textarea 
					bind:value={ bits }
				
					style="
						padding: 1em;
						width: 100%;
					"
					class="textarea" 
					rows="4" 
					placeholder="" 
				/>
			</label>
		</div>
		{:else if panel_name === "Send Bits, QR Code"}
		<label 
			style="
				padding: 1em;
				width: 100%;
			"
			class="label"
		>
			<Barcode_Visual 
				hexadecimal_string={ bits }
			/>
		</label>
		{:else if panel_name === "Receive Bits"}
		<div
			style="
				height: 100%;
				width: 100%;
				padding-top: 1cm;
			"
		>
			{#if received_bits.length >= 1 }
			<Alert_Success 
				text={ alert_success_note }
			/>
			<div style="height: 1cm" />
			{/if}
		
			<Barcode_Vision
				bind:this={ barcode_vision }
				found={ on_barcode_found }
				
				styles={{
					'height': '100%',
					'width': '100%',
					'max-width': '1000px'
				}}
			/>
		</div>
		{:else if panel_name === "Receive Bits, Received"}
		<div
			style="
				height: 100%;
				width: 100%;
				padding-top: 1cm;
			"
		>
			<div class="card p-4 variant-filled-primary">
				<Code_Wall 
					text={ received_bits } 
					can_clone={ "yes" }
				/>
			</div>
		</div>
		{/if}
	</div>
	
	
	<div slot="unfinished">
		<div>
			This is unfinished
		</div>
	</div>
</Polytope>