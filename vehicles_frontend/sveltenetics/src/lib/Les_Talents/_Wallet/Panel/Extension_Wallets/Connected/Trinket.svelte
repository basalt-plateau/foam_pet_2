

<script>




// getAccount ();
import { onMount, onDestroy } from "svelte"
import * as Extension_Winch from "$lib/Singles/Extension_Winch"		

import _get from 'lodash/get'


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
		const bridge = flourisher_freight.bridge;
		console.log ({ bridge, flourisher_freight });
		
		const account = bridge.account;
		account_address = account.address;
		account_public_key = account.public_key;
		
		wallet_name = bridge.name;
		wallet_icon = bridge.icon;
		
		network_name = bridge.network.name;
		network_address = bridge.network.address;
		network_chain_id = bridge.network.chain_id;		
	}
	catch (imperfection) {
		console.info (imperfection.message);
	}	
}

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
});

let wallet_core = flourisher_freight.wallet_core;
console.info ({ wallet_core });

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
		<div>APT: </div>
	</div>
	
	<div class="card p-4">
		<div>address: { account_address }</div>
		<div>public key: { account_public_key }</div>
	</div>

	
	<div class="card p-4">
		<div>network name: { network_name }</div>
		<div>network address: { network_address }</div>
		<div>network chain id: { network_chain_id }</div>
		
	</div>
</div>