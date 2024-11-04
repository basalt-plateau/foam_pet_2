






<script>

import Versies_Trucks from '$lib/Versies/Trucks.svelte'
import { check_roomies_truck } from '$lib/Versies/Trucks'

import { suggest_petition } from './Trinket'

const suggest = async () => {
	const from_address_hexadecimal_string = ""
	
	await suggest_petition ({
		private_key: "",
		
		net_path: "",
		
		petition: {
			origin_address: Aptos_SDK.AccountAddress.from (
				Uint8Array_from_string (from_address_hexadecimal_string)
			),
			data: {
				function: "0x1::coin::transfer",
				typeArguments,
				functionArguments
			}
		}
	})
}


let versies_freight = {}
let versies_trucks_prepared = "no"
const on_seeds_truck_change = ({ freight: _freight, happening }) => {
	versies_freight = _freight;
	if (happening === "mounted") {
		versies_trucks_prepared = "yes"
	}
}

/*
	99caba6e28919a1ef5ada895a9e0b1093159f823c523eaf5eddf5cfdc3293e2f::Tholvi::ask_board_id
*/

</script>


<div
	style="
		width: 100%;
	"
>
	<Versies_Trucks on_change={ on_seeds_truck_change } />

	{#if versies_trucks_prepared === "yes"}
	<div
		style="
			box-sizing: border-box;
			height: 100%;
			width: 100%;
			
			padding: 1cm;
			
			display: flex;
			justify-content: center;
			align-items: center;
			
			flex-direction: column;
		"
	>
		<label class="label"
			style="
				width: 100%;
			"
		>
			<header
				style="
					margin: 0 auto;
					font-size: 2em;
					text-align: center;
				"
			>Private Key</header>
			
			<textarea 
				class="textarea p-4" 
				rows="1" 
				placeholder="" 
			/>
		</label>
		
		<div style="height: 1cm"></div>
	
		<label class="label"
			style="
				width: 100%;
			"
		>
			<header
				style="
					margin: 0 auto;
					font-size: 2em;
					text-align: center;
				"
			>Function ID</header>
			
			<div
				style="
					display: block;
					text-align: center;
					padding: 0.2cm 0;
				"
			>
				<span 
					class="badge variant-soft"
					style="
						display: inline-flex;
						position: relative;
						font-size: 1.2em;
						margin: 0 auto;
						text-align: center;
					"
				>
					<span>Example</span>
					<span class="badge variant-filled-surface">0x1::aptos_account::transfer</span>
				</span>
			</div>
			
			<textarea 
				class="textarea p-4" 
				rows="1" 
				placeholder="" 
			/>
		</label>
		
		<div style="height: 1cm"></div>
		
		<label class="label"
			style="
				width: 100%;
			"
		>
			<header
				style="
					margin: 0 auto;
					font-size: 2em;
					text-align: center;
				"
			>Arguments</header>

		</label>
		
		<div style="height: 1cm"></div>
		
		<label class="label"
			style="
				width: 100%;
			"
		>
			<header
				style="
					margin: 0 auto;
					font-size: 2em;
					text-align: center;
				"
			>Type Arguments</header>

		</label>
		
		<div style="height: 1cm"></div>
		
		<button type="button" class="btn variant-filled">Suggest</button>
	</div>
	{/if}
</div>