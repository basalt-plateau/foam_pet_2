



<script>

import { onMount, onDestroy } from 'svelte'
import * as Mercy_Truck from '$lib/Les_Talents/Mercy/Panel/_Truck/index.js'
import * as Extension_Winch from "$lib/Singles/Extension_Winch"

import Mercy_Sailboat from '$lib/Les_Talents/Mercy/Panel/_Truck/Sailboat.svelte'

import * as Aptos_SDK from "@aptos-labs/ts-sdk";
import { Uint8Array_from_string } from '$lib/taverns/hexadecimal/Uint8Array_from_string'

import Petition_APT_Button from "$lib/Singles/Extension_Winch/Petition/APT_Button.svelte"
	

const build_transaction = async () => {
	const aptos = new Aptos_SDK.Aptos (new Aptos_SDK.AptosConfig ({		
		fullnode: net_path,
		network: Aptos_SDK.Network.CUSTOM
		// client: { provider: custom_client }
	}));

	const from_address = Aptos_SDK.AccountAddress.from (
		Uint8Array_from_string (from_address_hexadecimal_string)
	);
	const to_address = Aptos_SDK.AccountAddress.from (
		Uint8Array_from_string (to_address_hexadecimal_string)
	);

	const the_function = "0x1::aptos_account::transfer"
	const sender = from_address;
	const functionArguments = [
		to_address,
		amount
	]
	
	const TP_AO = await aptos.transaction.build.simple ({
		sender: Aptos_SDK.AccountAddress.from (
			Uint8Array_from_string (from_address_hexadecimal_string)
		),
		data: {
			function: "0x1::aptos_account::transfer",
			typeArguments: [],
			functionArguments: [
				Aptos_SDK.AccountAddress.from (
					Uint8Array_from_string (to_address_hexadecimal_string)
				),
				amount
			]
		}
	});
}

let MS_Freight = false
let join = () => {
	console.info ("join");
	
}
let establish = async () => {
	console.info ("establish", MS_Freight.address_establish);
	
	console.log ("flourisher_freight:", { flourisher_freight });
	console.log ("wallet:", Extension_Winch.wallet)
	
	const wallet = flourisher_freight.wallet_core._wallet;
	console.log ("wallet:", wallet)
	
	// Extension_Winch.wallet
	
	let mercyverse = "10000000000000000000000000000000000000000000000000000000000000000000000000000";
	
	flourisher_freight.send_to_extension ({ petition: {} });
	return;
	
	

	/*
		signAndSubmitTransaction:
		https://github.com/aptos-labs/aptos-wallet-adapter/blob/main/packages/wallet-adapter-core/src/AIP62StandardWallets/WalletStandard.ts#L59C9-L59C33
	*/
	try {
		/*
		const result = await wallet.signAndSubmitTransaction ({
			function: "896E4313770A409F4528C410336D9B324E33AD1CA1A24032A7CC36F1AEED58E5::Merci_Harvest::do_nothing",
			type_arguments: [],
			arguments: []
		});
		*/
		/*
		const tx = {
			sender: account,
			data: {
				function: "0x1::aptos_account::transfer",
				functionArguments: [ 
					"896E4313770A409F4528C410336D9B324E33AD1CA1A24032A7CC36F1AEED58E5", 
					1
				]
			}
		};
		*/
		const origin_address = (await wallet.account ()).substring (2);
		console.log ({ origin_address });
		
		const aptos = new Aptos_SDK.Aptos (new Aptos_SDK.AptosConfig ({		
			fullnode: "https://api.devnet.aptoslabs.com/v1",
			network: Aptos_SDK.Network.CUSTOM
		}));
		
		// const origin_address = "896E4313770A409F4528C410336D9B324E33AD1CA1A24032A7CC36F1AEED58E5"
		const to_address = "896E4313770A409F4528C410336D9B324E33AD1CA1A24032A7CC36F1AEED58E6"
		
		
		const tx = await aptos.transaction.build.simple ({
			sender: Aptos_SDK.AccountAddress.from (
				Uint8Array_from_string (origin_address)
			),
			data: {
				function: "0x1::aptos_account::transfer",
				typeArguments: [],
				functionArguments: [
					Aptos_SDK.AccountAddress.from (
						Uint8Array_from_string (to_address)
					),
					"100000"
				]
			}
		});
		
		console.log ({ tx });
		
		await wallet.signAndSubmitTransaction (tx);
	} 
	catch (imperfection) {
		console.log (imperfection);
	}
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
	});
});
onDestroy (async () => {
	flourisher_monitor.stop ()
});





</script>

<div
	style="
		height: 100%;
		overflow: auto;
		width: 100%;
		max-width: 28cm;
	"
>
	<Mercy_Sailboat on_change={ ({ pro_freight }) => { MS_Freight = pro_freight; } } />
	{#if typeof MS_Freight === "object"}
	<div
		style="
			box-sizing: border-box;
			width: 100%;
			
			padding: 1cm;
			
			display: flex;
			gap: 0.2cm;
			
			flex-direction: column;
		"
	>
		<div class="card p-4"
			style="
				width: 100%;
				text-align: center;
			"
		>
			<header
				style="
					font-size: 3em;
				"
			>Mercy</header>
		</div>
		
		<div class="card p-4"
			style="
				width: 100%;
				text-align: center;
			"
		>
			<button 
				on:click={ establish }
				type="button" 
				class="btn variant-filled"
			>Establish</button>
		</div>
		
		<div
			style="
				display: flex;
				gap: 1em;
			
				width: 100%;
				text-align: center;
			"
		>
			<div 
				style="
					width: 100%;
					text-align: center;
				"
				class="card p-4"
			>			
				<Petition_APT_Button
					button_text="Buy 1 Membership Pass"
					APT="0"
					clicked={ join }
				/>
				
				<Petition_APT_Button
					button_text="Leave"
					APT="0"
					clicked={ join }
				/>
			</div>
		</div>
		
		<div
			style="
				display: flex;
				gap: 1em;
			
				width: 100%;
				text-align: center;
			
				width: 100%;
				text-align: center;
			"
		>
			<div class="card p-4"
				style="
					width: 100%;
					text-align: center;
				"
			>
				<button 
					type="button" 
					class="btn variant-filled"
				>Send</button>
				
				<button 
					type="button" 
					class="btn variant-filled"
				>Receive</button>
			</div>
		</div>
		
		<div class="card p-4"
			style="
				width: 100%;
				text-align: center;
			"
		>
			<button type="button" class="btn variant-filled">Buy Mercy</button>
			
			<div class="card p-4 variant-soft-primary"
				style="
					margin: 1cm 0;
					width: 100%;
					text-align: center;
				"
			>
				<h1
					style="
						margin: 1cm 0;
					"
				>Sales</h1>
			
				<ol class="list">
					<li>
						<span class="badge-icon p-4 variant-filled-primary">1.</span>
						<span class="flex-auto badge p-4 variant-filled-primary">1 Mercy for 1 APT</span>
					</li>
				</ol>
			</div>
			
			<button type="button" class="btn variant-filled">Sell Mercy</button>
			
		</div>
		
		
	</div>
	{/if}
</div>

