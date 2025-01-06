

<script>



////
// 
import { onMount, onDestroy } from "svelte"
import _get from 'lodash/get'
//
//
import * as Extension_Winch from "$lib/Singles/Extension_Winch"		
import { create_count_loop } from '$lib/PTO/APT/Count_Loop'
//
////
import { address_to_hexadecimal } from "$lib/PTO/Address/to_hexadecimal"


import Network_Cohesion from "$lib/Versies/Tomes/Network_Cohesion/Bothy.svelte"
import Address_Qualities_Trinket from '$lib/trinkets/Address_Qualities/Trinket.svelte'

let origin_address = {
	effective: "no",
	address_hexadecimal_string: "",
	exception: ""
}

//
// This is for electing the original value of the trinket.
//
//
let address_trinket = ""




let APT_count = ""
let APT_count_imperfection = ""

let account_address;
$: {
	console.log ("account address changed", typeof address_trinket === "object", account_address);
	
	let _account_address = account_address;
	if (typeof address_trinket === "object") { 
		address_trinket.change_address_hexadecimal_string (account_address);
	}
}

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
		account_address = address_to_hexadecimal (account.address);
		account_public_key = address_to_hexadecimal (account.public_key);
		
		wallet_name = stage.name;
		wallet_icon = stage.icon;
		
		network_name = stage.network.name;
		network_address = stage.network.address;
		network_chain_id = stage.network.chain_id;		
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

</script>

<style>

[break-letters] {
	word-break: break-all;
}

</style>

<div
	style="
		display: flex;
		gap: 0.25cm;
		flex-direction: column;
		
		max-width: 40cm;
		width: 100%;
		
		margin: 0 auto;
	"
>
	<Network_Cohesion />

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
			<span class="badge variant-soft">Wallet Name</span>
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
		<Address_Qualities_Trinket 
			name="Address"

			bind:this={ address_trinket }
			
			has_field="no"
			
			on_change={({
				effective,
				address_hexadecimal_string,
				exception
			}) => {
				origin_address.effective = effective;
				origin_address.address_hexadecimal_string = address_hexadecimal_string;
				origin_address.exception = exception;
			}}
			
			on_prepare={() => {
				if (typeof account_address === "string" && account_address.length >= 1) {
					address_trinket.change_address_hexadecimal_string (account_address)
				}
			}}
		/>	
	</div>
		
	<div class="card p-4">
		<div>
			<span class="badge variant-soft">public key</span>
			<span break-letters>{ account_public_key }</span>
		</div>
	</div>

	
	<div class="card p-4">
		<header
			style="
				text-align: center;
				font-size: 1.5em;
			"
		>Transaction Petitions Address</header>
		<p
			style="
				text-align: center;
				font-size: 1em;
			"
		>This is where transaction petitions are sent.</p>
	
		<div>
			<span class="badge variant-soft">network name</span>
			<span>{ network_name }</span>
		</div>
		<div>
			<span class="badge variant-soft">network address</span>
			<span break-letters>{ network_address }</span>
		</div>
		<div>
			<span class="badge variant-soft">network chain id</span>
			<span>{ network_chain_id }</span>
		</div>
	</div>
	
	<div class="card p-4">
		<button 
			type="button" 
			class="btn variant-filled"
			on:click={ disconnect }
		>Disconnect</button>
	</div>
</div>