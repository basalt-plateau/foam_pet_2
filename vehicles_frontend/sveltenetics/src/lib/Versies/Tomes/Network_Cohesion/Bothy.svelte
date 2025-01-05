

<script>

import _get from 'lodash/get'

import Versies_Truck from '$lib/Versies/Trucks.svelte'
let Versies_Freight = false


</script>

<div>
	<Versies_Truck on_change={ ({ freight }) => { Versies_Freight = freight } } />	
	{#if 
		typeof Versies_Freight === "object"
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
				<span>The <b>Dapp</b> and <b>Extension</b> are not connected to the same network.</span>
			</div>
		</div>
		{:else}
		<div class="card p-4 variant-filled-primary">
			<span>😁 The <b>Dapp</b> and <b>Extension</b> are connected to the same network.</span>
		</div>
		{/if}
	</div>
	{/if}
</div>

