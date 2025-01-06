

<script>

import _get from 'lodash/get'

import Versies_Truck from '$lib/Versies/Trucks.svelte'
import Extension_Winch_Ride from '$lib/Singles/Extension_Winch/Ride.svelte'

let Versies_Freight = false
let Extension_Winch_Freight = false

</script>

<div>
	<Versies_Truck on_change={ ({ freight }) => { Versies_Freight = freight } } />	
	<Extension_Winch_Ride on_change={ ({ pro_freight }) => { Extension_Winch_Freight = pro_freight; } } />
	
	{#if 
		typeof Versies_Freight === "object" && 
		typeof Extension_Winch_Freight === "object" &&
		Extension_Winch_Freight.stage_name_connected.length >= 1
	}
	<div
		style="
			display: flex;
			align-items: center;
			justify-content: center;
		"
	>
		{#if Versies_Freight.dapp_wallet_cohesion.chain_id !== "yes" }
		<div class="card p-2 variant-filled-error">
			<div class="card p-2 variant-filled-error">
				<span>The <b>Dapp</b> and <b>Wallet</b> are not connected to the same Chain ID.</span>
			</div>
		</div>
		{:else}
		<div class="card p-4 variant-filled-primary">
			<span>😁 The <b>Dapp</b> and <b>Wallet</b> are connected to the same Chain ID.</span>
		</div>
		{/if}
	</div>
	{/if}
</div>

