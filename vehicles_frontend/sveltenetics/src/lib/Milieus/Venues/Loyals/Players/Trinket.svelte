





<script>

//\\
//
//
import { Accordion, AccordionItem } from '@skeletonlabs/skeleton';
import { TabGroup, Tab, TabAnchor } from '@skeletonlabs/skeleton';
import { RadioGroup, RadioItem } from '@skeletonlabs/skeleton';
//
import Bike from 'lucide-svelte/icons/bike';
//
//
import Panel from '$lib/trinkets/panel/trinket.svelte'
import Leaf from '$lib/trinkets/Layout/Leaf/Trinket.svelte'
import Address_from_Keyboard from '$lib/PTO/Accounts/Trinkets/Address_from_Keyboard/Trinket.svelte'
import Address_from_Private_Key from '$lib/PTO/Accounts/Trinkets/Address_from_Private_Key/Trinket.svelte'
import Slang from '$lib/trinkets/Slang/Trinket.svelte'
import Signature_Ownership from '$lib/PTO/Accounts/Trinkets/Signature_Ownership/Trinket.svelte'
import Signature_Math from '$lib/PTO/Accounts/Trinkets/Signature_Math/Trinket.svelte'
//
//
import { parse_with_commas } from '$lib/taverns/numbers/parse_with_commas'
import { parse_styles } from '$lib/trinkets/styles/parse.js';
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

<svelte:head>
	<title>Addresses</title>
</svelte:head>

