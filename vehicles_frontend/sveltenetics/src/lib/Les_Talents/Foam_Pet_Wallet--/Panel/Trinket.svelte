

<script>

import { RadioGroup, RadioItem } from '@skeletonlabs/skeleton';

const address_builder = ""

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

import Hints from './Hints/Trinket.svelte'
import Harvests from './Harvests/Trinket.svelte'
import Consent_Leaf from './Consent/Trinket.svelte'

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
			
			name: 'Venues',
			
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
let leaf = "Hints";

</script>


<Polytope 
	bind:this={ polytope_modal }
	on_change={ on_modal_change }
	on_prepare={ on_prepare }
>
	<div slot="leaves"
		style="
			position: relative;
			
			height: 100%;
			width: 100%;
			padding: 1cm;
			
			display: flex;
			justify-content: center;
			align-items: center;
			flex-direction: column;
			
			
		"
	>
		{#if prepared === "yes" }
		<div
			style="
				position: absolute;
				top: 0;
				left: 0;
				
				width: 100%;
				height: 100px;
				
				text-align: center;
				
				display: flex;
				justify-content: center;
				align-items: center;
			"
		>
			<div>
				<RadioGroup>
					<RadioItem bind:group={ leaf } name="justify" value={ "Hints" }>Hints</RadioItem>
					<RadioItem bind:group={ leaf } name="justify" value={ "Harvests" }>Harvests</RadioItem>
					<RadioItem bind:group={ leaf } name="justify" value={ "Consent" }>Consent</RadioItem>
				</RadioGroup>
			</div>
		</div>
		
		<div
			style="
				position: absolute;
				top: 100px;
				left: 0;
			
				box-sizing: border-box;
				height: calc(100% - 100px);
				width: 100%;
			"
		>
			{#if leaf === "Hints"}
			<Hints />
			{:else if leaf === "Harvests" }
			<Harvests />
			{:else if leaf === "Consent" }			
			<Consent_Leaf />
			{/if}
		</div>
		{/if}
	</div>
	
	<div slot="unfinished">
		<div>
			This is unfinished
		</div>
	</div>
</Polytope>