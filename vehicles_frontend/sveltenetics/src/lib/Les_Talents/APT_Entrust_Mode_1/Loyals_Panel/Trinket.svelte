

<script>


/*
	import APT_Entrust_Mode_1_Loyals_Panel from '$lib/Les_Talents/APT_Entrust_Mode_1/Loyals_Panel/Trinket.svelte'
*/

////
///
import { getModalStore } from '@skeletonlabs/skeleton';
import { TabGroup, Tab, TabAnchor } from '@skeletonlabs/skeleton';
import { AppRail, AppRailTile, AppRailAnchor } from '@skeletonlabs/skeleton';
import { onMount, onDestroy } from 'svelte';
//
//
import { parse_styles } from '$lib/trinkets/styles/parse.js';
//
//
import Transaction_Petition_Field from './Leaves/1_Transaction_Petition_Field/Trinket.svelte';
import Unsigned_Transaction_Trinket from './Leaves/2_Transaction_Petition/Trinket.svelte';
import Unsigned_Transaction_Signature_Trinket from './Leaves/3_Transaction_Signature_Field/Trinket.svelte';
import Signature_Verification_Trinket from './Leaves/4_Signature_Verification/Trinket.svelte'
import Signature_Trinket from './Leaves/5_Signature/Trinket.svelte'
//
//
import Unfinished from './Trinkets/Unfinished.svelte'
//
import { ConicGradient } from '@skeletonlabs/skeleton';
//
//\
//\\
import Leaf from '$lib/trinkets/Layout/Leaf/Trinket.svelte'
import { check_roomies_truck } from '$lib/Versies/Trucks'
import Radial_Progress from '$lib/trinkets/Progress/Radial/Trinket.svelte'
	
////
///
//	props
//
export let modal_store;
//
//\
//\\



import { 
	refresh_truck, 
	retrieve_truck, 
	monitor_truck,
	verify_land,
	destroy_truck
} from '$lib/Les_Talents/APT_Entrust_Mode_1/Loyals_Panel/Logistics/Truck'

let prepared = "no"
let Truck_Monitor;
let freight;
onMount (async () => {
	refresh_truck ()
	const Truck = retrieve_truck ()
	freight = Truck.freight; 
	
	verify_land ()
	calculate_next_button_text ()
	
	Truck_Monitor = monitor_truck ((_freight) => {
		freight = _freight;
		calculate_next_button_text ()
	})
	
	prepared = "yes"
});
onDestroy (() => {
	destroy_truck ()
});

let current_leaf = 1;
const mode = check_roomies_truck ().freight.mode;


const close_the_modal = () => {
	modal_store.close ();
}


let next_button_text = "Next";
let calculate_next_button_text = () => {
	if (freight.current.next === "yes") {
		next_button_text = "Next"
	}
	else if (freight.current.next === "no, last") {
		next_button_text = "Last"
	}
	else {
		next_button_text = "Unfinished"
	}
}

let panel_text = "Panel 1 of 5"
const write_panel_text = () => {
	panel_text = `Panel ${ current_leaf } of 5`
}

let go_back = () => {
	if (freight.current.back === "yes") {
		current_leaf -= 1
		write_panel_text ()
	}
}
let go_next = () => {
	// check if can go on
	if (freight.current.next === "yes") {
		current_leaf += 1
		write_panel_text ()
	}
	else {
		freight.unfinished_extravaganza.showing = "yes"
	}
}

</script>

{#if $modal_store [0] && prepared === "yes" }
<div 
	style="
		position: relative;
		top: 0;
		left: 0;
		padding: 0;
		width: 100vw;
		height: 100vh;
		
		overflow: hidden;
	"
>
	<div
		class="bg-surface-50-900-token border border-primary-500/30"
		style="
			display: flex;
			
			position: absolute;
			top: 0;
			left: 0;
			height: 100%;
			width: 100%;
			border-radius: 8px;
			
			overflow: hidden;
			
			flex-direction: column;
		"
	>
		<div
			style="
				position: absolute;
				top: 0;
				left: 0;
				right: 0;
				bottom: 0;
				width: 100%;
				
				box-sizing: border-box;
				padding: 0 10px 0;
				
				overflow: scroll;
			"
		>
			<Leaf>
				<div style="height: 2cm" />			
				{#if current_leaf === 1}
					<Transaction_Petition_Field />
				{:else if current_leaf === 2}
					<Unsigned_Transaction_Trinket />
				{:else if current_leaf === 3}
					<Unsigned_Transaction_Signature_Trinket />
				{:else if current_leaf === 4}
					<Signature_Verification_Trinket />
				{:else if current_leaf === 5}
					<Signature_Trinket />
				{/if}
				<div style="height: 5cm" />
			</Leaf>
		</div>

		<Unfinished />

		

		<footer
			class="bg-surface-50-900-token border border-primary-500/30"
			style="
				position: absolute;
				bottom: 0;
				left: 0;
				width: 100%;
				height: 70px;
			"
		>
			<hr class="!border-t-2" />
				
			<div 
				class="modal-footer"
				style="
					display: flex;
					align-items: center;
					justify-content: space-between;
				
					position: absolute;
					bottom: 0;
					left: 0;
					width: 100%;
					padding: 10px;
				"
			>
				<button 
					class="btn bg-gradient-to-br variant-gradient-primary-secondary"
					on:click={ close_the_modal }
				>
					Close
				</button>
				
				<div>{ panel_text }</div>
				
				{#if mode === "nurture" }
				<div
					style="padding: 10px; margin-left: 5cm; position: relative"
				>
					<input bind:value={ current_leaf } type="number" />
				</div>
				{/if}
				
				<div style="display: flex">
					<button 
						modal-back
					
						disabled={ freight.current.back != "yes" }
						on:click={ go_back }
						
						class="btn bg-gradient-to-br variant-gradient-primary-secondary"
					>
						Back
					</button>
					<div style="width: 20px"></div>
					<button 
						modal-next
					
						disabled={ next_button_text === "Last" }
						on:click={ go_next }
						
						class="btn bg-gradient-to-br variant-gradient-primary-secondary"
					>
						{#if next_button_text === "Unfinished" }
						<Radial_Progress />
						
						{/if}
						<span>
							{ next_button_text }
						</span>
					</button>
				</div>
			</div>
		</footer>
	</div>
</div>
{/if}