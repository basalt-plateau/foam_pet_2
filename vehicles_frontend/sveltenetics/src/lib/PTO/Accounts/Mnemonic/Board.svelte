




<script>

/*
	Keystone:
		* BIP 39 English Wordlist
		* Path: m/44'/637'/0'/0'/0'
		* Elliptic Algorithm: EEC 25519
*/

import * as bip39 from '@scure/bip39';
import { wordlist } from '@scure/bip39/wordlists/english';
//
import { InputChip } from '@skeletonlabs/skeleton';
import { Autocomplete } from '@skeletonlabs/skeleton';
//
//
import { create_account_from_mnemonic } from "./create_account.js"
import { send_to_OS_from_mnemonic_numerals } from './Send/to_OS.js'
	

import { BIP_39_English_String_to_Numerals_String } from "./BIP_39_English/string_to_numerals_string.js"
import {
	mnemonic_numerals_string_to_BIP_39_English_string
} from "./numerals/string_to_BIP_39_English_string.js"

let mnemonic = ""
let BIP_39_English_Word_String = "";

let input_demo = "";
let input_demo_2 = "";
let inputChipList = [];

let directory_name = "Aptos Estate 1"

let inputChip = '';

let choosen = [];
const on_choose = (event) => {
	if (event.key === 'Enter') {
		const word_numeral = parseInt (input_demo);
		if (typeof word_numeral !== "number") {
			return;
		}
		if (isNaN (word_numeral)) {
			return;
		}
		if (word_numeral < 1 || word_numeral > 2048) {
			return;
		}
		if (choosen.length === 24) {
			return;
		}
		
		choosen.push ({
			word: wordlist [ input_demo - 1 ],
			numeral: word_numeral
		});
		choosen = [ ...choosen ];
		
		input_demo = "";
	}
}



let from_form_type = "from_numerals";
const mnemonic_from_elector_changed = (value) => {
	// console.info ("mnemonic_from_elector_changed", event.target.value);
	from_form_type = event.target.value;
	
}

const send_to_OS_please = async () => {
	console.info ("send_to_OS");
	
	let mnemonic_string = "";
	let mnemonic_numerals = "";	
	if (from_form_type === "from_BIP_39_English_Word_String") {
		mnemonic_string = BIP_39_English_Word_String;
		mnemonic_numerals = BIP_39_English_String_to_Numerals_String ({ 
			BIP_39_English_String: BIP_39_English_Word_String
		})
	}
	else {
		mnemonic_string = choosen.map (entry => { return entry.word }).join (" ");
		mnemonic_numerals = choosen.map (entry => { return entry.numeral }).join (" ");
	}
	
	await send_to_OS_from_mnemonic_numerals ({
		mnemonic_numerals
	});
	return;
	
	const accounts = {}
	const public_accounts = {}
	
	let le_account = 0;
	let le_change = 0;
	let le_address_index = 0;
	
	// SECP_256k1
	// EEC_25519
	let le_scheme = "EEC_25519";
	
	while (le_account <= 9) {
		const EEC_derivation_path = (
			`m/44'/637'/` + 
			le_account.toString () + 
			"'/" +
			le_change.toString() +
			"'/" +
			le_address_index.toString () +
			"'"
		);
		
		const {
			private_key_hexadecimal_string,
			public_key_hexadecimal_string,
			legacy_address_hexadecimal_string,
			pristine_address_hexadecimal_string
		} = await create_account_from_mnemonic ({
			derivation_path: EEC_derivation_path,
			scheme: le_scheme,
			mnemonic: mnemonic_string
		});
		
		const label = "account " + le_account.toString ();
		
		accounts [ label ] = {
			"derivation path": EEC_derivation_path,
			"private key": private_key_hexadecimal_string,
			"public key": public_key_hexadecimal_string,
			"address legacy": legacy_address_hexadecimal_string,
			"address": pristine_address_hexadecimal_string
		};
		
		public_accounts [ label ] = {
			"derivation path": EEC_derivation_path,
			"public key": public_key_hexadecimal_string,
			"address legacy": legacy_address_hexadecimal_string,
			"address": pristine_address_hexadecimal_string
		}
		
		le_account++;
	};
	
	await send_to_OS ({
		directory_name,
		//
		wealth: {
			"Aptos Single Key Mnemonic": {
				"Format": "EEC 25519",
				
				"Mnemonic": {
					"Numerals": choosen.map (entry => { return entry.numeral }).join (" "),
					"BIP 39 English Wordlist": choosen.map (entry => { return entry.word }).join (" ")
				},
				
				"Accounts": accounts
			}
		},
		boast: {
			"Aptos Single Key Mnemonic": {
				"Format": "EEC 25519",
				"Accounts": public_accounts
			}
		}
		
		
	});
}



