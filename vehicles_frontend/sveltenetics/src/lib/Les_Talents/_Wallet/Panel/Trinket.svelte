

<script>





////
//
import { onMount, onDestroy } from "svelte"
import { Autocomplete } from '@skeletonlabs/skeleton';
import { popup } from '@skeletonlabs/skeleton';
import { RadioGroup, RadioItem } from '@skeletonlabs/skeleton';
//
import _merge from 'lodash/merge'
//
import { has_field } from 'procedures/object/has_field'
//
//
import * as Extension_Winch from "$lib/Singles/Extension_Winch"
import Perfume from "$lib/Perfume/Trinket.svelte"
import Extension_Winch_Ride from '$lib/Singles/Extension_Winch/Ride.svelte'
//
//
import Wallet_Polytope from './Wallet_Polytope/Fabric.svelte'
import Extension_Wallets from './Extension_Wallets/Trinket.svelte'
//
////


let Extension_Winch_Freight = false


let polytope_modal;
const prepare = () => {
	return {
		name: "Transfer",
		next: "yes",
		back: "yes"
	}
}
const on_modal_change = () => {}



let polytope_established = "no"
const on_prepare = () => {
	polytope_modal.advance (({ freight }) => {
		return _merge ({}, freight, {
			showing: 'yes',
			
			/*
				Wallet..
					Event Horizon
					Frontier
					
					4D:
						Duoprism
					
						Hypersphere
						
						Ellipsoid
						
					Trigintaduonion
					
					
					Tunnels:
						.Spin
						
						.Sensors
						
						* Send Wish
						* Send Consent
			*/
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


let is_connected = "perhaps"
let wallets_show = []



let le_wallet_link = "";
let le_signatory = ""


const obtain_wallet = ({ wallet }) => {
	console.log ("obtain_wallet:", { wallet });
	window.open (wallet.url, '_blank');
}

let mounted = "no"
onMount (async () => {
	mounted = "yup"
});

let leaf = "Extensions"

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
		<Extension_Winch_Ride on_change={ ({ pro_freight }) => { Extension_Winch_Freight = pro_freight; } } />
		{#if typeof Extension_Winch_Freight === "object"}	
		{#if polytope_established === "yup" && mounted === "yup" }
		<div
			style="
				width: 100%;
				
				padding: 0.25cm;
				
				display: flex;
				justify-content: center;
				align-items: center;
				
				flex-direction: column;
				
				gap: 0.25cm;
			"
		>
			<div>
				<RadioGroup>
					<RadioItem 
						bind:group={leaf} 
						name="justify" 
						value={ "Extensions" }
					>Extensions</RadioItem>
					<RadioItem 
						bind:group={leaf} 
						name="justify" 
						value={ "Perfume" }
					>Perfume</RadioItem>
				</RadioGroup>
			</div>
		
			{#if leaf === "Extensions" }
			<Extension_Wallets />
			{:else if leaf === "Perfume" }
			<Perfume />
			{/if}
		</div>
		{/if}
		{/if}
	</div>
	
	<div slot="unfinished">
		<div>
			This is unfinished
		</div>
	</div>
</Wallet_Polytope>