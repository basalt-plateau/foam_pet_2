











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
import Slang from '$lib/trinkets/Slang/Trinket.svelte'
	

const alert_success_note = "The bits were received successfully."
let received_bits = "";
let barcode_vision = ""
const on_barcode_found = async ({ hexadecimal_string }) => {
	received_bits = hexadecimal_string;
	barcode_vision.stop_the_scan ();
	
	on_next_pressed ();
}
	
let panel_name = "Send Bits"


let rules_entire_link = "/Rules/Laboratory/frontend_rules_entire.txt"
let rules_legend_link = "/Rules/Laboratory/frontend_rules_legend.txt"
let rules_originals_link = "/Rules/Laboratory/Frontend_Rules_Originals.HTML"

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
const on_modal_change = () => {}


const on_next_pressed = () => {
	console.info ("on_next_pressed")
	
	polytope_modal.advance (({ freight }) => {
		return freight;		
	})
}
const on_back_pressed = () => {
	console.info ("on_back_pressed")
	
	polytope_modal.advance (({ freight }) => {
		return freight;		
	})
}

const on_prepare = () => {
	polytope_modal.advance (({ freight }) => {
		return _merge ({}, freight, {
			showing: 'yes',
			name: 'Rules',
			
			unfinished: {
				showing: 'no',
			},
			
			
			back: {
				text: 'Back',
				permitted: "no",
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

let show = "Originals";
let clones_show = "Legend"

</script>


<Polytope 
	bind:this={ polytope_modal }
	on_change={ on_modal_change }
	on_prepare={ on_prepare }
>
	<div 
		slot="leaves"
		style="
			width: 100%;
			
			padding: 1cm 0 3cm;
			
			// display: flex;
			// justify-content: center;
			align-items: center;
			
			flex-direction: column;
			
			max-width: 25cm;
			
			margin: 0 auto;
			"
	>
		<div
			style="
				padding: 0.25cm 0;
				text-align: center;
			"
		>
			<RadioGroup>
				<RadioItem bind:group={ show } name="justify" value={ "Originals" }>Originals</RadioItem>	
				<RadioItem bind:group={ show } name="justify" value={ "Clones" }>Clones</RadioItem>	
				<RadioItem bind:group={ show } name="justify" value={ "Anatomy" }>Anatomy</RadioItem>
			</RadioGroup>
		</div>
					
		<div style="height: 0.5cm"></div>			
					
		<div 
			style="
				width: 100%;
			"
			class="card p-4"
		>
			{#if show === "Originals" }
			<div
				style="
					text-align: center;
				"
			>
				<header
					style="
						font-size: 2em;
					"
				>Originals</header>
				
				<p>Original <Slang text="Pet" /> foam (frontend) is subject to these rules.</p>
			
				<div style="height: 0.5cm"></div>	
				
				<div class="card p-1 variant-filled-primary">
					<iframe
						src={ rules_originals_link }
						
						style="
							width: 100%;
							height: 25cm;
						"

						frameborder="0"
						title="Rules Legend"
					>
					</iframe>
				</div>
			</div>
			{/if}
		
			{#if show === "Anatomy" }
			<div
				style="
					text-align: center;
				"
			>
				<header
					style="
						font-size: 2em;
					"
				>Anatomy</header>
				
				<p>These are the sources.</p>
			
				<div style="height: 0.5cm"></div>	
			
				<span 
					style="
						line-height: 2em;
						text-align: center;
					"
					class="flex-auto"
				>
					<a 
						style="display: block"
						class="anchor" 
						href="https://github.com/basalt-plateau/foam_pet"
						target="_blank"
					>https://github.com/basalt-plateau/foam_pet</a>
					<a 
						style="display: block"
						class="anchor" 
						href="https://gitlab.com/basalt_plateau/foam_pet"
						target="_blank"
					>https://gitlab.com/basalt_plateau/foam_pet</a>
				</span>
			</div>
			{/if}
		
			{#if show === "Clones" }
				<div
					style="
						text-align: center;
					"
				>
					<header
						style="
							font-size: 2em;
						"
					>Clones</header>
					
					<div style="height: 0.5cm"></div>
					
					<p><Slang text="Pet" /> is made from these.</p>
					<p><b>Legend</b> is the name of every frontend license.</p>
					<p><b>Entire</b> has the every frontend licenses.</p>
				
					<div style="height: 0.5cm"></div>	
				
					<RadioGroup>
						<RadioItem bind:group={ clones_show } name="justify" value={ "Legend" }>Legend</RadioItem>
						<RadioItem bind:group={ clones_show } name="justify" value={ "Entire" }>Entire</RadioItem>
					</RadioGroup>
					
					<div style="height: 0.5cm"></div>
				</div>
				
				<div class="card p-1 variant-filled-primary">
					{#if clones_show === "Legend" }
					<iframe
						src={ rules_legend_link }
						
						style="
							width: 100%;
							height: 25cm;
						"

						frameborder="0"
						title="Rules Legend"
					>
					</iframe>
					{/if}
					
					{#if clones_show === "Entire" }
					<iframe
						src={ rules_entire_link }
						
						style="
							width: 100%;
							height: 25cm;
						"

						frameborder="0"
						title="Rules Entire"
					>
					</iframe>
					{/if}
				</div>
			{/if}
		</div>
	</div>
	
	<div slot="unfinished">
		<div>
			This is unfinished
		</div>
	</div>
</Polytope>