<Leaf>
<main addresses monitor="accounts">
	<Panel>
		<div style="height: 2cm" />
	
		<header
			style="{parse_styles ({
				'display': 'flex',
				'text-align': 'center',
				'font-size': '2em',
				'justify-content': 'center'
			})}"
		>
			<Slang text="Accounts" /> 
		</header>
		
		
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
		
		<div style="height: 2cm" />
	</Panel>

	<div style="height: 20px"></div>


	<div class="card p-2">
		<Accordion>
			<AccordionItem>
				<svelte:fragment slot="summary">
					<header
						style="{parse_styles ({
							'display': 'block',
							'text-align': 'center',
							'font-size': '2em',
							'padding': '0.2cm',
						})}"
					>Hints</header>
				</svelte:fragment>
				<svelte:fragment slot="content">				
					<Signature_Ownership />
					<Signature_Math />					
				</svelte:fragment>
			</AccordionItem>
		</Accordion>
	</div>
	
	<div style="height: 0.4cm"></div>
	
	<div class="card p-4">
		<div class="card variant-soft-primary p-4">
			<header
				style="{parse_styles ({
					'display': 'block',
					'text-align': 'center',
					'font-size': '2em',
					'padding': '1cm',
				})}"
			><Slang text="Account" /> Type</header>
			
			<!-- Lock Mode -->
			
			<div 
				account_type
				style="
					display: flex;
					justify-content: center;
				"
			>
				<RadioGroup
					flexDirection="flex-col"
					rounded="rounded-container-token"
				>
					<RadioItem bind:group={account_variety} name="justify" value="EEC_25519_single_key_account">
						<span
							monitor="EEC 25519 Single Key"
						>EEC 25519 Single Key <Slang text="Account" /></span>
					</RadioItem>
					<RadioItem bind:group={account_variety} name="justify" value="multi_key_account">
						<span
							monitor="Multi Key"
						>Multi Key <Slang text="Account" /></span>
					</RadioItem>
				</RadioGroup>
			</div>
			
			<select 
				style="display: none"
			
				keys_count
			
				class="select"
				on:change={ modify_keys_count }
			>
				<option value="EEC_25519_single_key_account">EEC 25519 Single Key</option>
				<option value="multi_key_account">Multi Key</option>
			</select>
		</div>

		<div style="height: 0.25cm" />
		<hr class="!border-dotted" style="border-top-width: 0.1cm" />
		<div style="height: 0.25cm" />
		
		{#if account_variety === "EEC_25519_single_key_account" }
		
		
		
		
		<div class="card p-2 variant-filled-primary">
			<Accordion>
				<AccordionItem>
					<svelte:fragment slot="summary">
						<header
							style="{parse_styles ({
								'display': 'block',
								'text-align': 'center',
								'font-size': '2em',
								'line-height': '1.5em',
							})}"
						>
							<span>Mathematics</span>
						</header>
					</svelte:fragment>
					<svelte:fragment slot="content">
						<div>
							<header
								style="{parse_styles ({
									'display': 'block',
									'text-align': 'center',
									'font-size': '1.5em',
									'line-height': '1em',
								})}"
							>
								<span>Edward's Elliptic Curve (EEC) 25519 <Slang text="Private Keys" /></span>
							</header>
							
							<div style="height: 0.4cm"></div>
							
							<p>
								An EEC 25519 <Slang text="Private Key" /> is 64 hexadecimal (base 16) characters.
							</p>
							<p>
								The possible hexadecimal characters are 0123456789ABCDEF.
							</p>
							
							<div style="height: 0.4cm"></div>
							
							<span style="word-break: break-word">For each <Slang text="Private Key" /> there is a unique <Slang text="Public Key" />.</span>
							
							<div style="height: 0.4cm"></div>
							
							<span style="word-break: break-word">There are 64^16 possible <Slang text="Private Keys" /> and thus 64^16 possible <Slang text="Public Keys" />.</span>
							<br/>
							<p>
								<span style="display: inline-block">As base 10 that equals</span>
								<span 
									class="badge variant-filled"
									style="display: inline-block"
								>&gt;1.157 E +77</span>
								<span style="display: inline-block">possible key pairs:</span>
							</p>
							
							<span
								style="
									white-space: pre-wrap;
									max-width: 300px;
									margin: 0.1cm auto;
									text-align: right;
								"
							>{ possible_waves.trim () }</span>
							
							<div style="height: 0.4cm"></div>
							
							<p>
								<span style="display: inline-block"></span>
							</p>
						</div>
					</svelte:fragment>
				</AccordionItem>
			</Accordion>
		</div>
		
		<div style="height: 0.4cm"></div>
		
		<div class="card variant-soft-primary p-4">
			<header
				style="{parse_styles ({
					'display': 'block',
					'text-align': 'center',
					'font-size': '2em',
					'padding': '1cm',
				})}"
			
			><Slang text="Account" /> Pick</header>
			
			
			
			<select 
				style="
					display: none;
				"
			
				single_key_address_navigator
			
				class="select"
				on:change={ change_leaf }
			>
				<option value="from_private_key_glyphs">From Keyboard Glyph Modifier</option>
				<option value="from_private_key_hexadecimal">From Private Key Hexadecimal</option>
			</select>
			
			<div 
				single_key_address_navigator
				style="
					display: flex;
					justify-content: center;
				"
			>
				<RadioGroup
					flexDirection="flex-col"
					rounded="rounded-container-token"
				>
					<RadioItem bind:group={leaf} name="justify" value="from_private_key_glyphs">
						<span
							monitor="from Keyboard Glyph Modifier"
						>
							<Slang text="Account" /> from Keyboard Glyph Modifier
						</span>
					</RadioItem>
					<RadioItem bind:group={leaf} name="justify" value="from_private_key_hexadecimal">
						<span
							monitor="from hexadecimal"
						>
							<Slang text="Account" /> from <Slang text="Private Key" /> Hexadecimal
						</span>
					</RadioItem>
				</RadioGroup>
			</div>
		</div>
		
		<div style="height: 0.4cm"></div>
		
		<div class="card p-4">
			{#if leaf === "from_private_key_glyphs" }
				<Address_from_Keyboard />
			{:else if leaf === "from_private_key_hexadecimal" }
				<Address_from_Private_Key />
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