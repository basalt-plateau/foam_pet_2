

<script>

//
import { onMount, onDestroy } from "svelte"
//
//
import * as Extension_Winch from "$lib/Singles/Extension_Winch"
//

import Wallet_Plug from './Wallet_Plug/Tome.svelte'
import Milieus_Button from '$lib/Milieus/Button/Trinket.svelte'
import Versies_Truck from '$lib/Versies/Trucks.svelte'
import Extension_Winch_Ride from '$lib/Singles/Extension_Winch/Ride.svelte'


	

let Versies_Freight = false;
let Extension_Winch_Freight = false;
	
	

const obtain_wallet = ({ wallet }) => {
	console.log ("obtain_wallet:", { wallet });
	window.open (wallet.url, '_blank');
}

onMount (async () => {});
onDestroy (async () => {});

</script>



<div 
	style="
		width: 100%;
		max-width: 20cm;
		margin: 0 auto;
		
		height: 400px;
		
		display: flex;
		gap: 10px;
		flex-direction: column;
	"
>
	<Versies_Truck on_change={ ({ freight }) => { Versies_Freight = freight } } />
	<Extension_Winch_Ride on_change={ ({ pro_freight }) => { Extension_Winch_Freight = pro_freight; } } />
	{#if typeof Extension_Winch_Freight === "object"}
	{#if typeof Versies_Freight === "object"}
	
	<div 
		style="
			width: 100%;
			text-align: center;
		"
		class="card p-2"
	>
		<header
			style="
				display: flex;
				align-items: center;
				gap: 0.25cm;
				justify-content: center;
			"
		>
			<span>Aptos</span>
			<img src="/_Licensed/Aptos/aptos.png" style="width: 0.5cm; height: 0.5cm;">
			<span>Wallet Options</span>
		</header>
		<a 
			target="_blank"
			href="https://aptosfoundation.org"
		>https://aptosfoundation.org</a>
	</div>
	
	<div 
		style="
			width: 100%;
			text-align: center;
			
			display: grid;
			gap: 0.25cm;
		"
		class="card p-2"
	>
		<header
			style="
				display: flex;
				align-items: center;
				gap: 0.25cm;
				justify-content: center;
			"
		>
			<span><b>Petra</b> with <b>Keystone 3 Pro</b> (or perhaps a later version) is recommended.</span>
		</header>
		<div
			style="
				display: flex;
				align-items: center;
				gap: 0.25cm;
				justify-content: center;
			"
		>
			<div class="card p-2 variant-soft-primary">
				<a 
					target="_blank"
					href="https://petra.app"
				>https://petra.app</a>
			</div>
			<div class="card p-2 variant-soft-primary">
				<a 
					target="_blank"
					href="https://keyst.one"
				>https://keyst.one</a>
			</div>
		</div>
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
		<header>Extension Wallets</header>
	
		{#each Object.keys (Extension_Winch_Freight.stages) as stage_name }
		<Wallet_Plug 
			stage_name={ stage_name }
			stage={ Extension_Winch_Freight.stages [ stage_name ] }	
		/>		
		{/each}
	</div>	
	
	
	{#if typeof Versies_Freight.mode === "nurture"}
	<div 
		style="
			width: 100%;
			height: 400px;
			
			display: flex;
			flex-direction: column;
			align-items: center;
			gap: 10px;
		"
		class="card p-4"
	>
		<header>Offline Software Wallets</header>
	
		<Milieus_Button
			monitor={ "Bourgeoisie" }
		
			name={ "Bourgeoisie" }
			location={[ "Bourgeoisie" ]}
			is_open_location={[ "Bourgeoisie" ]}
		/>
	</div>
	{/if}
	{/if}
	
	{/if}
</div>	