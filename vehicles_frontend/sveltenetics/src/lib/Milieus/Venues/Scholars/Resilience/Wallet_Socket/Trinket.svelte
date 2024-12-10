

<script>


import { onMount } from "svelte"

import Leaf from '$lib/trinkets/Layout/Leaf/Trinket.svelte'
// import Wallet_Socket from '$lib/PTO/Wallet_Socket/Trinket.svelte'
// <Wallet_Socket />


import Versies_Truck from '$lib/Versies/Trucks.svelte'
let Versies_Freight = false
$: {
	if (typeof Versies_Freight === "object") {
		console.log ("Versies Freight", { Versies_Freight });
	}
}




import { create_wallet_link } from "$lib/PTO/Signatory"
const wallet_link = create_wallet_link ();


</script>



<Leaf>
	<Versies_Truck on_change={ ({ freight }) => { Versies_Freight = freight } } />
	
	{#if typeof Versies_Freight === "object"}
	<div class="card p-4 variant-filled-surface">
		<header>Wallet Socket</header>
	
		
	</div>
	{/if}
</Leaf>