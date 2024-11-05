






<script>

import * as Aptos_SDK from "@aptos-labs/ts-sdk";

import Versies_Trucks from '$lib/Versies/Trucks.svelte'
import { check_roomies_truck } from '$lib/Versies/Trucks'

import { suggest_petition } from './Trinket'
import { SlideToggle } from '@skeletonlabs/skeleton';



let fonction_type = "Run"
let fonction = "265b37de65ef8e91d5592c32508673ec9c1ede4b40a2e04598d32ba818102b3e::Bothy_Platform::address_of_signer"
let private_key_hexadecimal_string = "341625349eadbc8f9eadbc162359cbe9dabc8f9eadbc162349eadbc8f9eacb61"
let origin_address_hexadecimal_string = "265b37de65ef8e91d5592c32508673ec9c1ede4b40a2e04598d32ba818102b3e"
let is_legacy_address_boolean = false;

let show_proceeds = ""

export const open_a_panel = () => {}

const suggest = async () => {
	const petition = {
		data: {
			function: fonction,
			typeArguments: [],
			functionArguments: []
		}
	}
	
	if (fonction_type === "Run") {
		petition.sender = Aptos_SDK.AccountAddress.from (
			Uint8Array_from_string (origin_address_hexadecimal_string)
		)
	}
	
	// 
	
	const net_path = versies_freight.net_path;
	
	// console.log ({ versies_freight });
	
	
	const { proceeds } = await suggest_petition ({
		
		is_legacy_address: is_legacy_address_boolean ? "yes" : "no",
		
		net_path,
		
		fonction_type,
		
		private_key_hexadecimal_string,
		petition
	});
	
	console.info ({ proceeds });
	
	show_proceeds = proceeds;
	
	
	// open_a_panel ({ panel_name: "" })
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
		box-sizing: border-box;
		height: 100%;
		width: 100%;
		
		padding: 2cm 0;
		
		overflow-y: scroll;
	"
>
	<Versies_Trucks on_change={ on_seeds_truck_change } />

	{#if versies_trucks_prepared === "yes"}
	<div 
		class="card p-4"
		style="
			width: 100%;
		"
	>
		<label class="label">
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
				bind:value={ fonction }
			
				class="textarea p-4" 
				rows="1" 
				placeholder="" 
			/>
		</label>
	</div>
	
	<div style="height: 1cm"></div>
	
	<div 
		class="card p-4"
		style="
			width: 100%;
		"
	>
		<label class="label">
			<header
				style="
					margin: 0 auto;
					font-size: 2em;
					text-align: center;
				"
			>Fonction Type</header>
		</label>
	
		<select 
			class="select"
			bind:value={ fonction_type }
		>
			<option value="Run">Run</option>
			<option value="View">View</option>
		</select>
	</div>
	
	{#if fonction_type === "Run" }
	<div style="height: 1cm"></div>
	<div 
		class="card p-4"
		style="
			width: 100%;
		"
	>
		<label class="label">
			<header
				style="
					margin: 0 auto;
					font-size: 2em;
					text-align: center;
				"
			>Private Key</header>
			
			<textarea 
				bind:value={ private_key_hexadecimal_string }
				class="textarea p-4" 
				rows="1" 
				placeholder="" 
			/>
		</label>
		
		<label class="label">
			<header
				style="
					margin: 0 auto;
					font-size: 2em;
					text-align: center;
				"
			>Origin Address</header>
			
			<textarea 
				bind:value={ origin_address_hexadecimal_string }
				class="textarea p-4" 
				rows="1" 
				placeholder="" 
			/>
		</label>
		
		<p>is legacy address</p>
		<label class="label">
			<p>no</p>
			<SlideToggle name="slide" bind:checked={ is_legacy_address_boolean } />
			<p>yes</p>
		</label>
	</div>
	{/if}
	
	<div style="height: 1cm"></div>
	
	<div 
		class="card p-4"
		style="
			width: 100%;
		"
	>
		<label class="label">
			<header
				style="
					margin: 0 auto;
					font-size: 2em;
					text-align: center;
				"
			>Arguments</header>
		</label>
	</div>
	
	<div style="height: 1cm"></div>
	
	<div 
		class="card p-4"
		style="
			width: 100%;
		"
	>
		<label class="label">
			<header
				style="
					margin: 0 auto;
					font-size: 2em;
					text-align: center;
				"
			>Type Arguments</header>

		</label>
	</div>
	
	<div style="height: 1cm"></div>
	
	<button 
		type="button" 
		class="btn variant-filled"
		on:click={ suggest }			
	>Suggest</button>
	
	{#if show_proceeds.length >= 1 }
	<div style="height: 1cm"></div>
	
	<div class="card p-4">
		{ show_proceeds }
	</div>
	{/if}
	
	
	{/if}
</div>