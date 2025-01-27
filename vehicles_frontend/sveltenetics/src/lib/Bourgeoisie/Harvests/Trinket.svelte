





<script>

//\\
//
//
import { Accordion, AccordionItem } from '@skeletonlabs/skeleton';
import { TabGroup, Tab, TabAnchor } from '@skeletonlabs/skeleton';
import { RadioGroup, RadioItem } from '@skeletonlabs/skeleton';
//
//
import Panel from '$lib/trinkets/panel/trinket.svelte'
import Leaf from '$lib/trinkets/Layout/Leaf/Trinket.svelte'
import Slang from '$lib/trinkets/Slang/Trinket.svelte'
//
import { parse_with_commas } from '$lib/taverns/numbers/parse_with_commas'
import { parse_styles } from '$lib/trinkets/styles/parse.js';
//
import Address_from_Keyboard from '$lib/PTO/Accounts/Trinkets/Address_from_Keyboard/Trinket.svelte'
import Address_from_Private_Key from '$lib/PTO/Accounts/Trinkets/Address_from_Private_Key/Trinket.svelte'
import Address_from_Mnemonic from '$lib/PTO/Accounts/Trinkets/Address_from_Mnemonic/Board.svelte'
//
//
import Atrium from './Trinkets/Atrium.svelte';
import EEC_25519_Mathematics from './Trinkets/EEC_25519_Mathematics.svelte'
//
//
////




let tabSet = 0;
let possible_waves = parse_with_commas (
	"115792089237316195423570985008687907853269984665640564039457584007913129639936",
	{
		"with_line_breaks": "yes"
	}
)

let leaf = "from_private_key_glyphs"
const change_leaf = () => {
	leaf = event.target.value;
}

let account_variety = "EEC_25519_single_key_account"
const modify_keys_count = () => {
	account_variety = event.target.value;
}



</script>

<style>
	span {
		display: block;
	}
</style>


<Leaf>
<main addresses monitor="accounts leaf">
	<div style="height: 0.5cm" />
	
	<div class="card p-4">
		<div style="height: 1cm" />
		
		<p
			style="
				text-align: center;
			"
		><Slang text="Accounts" /> each have 1 <Slang text="Private Key" /> that has 1 or more <Slang text="Addresses" />.</p>
		
		<div style="height: 0.5cm" />
		
		<p
			style="
				text-align: center;
			"
		><Slang text="A_Private_Key" /> is necessary to act as <Slang text="an_Address" />.</p>

		<div style="height: 0.5cm" />	
	</div>

	<div style="height: 0.5cm" />

	<Atrium />
	
	<div style="height: 0.5cm"></div>
	
	<div class="card p-2">
		<div class="card variant-soft-primary p-4">
			<header
				style="{parse_styles ({
					'display': 'block',
					'text-align': 'center',
					'font-size': '1.5em',
				})}"
			
			><Slang text="Account" /> Chooser</header>
		</div>
		
		<div style="height: 0.4cm"></div>

		<div class="card variant-soft-primary p-2">
			
			<!-- Lock Mode -->
			
			<div 
				account_type
				style="
					display: grid;
					gap: 0.1cm;
					grid-template-columns: repeat(auto-fit, minmax(5cm, 1fr));
				"
			>
				<div class="card p-2"><Slang text="Account" /> Type</div>
			
				<select 
					style=""
				
					keys_count
				
					class="select"
					on:change={ modify_keys_count }
				>
					<option value="EEC_25519_single_key_account">EEC 25519 Single Key</option>
					<option value="multi_key_account">Multi Key</option>
				</select>
			</div>
		</div>
		
		{#if account_variety === "EEC_25519_single_key_account" }
		
		<div
			style="
					display: grid;
					gap: 0.1cm;
					grid-template-columns: repeat(auto-fit, minmax(5cm, 1fr));
				"
			class="card variant-soft-primary p-2"
		>
			<div class="card p-2">Form Type</div>
			
			<select 
				style=""
				single_key_address_navigator
				class="select"
				on:change={ change_leaf }
			>
				<option value="from_private_key_glyphs">From Keyboard Glyph Modifier</option>
				<option value="from_private_key_hexadecimal">From Private Key Hexadecimal</option>
				<option value="from_mnemonic">From Mnemonic</option>
			</select>
		</div>
		
		<div style="height: 0.4cm"></div>
		
		<EEC_25519_Mathematics />
		
		<div class="card p-4">
			{#if leaf === "from_private_key_glyphs" }
			<Address_from_Keyboard />
			{:else if leaf === "from_private_key_hexadecimal" }
			<Address_from_Private_Key />
			{:else if leaf === "from_mnemonic" }
			<Address_from_Mnemonic />
			{/if}
		</div>
		{:else if account_variety === "multi_key_account" }
		<div style="padding: 0.5cm">
			<p>Choosing <b>Multi Key Accounts</b> is not yet possible on this dapp.</p> 
		</div>
		{:else}
		
		{/if}
		
		
	</div>
	
	<div style="height: 15cm"></div>
</main>
</Leaf>