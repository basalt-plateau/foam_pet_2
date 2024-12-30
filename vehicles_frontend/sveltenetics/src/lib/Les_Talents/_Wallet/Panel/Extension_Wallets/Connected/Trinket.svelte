

<script>




// getAccount ();
import { onMount, onDestroy } from "svelte"
import * as Extension_Winch from "$lib/Singles/Extension_Winch"		

import _get from 'lodash/get'
import { create_count_loop } from '$lib/PTO/APT/Count_Loop'



let APT_count = ""
let APT_count_imperfection = ""

let account_address;
let account_public_key;
//
let wallet_name;
let wallet_icon;
//
let network_name;
let network_address;
let network_chain_id;
const establish_vars = () => {
	try {
		console.info ("establish_vars connected");
		
		const stage_name = flourisher_freight.stage_name_connected;
		const stage = flourisher_freight.stages [ stage_name ];
		
		const account = stage.account;
		account_address = account.address;
		account_public_key = account.public_key;
		
		wallet_name = stage.name;
		wallet_icon = stage.icon;
		
		network_name = stage.network.name;
		network_address = stage.network.address;
		network_chain_id = stage.network.chain_id;		
		
		Count_Loop.play ({
			address_hexadecimal_string: account_address,
			net_path: network_address
		});
	}
	catch (imperfection) {
		console.info (imperfection.message);
	}	
}

const Count_Loop = create_count_loop ({
	on_change (packet) {
		if (packet.effective !== "yes") {
			APT_count_imperfection = "?"
			APT_count = ""
			return;
		}
		
		APT_count_imperfection = ""
		APT_count = packet.APT_count;
	}
});

const disconnect = () => {
	flourisher_freight.disconnect ();
}

let flourisher_freight = Extension_Winch.freight ();
let flourisher_monitor;
onMount (async () => {
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
		establish_vars ();
	});
	
	establish_vars ();
});
onDestroy (async () => {
	flourisher_monitor.stop ()
	Count_Loop.stop ()
});

</script>

<div
	style="
		display: flex;
		gap: 0.25cm;
		flex-direction: column;
	"
>
	<div class="card p-4">
		<button 
			type="button" 
			class="btn variant-filled"
			on:click={ disconnect }
		>Disconnect</button>
	</div>
	
	<div class="card p-4">
		<div
			style="
				display: flex;
				flex-direction: row;
				align-items: center;
				justify-content: left;
				gap: 10px;
			"
		>
			<img 
				src={ wallet_icon } 
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
			<span>{ wallet_name }</span>
		</div>
	</div>
	
	<div class="card p-4">
		<span class="badge variant-soft">APT</span>
		
		{#if APT_count_imperfection.length >= 1 }
		<span class="badge variant-filled-error">{ APT_count_imperfection }</span>
		{:else}
		<span>{ APT_count }</span>		
		{/if}
		
	</div>
	
	<div class="card p-4">
		<div>
			<span class="badge variant-soft">address</span>
			<span>{ account_address }</span>
		</div>
		<div>
			<span class="badge variant-soft">public key</span>
			<span>{ account_public_key }</span>
		</div>
	</div>

	
	<div class="card p-4">
		<div>network name: { network_name }</div>
		<div>network address: { network_address }</div>
		<div>network chain id: { network_chain_id }</div>
		
	</div>
</div>