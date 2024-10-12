




<script>

/*
	@ Features
		@ Theme
	
		@ Attributes
		@ Characteristics
	
		@ Themes
		@ Rules
		@ Modes

	@ Plays
		@ Rules
		@ Theme
			@ Palette
*/

//\
//

import { onMount, onDestroy } from 'svelte'
//
import * as AptosSDK from "@aptos-labs/ts-sdk";
//
//
import Net_Choices_with_Text from '$lib/PTO/Nets/Choices_with_Text/Trinket.svelte'
import Panel from '$lib/trinkets/panel/trinket.svelte'
import Leaf from '$lib/trinkets/Layout/Leaf/Trinket.svelte'
import { check_roomies_truck, monitor_roomies_truck } from '$lib/Versies/Trucks'
import Refresh_Browser_Storage from '$lib/Versies/Rules/Refresh_Browser_Storage.svelte'
//
import Slang_Toggle from '$lib/trinkets/Slang/Toggle.svelte'
import Scholars_Trucks from '$lib/Versies/Trucks.svelte'
//
///

import Beauty from './Trinkets/Beauty.svelte'
import Commas from './Trinkets/Commas.svelte'


let seeds_freight = {}
let seeds_trucks_prepared = "no"
const on_seeds_truck_change = ({ freight: _freight, happening }) => {
	seeds_freight = _freight;
	if (happening === "mounted") {
		seeds_trucks_prepared = "yes"
	}
}


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
	
	seeds_freight.net_path = net_path
	seeds_freight.net_name = net_name
	seeds_freight.aptos = new AptosSDK.Aptos (new AptosSDK.AptosConfig ({		
		fullnode: net_path,
		network: AptosSDK.Network.CUSTOM
	}));
};



let mounted = "no"
onMount (() => {
	mounted = "yes"
});


</script>

<style>

@media (max-width: 600px) {
    .latest-block-panel {
		flex-direction: column !important;
	}
}
a {
	line-height: 110%;
}

</style>

<svelte:head>
	<title>Features</title>
	<meta name="description" content="Features" />
</svelte:head>

<Leaf>
	<Scholars_Trucks on_change={ on_seeds_truck_change } />
	{#if seeds_trucks_prepared === "yes" && mounted === "yes" }
	<div>		
		<div
			class="card p-4"
			style="
				display: flex;
				align-items: center;
				justify-content: center;
			"
		>
			<Net_Choices_with_Text 
				prepare={ net_prepare }
				every_enhance={ every_net_enhance }
			/>
		</div>
		
		<div style="height: 0.2cm"></div>
		
		<Slang_Toggle />
		
		<div style="height: 0.2cm"></div>
		
		<Beauty />
		
		<div style="height: 0.2cm"></div>
		
		<Commas />
		
		<div style="height: 0.2cm"></div>
		
		<Refresh_Browser_Storage />
		
		<div style="height: 4cm"></div>
	</div>
	{/if}
</Leaf>
