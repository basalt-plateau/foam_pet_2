

<script>


const address_builder = ""

const visiwas = {
	tivaevae: {
		establish: address_builder + "::Rondoval_Tivaevae::B",
		destroy: address_builder + "::Rondoval_Tivaevae::J"
	}
}


/*
	Establish Tivaevae:
		Rondoval_Tivaevae::B (& estate_1_signer, thermoplastic_sheets_to_add);







*/


///
//
import { Autocomplete } from '@skeletonlabs/skeleton';
import { popup } from '@skeletonlabs/skeleton';
import _merge from 'lodash/merge'
//
//
import Polytope from '$lib/trinkets/Polytope/Fabric.svelte'
//
//
///

//
//
let show_panel = "Digital Assets 1";
//
//


let polytope_modal;

const on_click = () => {
	polytope_modal.advance (({ freight }) => {
		freight.name = "panel"
		return freight;
	})
}

const on_modal_change = () => {}


const on_next_pressed = () => {
	console.info ("on_next_pressed")
	
	polytope_modal.advance (({ freight }) => {
		if (freight.next.permitted === "yes") {
			current += 1
		}
		else {
			if (freight.next.has_alert === "yes") {
				freight.unfinished.showing = "yes"
			}
		}
		
		console.info ({ freight })
		
		return freight;		
	})
}


const open_a_panel = ({ panel_name }) => {
	show_panel = panel_name
}

const online_petition = () => {
	polytope_modal.advance (({ freight }) => {
		freight.back.permitted = "yes"
		
		show_panel = "Online Petition"
		
		return freight;		
	})
}

let polytope_freight = {}
let prepared = "no"
const on_prepare = () => {
	polytope_modal.advance (({ freight }) => {
		return _merge ({}, freight, {
			showing: 'yes',
			
			name: 'Rondovals',
			
			unfinished: {
				showing: 'no',
			},
			back: {
				text: 'Back',
				permitted: "no",
				go: async () => {
					console.log ("back pressed");
					
					polytope_modal.advance (({ freight }) => {
						if (show_panel === "Online Petition") {
							freight.back.permitted = "no"
							show_panel = "Wheel"
						}
						
						return freight;
					})
				}
			},
			next: {
				text: 'Unfinished',
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
	
	prepared = "yes"
}

let isOpen = false;

</script>


<Polytope 
	bind:this={ polytope_modal }
	on_change={ on_modal_change }
	on_prepare={ on_prepare }
>
	<div slot="leaves"
		style="
			height: 100%;
			width: 100%;
			
			display: flex;
			justify-content: center;
			align-items: center;
		"
	>
		{#if prepared === "yes" }
		{#if show_panel === "Digital Assets 1" }
		<div
			style="
				box-sizing: border-box;
				height: 100%;
				width: 100%;
				
				padding: 1cm;
				
				display: flex;
				justify-content: center;
				align-items: center;
				
				flex-direction: column;
				
				gap: 0.5cm;
			"
		>
			<header
				style="
					font-size: 3em;
				"
			>Rondovals</header>
			
			<div class="card p-4"
				style="
					width: 100%;
					text-align: center;
				"
			>
				<header
					style="
						font-size: 2em;
					"
				>Tivaevae</header>
				
				<button type="button" class="btn variant-filled">Establish</button>
				<button type="button" class="btn variant-filled">Join</button>
				<button type="button" class="btn variant-filled">Destroy</button>
			</div>
			
			<div class="card p-4"
				style="
					width: 100%;
					text-align: center;
				"
			>
				<header
					style="
						font-size: 2em;
					"
				>Geimfaras</header>
				
				<button type="button" class="btn variant-filled">Join</button>
			</div>
			
			<div class="card p-4"
				style="
					width: 100%;
					text-align: center;
				"
			>
				<header
					style="
						font-size: 2em;
					"
				>Mall</header>
				
				<button type="button" class="btn variant-filled">Join</button>
			</div>
			
			<div class="card p-4"
				style="
					width: 100%;
					text-align: center;
				"
			>
				<header
					style="
						font-size: 2em;
					"
				>Thermoplastic</header>
				
				<button type="button" class="btn variant-filled">Join</button>
			</div>
		</div>

		
		
		
		{/if}
		{/if}
	</div>
	
	<div slot="unfinished">
		<div>
			This is unfinished
		</div>
	</div>
</Polytope>