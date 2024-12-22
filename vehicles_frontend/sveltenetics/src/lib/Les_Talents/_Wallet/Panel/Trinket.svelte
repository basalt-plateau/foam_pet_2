

<script>





///
//
import { onMount, onDestroy } from "svelte"
import { Autocomplete } from '@skeletonlabs/skeleton';
import { popup } from '@skeletonlabs/skeleton';
import _merge from 'lodash/merge'
//
//
import { has_field } from 'procedures/object/has_field'
//
//
//
import Wallet_Polytope from './Wallet_Polytope/Fabric.svelte'
//
//
///

import { ask_for_flourisher_freight, ask_for_flourisher_monitor } from "$lib/PTO/Flourisher"
	
	


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


let is_connected = "perhaps"
let wallets_show = []
/*
	isAIP62Standard
	isSignTransactionV1_1
*/


let le_wallet_link = "";
let le_signatory = ""
let mounted = "no"


let flourisher_monitor = ""
let flourisher_freight = ""
onMount (async () => {
	flourisher_freight = ask_for_flourisher_freight ();
	flourisher_monitor = ask_for_flourisher_monitor (async ({
		original_freight,
		pro_freight, 
		//
		target,
		//
		property, 
		value
	}) => {
		flourisher_freight = pro_freight;
	});
	
	
	/*
	
	const { wallet_link, signatory } = await create_wallet_link ();
	le_wallet_link = wallet_link;
	le_signatory = signatory;
	
	console.info ({ wallet_link });	
	is_connected = le_wallet_link.isConnected () ? "yup" : "no";
	
	wallets_show = signatory.wallets_list;
	
	wallets_show.forEach (wallet => {
		console.log ({ 
			name: wallet.name, 
			readyState: wallet.readyState,
			wallet 
		});
	});
	*/
	
	mounted = "yup"
});

const obtain_wallet = ({ wallet }) => {
	console.log ("obtain_wallet:", { wallet });
	window.open (wallet.url, '_blank');
}


const connect_wallet = async ({ wallet }) => {
	const wallet_name = wallet.name;
	
	console.log ("connect_wallet:", { wallet });
	
	//
	//	connect with wallet_link
	//
	//
	await le_wallet_link.connect (wallet_name);
	
	
	console.log ("wallet name:", wallet_name);
	
	const proceeds = await le_wallet_link.connect (wallet_name);
	
	
	console.log ({ proceeds });
	is_connected = le_wallet_link.isConnected () ? "yup" : "no";
	console.log ({ is_connected });
	
	
	//	Add to localStorage
	//
	localStorage.setItem ("AptosWalletName", wallet_name);
}


onDestroy (() => {
	flourisher_monitor.stop ()
})

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
					{#each flourisher_freight.wallets_list as wallet}
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
						
						{#if true }
						<span class="badge variant-soft-primary">{ wallet.readyState }</span>
						{/if}
						
						{#if false && wallet.isSignTransactionV1_1 }
						<span class="badge variant-soft-primary">Is Sign TransactionV1_1</span>
						{/if}
						
						{#if wallet.isAIP62Standard }
						<span class="badge variant-soft-primary">AIP 62 Standard</span>
						{/if}


						<button 
							type="button" 
							class="btn btn-sm variant-filled"
							on:click={() => {
								connect_wallet ({ wallet });
							}}
						>Connect</button>	

						<div>
							{#if wallet.readyState === "Installed" }
							<button 
								type="button" 
								class="btn btn-sm variant-filled"
								on:click={() => {
									connect_wallet ({ wallet });
								}}
							>Connect</button>						
							
							{:else if wallet.readyState === "NotDetected" }
							<button 
								type="button" 
								class="btn btn-sm variant-filled"
								on:click={() => {
									obtain_wallet ({ wallet });
								}}
							>Obtain</button>
							{/if}
						</div>
					</div>
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