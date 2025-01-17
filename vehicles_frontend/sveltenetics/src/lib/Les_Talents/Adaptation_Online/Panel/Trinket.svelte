

<script>




import { Autocomplete } from '@skeletonlabs/skeleton';
import { popup } from '@skeletonlabs/skeleton';
import _merge from 'lodash/merge'

import Polytope from '$lib/trinkets/Polytope/Fabric.svelte'

import Online_Petition from './Online_Petition/Trinket.svelte'
import Offline_Petition from '$lib/PTO/Offline/Petition_Form/Trinket.svelte'
	


let polytope_modal;

const on_click = () => {
	polytope_modal.advance (({ freight }) => {
		freight.name = "panel"
		return freight;
	})
}

const on_modal_change = () => {
	
}

let show_panel = "Wheel";
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
			
			name: 'Transaction',
			
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

const endorsed = {
	"0x1": {
		"account": [ "exists_at" ],
		"aptos_account": [ "transfer" ],
		"code": [ "publish_package_txn" ]
	}
}

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
			
			display: flex;
			justify-content: center;
			align-items: center;
		"
	>
		{#if prepared === "yes" }
		{#if show_panel === "Wheel" }
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
			<button type="button" class="btn variant-filled"
				on:click={ online_petition }
			>Online Petition</button>
			
			<hr />
			
			<button 
				type="button" 
				class="btn variant-filled"
				on:click={() => {
					show_panel="Offline Petition"
				}}
			>Offline Petition</button>
			<button type="button" class="btn variant-filled"
			
			>Offline Signature</button>
		</div>
		{:else if show_panel === "Online Petition" }
		<Online_Petition 
			open_a_panel={ open_a_panel }
		/>
		{:else if show_panel === "Offline Petition" }
		<div
			style="
				max-width: 1000px;
				width: 100%;
				
				max-height: 700px;
				height: 100%;
			"
		>
			<Offline_Petition endorsed={ endorsed } />
		</div>
		{:else if show_panel === "Offline Signatory" }
		<div
			style="
				max-width: 1000px;
				width: 100%;
				
				max-height: 700px;
				height: 100%;
			"
		>
			<Offline_Petition endorsed={ endorsed } />
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