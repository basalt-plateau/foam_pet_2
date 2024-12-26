

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
let network_URL;
let network_chain_id;
const establish_vars = () => {
	try {
		const wallet_core = flourisher_freight.wallet_core;
		
		const account = wallet_core.account;
		account_address = account.address;
		account_public_key = account.publicKey;
		
		wallet_name = wallet_core.wallet.name;
		wallet_icon = wallet_core.wallet.icon;
		
		network_name = wallet_core.network.name;
		network_URL = wallet_core.network.url;
		network_chain_id = wallet_core.network.chainId;		
	}
	catch (imperfection) {
		console.error (imperfection);
	}	
}

const disconnect = () => {
	flourisher_freight.wallet_core.disconnect ();
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
		<button type="button" class="btn variant-filled"
		
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
		<div>network URL: { network_URL }</div>
		<div>network chain id: { network_chain_id }</div>
		
	</div>
</div>