

<script>





///
//
import { onMount } from "svelte"
import { Autocomplete } from '@skeletonlabs/skeleton';
import { popup } from '@skeletonlabs/skeleton';
import _merge from 'lodash/merge'
//
//
import { has_field } from 'procedures/object/has_field'
//
//
import { create_wallet_link } from "$lib/PTO/Signatory"
//
//
import Wallet_Polytope from './Wallet_Polytope/Fabric.svelte'
//
//
///


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
			
			name: 'Connet Wallet',
			
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

const allowed_wallets = {
	"Nightly": "",
	"Petra": "",
	"Pontem Wallet": ""
}

let is_connected = "perhaps"
let wallets_show = []
/*
	isAIP62Standard
	isSignTransactionV1_1
*/
/*
	0: "name"
	1: "url"
	2: "icon"
	3: "provider"
	4: "connect"
	​
	5: "disconnect"
	​
	6: "network"
	​
	7: "account"
	​
	8: "signAndSubmitTransaction"
	​
	9: "signMessage"
	​
	10: "onAccountChange"
	​
	11: "onNetworkChange"
	​
	12: "signTransaction"
	​
	13: "openInMobileApp"
	​
	14: "changeNetwork"
	​
	15: "readyState"
	​
	16: "isAIP62Standard"
	​
	17: "isSignTransactionV1_1"
*/

let le_wallet_link = "";
let le_signatory = ""
let mounted = "no"
onMount (() => {
	const { wallet_link, signatory } = create_wallet_link ();
	le_wallet_link = wallet_link;
	le_signatory = signatory;
	
	console.info ({ wallet_link });	
	is_connected = le_wallet_link.isConnected () ? "yup" : "no";
	
	wallets_show = le_wallet_link._all_wallets;
	
	mounted = "yup"
});

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
		{#if polytope_established === "yup" && mounted === "yup" }
		<div
			style="
				width: 100%;
				
				padding: 1cm 1cm 5cm;
				
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
			>Connet Wallet</header>
		
			
			<span class="badge variant-filled">
				<span class="badge variant-filled">Connected:</span>
				<span class="badge variant-filled-primary">{ is_connected }</span>
			</span>
			
			<div 
				style="
					width: 100%;
					height: 400px;
					
					display: flex;
					gap: 10px;
					flex-direction: column;
				"
				class="card p-2"
			>
				
				<div 
					style="
						width: 100%;
						text-align: center;
					"
					class="card p-2 variant-soft-primary"
				>
					<header>Wallet Options</header>
				</div>
				
				<div 
					style="
						width: 100%;
						height: 400px;
						
						display: flex;
						flex-direction: column;
						align-items: center;
						gap: 10px;
					"
					class="card p-2"
				>
					{#each wallets_show as wallet}
					{#if has_field (allowed_wallets, wallet.name) }
					<div
						style="
							display: flex;
							flex-direction: row;
							align-items: center;
							justify-content: space-between;
							gap: 10px;
							
							width: 100%;
						"
						class="card p-2"
					>
						<div
							style="
								display: flex;
								flex-direction: row;
								align-items: center;
								justify-content: left;
								gap: 10px;
								
								width: 100%;
							"
						>
							<img 
								src={ wallet.icon } 
								style="
									height: 0.75cm;
									width: 0.75cm;
									
									display: flex;
									flex-direction: row;
									align-items: center;
									justify-content: space-between;
									gap: 10px;
								"
							/>
							<p>{ wallet.name }</p>
						</div>
						<span class="badge variant-soft-primary">{ wallet.readyState }</span>
						
						{#if wallet.isSignTransactionV1_1 }
						<span class="badge variant-soft-primary">Is Sign TransactionV1_1</span>
						{/if}
						
						{#if wallet.isAIP62Standard }
						<span class="badge variant-soft-primary">AIP 62 Standard</span>
						{/if}
						
						{#if wallet.readyState === "NotDetected" }
						<div>
							<button 
								type="button" 
								class="btn btn-sm variant-filled"
								on:click={() => {
									
								}}
							>connect</button>						
						</div>
						{:else if wallet.readyState === "NotDetected." }
						
						{/if}
					</div>
					{/if}
					{/each}
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
</Wallet_Polytope>