

<script>


//\
//
import { onMount, onDestroy } from 'svelte'
//
import * as AptosSDK from "@aptos-labs/ts-sdk";
//
//
import Net_Choices_with_Text from '$lib/PTO/Nets/Choices_with_Text/Trinket.svelte'
import Leaf from '$lib/trinkets/Layout/Leaf/Trinket.svelte'
//
///

import Versies_Truck from '$lib/Versies/Trucks.svelte'
let Versies_Freight = false

let net_prepare = () => {
	return {
		net_name: "mainnet"
	}
};
let every_net_enhance = ({
	net_name,
	net_path,
	net_connected,
	chain_id
}) => {
	console.info ('every_net_enhance', {
		net_name,
		net_path,
		chain_id
	})
	
	Versies_Freight.net_path = net_path
	Versies_Freight.net_name = net_name
	Versies_Freight.aptos = new AptosSDK.Aptos (new AptosSDK.AptosConfig ({		
		fullnode: net_path,
		network: AptosSDK.Network.CUSTOM
	}));
};



</script>


<div
	class="card p-4"
	style="
		display: flex;
		align-items: center;
		justify-content: center;
	"
>
	<Versies_Truck on_change={ ({ freight }) => { Versies_Freight = freight } } />
	{#if typeof Versies_Freight === "object"}
	<Net_Choices_with_Text 
		prepare={ net_prepare }
		every_enhance={ every_net_enhance }
	/>
	{/if}
</div>