

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
import Leaf from '$lib/trinkets/Layout/Leaf/Trinket.svelte'
import Join_Harvest from './Leaves/Join_Harvest/Trinket.svelte'
//
//
///

//
//
let show_panel = "Digital Assets 1";
//
//


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


let on_back = []

const open_a_panel = ({ panel_name }) => {
	show_panel = panel_name
}

const join_mercy_harvest = () => {
	polytope_modal.advance (({ freight }) => {
		freight.back.permitted = "yes"
		show_panel = "Join Mercy Harvest"
		
		on_back.push ('Mercy Show')
		
		return freight;		
	})
}

let polytope_freight = {}
let prepared = "no"
const on_prepare = () => {
	polytope_modal.advance (({ freight }) => {
		return _merge ({}, freight, {
			showing: 'yes',
			
			name: '',
			
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
	
	
	show_panel = "Mercy Show"
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
		{#if show_panel === "Mercy Show" }
		<Leaf>
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
				<div class="card p-4"
					style="
						width: 100%;
						text-align: center;
					"
				>
					<header
						style="
							font-size: 3em;
						"
					>Mercy</header>
				</div>
				
				<div class="card p-4"
					style="
						width: 100%;
						text-align: center;
					"
				>
					<button type="button" class="btn variant-filled">Establish the Mercy Harvest</button>
				</div>
				
				<div
					style="
						display: flex;
						gap: 1em;
					
						width: 100%;
						text-align: center;
					"
				>
					<div class="card p-4"
						style="
							width: 100%;
							text-align: center;
						"
					>
						<button 
							type="button" 
							class="btn variant-filled"
							on:click={ join_mercy_harvest }
						>Join</button>
					</div>
					<div class="card p-4"
						style="
							width: 100%;
							text-align: center;
						"
					>
						<button type="button" class="btn variant-filled">Leave</button>
					</div>
				</div>
				
				<div class="card p-4"
					style="
						width: 100%;
						text-align: center;
					"
				>
					<button type="button" class="btn variant-filled">Buy Mercy</button>
					
					<div class="card p-4 variant-soft-primary"
						style="
							margin: 1cm 0;
							width: 100%;
							text-align: center;
						"
					>
						<h1
							style="
								margin: 1cm 0;
							"
						>Sales</h1>
					
						<ol class="list">
							<li>
								<span class="badge-icon p-4 variant-filled-primary">1.</span>
								<span class="flex-auto badge p-4 variant-filled-primary">1 Mercy for 1 APT</span>
							</li>
						</ol>
					</div>
					
					<button type="button" class="btn variant-filled">Sell Mercy</button>
					
				</div>
				
				
				<div class="card p-4"
					style="
						width: 100%;
						text-align: center;
					"
				>
					<button type="button" class="btn variant-filled">Send Mercy</button>
					<button type="button" class="btn variant-filled">Receive Mercy</button>
				</div>
			</div>
		</Leaf>
		{:else if show_panel === "Join Mercy Harvest" }
		<Join_Harvest />
		{/if}
		{/if}
	</div>
	
	<div slot="unfinished">
		<div>
			This is unfinished
		</div>
	</div>
</Polytope>