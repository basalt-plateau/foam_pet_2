

<script>




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

import Alert_Note from '$lib/trinkets/Alerts/Note.svelte'
import Petition_APT_Button from "$lib/Singles/Extension_Winch/Petition/APT_Button.svelte"
	

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
	
	prepared = "yes"
}

let isOpen = false;

const buy_human_to_chicken_reincarnation_drink = () => {
	
}

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
			<div class="card p-4">
				<span 
					style="
						display: block;
						font-size: 1.5em;
						line-height: 1.5em;
						padding: 1cm .5cm;
						white-space: pre-wrap;
					"
				>Human to Chicken Transmogrification Reincarnation Spell</span>
				
				<Alert_Note
					text={ "Mixing. Please check later." }
					progress={{
						show: "yes"
					}}
				/>
				
				<div style="height: 0.25cm" />
				
				<div
					style="
						text-align: right;
					"
				>
					<Petition_APT_Button
						button_text="Buy"
						
						APT="1"
						clicked={ buy_human_to_chicken_reincarnation_drink }
					
						permitted={ "no" }
					/>
				</div>
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