</script>



<div>
	<div 
		style="width: 100%; background: none; margin-top: 10px"
	>
		<div 
			class="input-group-shim"
			style="
				width: 100%;
				padding: 0.1cm;
			"
		>Mnemonic:</div>
		<div class="card p-2">
			<ul>
				<li>BIP 39 English Wordlist</li>
				<li>Elliptic Algorithm: EEC 25519</li>
				<li>Derivation Path: m/44'/637'/0'/0'/0'</li>
			</ul>
		</div>
		
		<div class="card p-2">size: { choosen.length }</div>
		
		<input 
			style="
				padding: 0.25cm;
			"
			class="input" 
			type="search" 
			name="demo" 
			bind:value={ directory_name }
		/>
		
		<div style="height: 0.25cm"></div>
		
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
				monitor="mnemonic elector"
				style=""
				class="select"
				on:change={ mnemonic_from_elector_changed }
			>
				<option value="from_numerals">From Numerals</option>
				<option value="from_BIP_39_English_Word_String">From BIP 39 English Word String</option>
			</select>
		</div>
		
		{#if from_form_type === "from_numerals" }
		<div
			style="
				display: grid;
				gap: 0.1cm;
				grid-template-columns: repeat(auto-fit, minmax(5cm, 1fr));
			"
			class="card variant-soft-primary p-2"
		>
			<div class="card p-2">Numeral (1 to 2048 then press enter)</div>
			<input 
				style="
					padding: 0.25cm;
				"
				class="input" 
				type="search" 
				
				bind:value={ input_demo }
				on:keydown={ on_choose } 
			/>
		</div>
		{:else if from_form_type === "from_BIP_39_English_Word_String" }
		<input 
			style="
				padding: 0.25cm;
			"
			class="input" 
			type="search" 
			
			bind:value={ BIP_39_English_Word_String }
		/>
		{/if}
		
		<div 
			style="
				display: grid;
				gap: 0.1cm;
				grid-template-columns: repeat(auto-fit, minmax(4cm, 1fr));
			"
			class="card p-2"
		>
			{#each choosen as elected, index }
			<div
				style="
					display: flex;
					gap: 0.1cm;
					
				"
				class="card p-1 variant-filled-surface"
			>
				<button 
					style="
						padding: 0;
						line-height: 1em;
						font-size: 1em;
						height: 24px;
						width: 24px;
						border-radius: 50%;
					"
					type="button" 
					class="btn-icon variant-filled-primary"
					on:click={() => { choosen.splice (index, 1); choosen = [ ...choosen ]; }}
				>x</button>
				<span class="badge variant-filled-surface">{ elected.numeral }</span>
				<span class="badge variant-filled-surface">{ elected.word }</span>
			</div>
			{/each}
		</div>
	</div>
	
	<div
		style="
			display: grid;
			grid-template-columns: repeat(auto-fit, minmax(400px, 1fr));
			gap: 4px;
			width: 100%;
			margin: 4px 0;
		"
	>

		<button 
			on:click={ send_to_OS_please }
			
			class="btn variant-filled-primary"
		>
			Send to the OS
		</button>
	</div>


</div>