

<script>





////
//
import { onMount, onDestroy } from "svelte"
import _merge from 'lodash/merge'
//
import { has_field } from 'procedures/object/has_field'
//
//
//
import Wallet_Polytope from './Polytope/Tome.svelte'
import Extension_Wallets from './Extension_Wallets/Trinket.svelte'
//
////

import Wallet_Leaf from "./Leaf.svelte"
	


let polytope_modal;

const on_modal_change = () => {}



let polytope_established = "no"
const on_prepare = () => {
	polytope_modal.advance (({ freight }) => {
		return _merge ({}, freight, {
			showing: 'yes',
			
			name: 'Wallet Sensors',
			
			unfinished: {
				showing: 'no',
			},
			panel: {
				text: ''
			}
		});
		
		return freight;
	})
	
	polytope_established = "yup"
}



</script>


<Wallet_Polytope 
	bind:this={ polytope_modal }
	on_change={ on_modal_change }
	on_prepare={ on_prepare }
>
	<div slot="leaves"
		style="
			height: 100%;
			width: 100%;
		"
	>
		{#if polytope_established === "yup" }
		<Wallet_Leaf />		
		{/if}
	</div>
	
	<div slot="unfinished">
		<div>
			This is unfinished
		</div>
	</div>
</Wallet_Polytope>