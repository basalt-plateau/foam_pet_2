




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
let BIP_39_English_Word_String_Length = "";

const ensure_word_string_is_legit = () => {
	
}

const retrieve_size = () => {
	console.info ("retrieve_size");
	
	try {
		BIP_39_English_Word_String_Length = BIP_39_English_Word_String.split (" ").length;
		return;
	}
	catch (imperfection) {
		console.error (imperfection);
	}
	
	BIP_39_English_Word_String_Length = "?"
}

let input_demo = "";

let directory_name = "Aptos Estate 1"


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
	from_form_type = event.target.value;
	
}

const send_to_OS_please = async () => {
	let mnemonic_numerals = "";	
	if (from_form_type === "from_BIP_39_English_Word_String") {
		mnemonic_numerals = BIP_39_English_String_to_Numerals_String ( 
			BIP_39_English_Word_String
		)
	}
	else {
		mnemonic_numerals = choosen.map (entry => { return entry.numeral }).join (" ");
	}
	
	await send_to_OS_from_mnemonic_numerals ({
		directory_name,
		mnemonic_numerals
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
		
		{#if from_form_type === "from_numerals" }
		<div class="card p-2">size: { choosen.length }</div>
		{:else if from_form_type === "from_BIP_39_English_Word_String" }
		<div class="card p-2">size: { BIP_39_English_Word_String_Length }</div>
		{/if}
		
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
		{:else if from_form_type === "from_BIP_39_English_Word_String" }
		<input 
			style="
				padding: 0.25cm;
			"
			class="input" 
			type="search" 
			
			bind:value={ BIP_39_English_Word_String }
			on:keyup={ retrieve_size }
		/>
		{/if}
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