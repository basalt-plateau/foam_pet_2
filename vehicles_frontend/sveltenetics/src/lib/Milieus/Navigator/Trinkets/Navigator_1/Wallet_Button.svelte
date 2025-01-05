
<script>

//
//
import { onMount, onDestroy } from 'svelte'
//
//
import * as Extension_Winch from "$lib/Singles/Extension_Winch"		
//
//


let wallet_address = ""
let wallet_provider = "?"

let mounted = "no"
let flourisher_freight = ""
let flourisher_monitor = ""
onMount (() => {
	flourisher_freight = Extension_Winch.freight ();
	flourisher_monitor = Extension_Winch.monitor (async ({
		original_freight,
		pro_freight, 
		//
		target,
		//
		property, 
		value
	}) => {
		flourisher_freight = pro_freight;
		ask_for_wallet_address ();
	});
	
	ask_for_wallet_address ();
	mounted = "yes"
});
onDestroy (() => {
	flourisher_monitor.stop ()
});


const ask_for_wallet_address = () => {
	try {
		if (flourisher_freight.stage_name_connected.length === 0) {
			return;
		}
		
		let stage = flourisher_freight.ask_for_stage ();
		
		let address = stage.account.address;
		if (address.substring (0,2) === "0x") {
			address = address.substring (2);
			address = address.toUpperCase ();
			wallet_address = address.substring (0,4) + ".." + address.substring (address.length - 4);
		}
		
		wallet_provider = flourisher_freight.stage_name_connected;
		
		return;
	}
	catch (imperfection) {
		console.error ("wallet address imperfection:", imperfection);
	}

	wallet_provider = "?";
	wallet_address = "?";
}



import Milieus_Button from '$lib/Milieus/Button/Trinket.svelte'

export let buttons_styles = {}

</script>

<Milieus_Button
	monitor="Wallet"

	name={ "Wallet" }
	
	location={[ "Wallet" ]}
	is_open_location={[ "Wallet" ]}
	
	style={ buttons_styles }
	
	use_slot="yes"
>
	{#if flourisher_freight.stage_name_connected.length >= 1 }
	<span
		style="
			display: flex;
			flex-direction: column;
			justify-content: center;
			align-items: center;
			
			transform: translateY(-4px);
		"
	>
		<span
			style="
				height: 1em;
				font-size: 0.75em;
			"
		>{ wallet_address }</span>
		<span
			style="
				height: 1em;
				font-size: 0.65em;
			"
		>{ wallet_provider }</span>
	</span>
	{:else}
	Wallet
	{/if}
</Milieus_Button>


