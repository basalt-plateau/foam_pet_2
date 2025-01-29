




<script>

/*
	Keystone:
		* BIP 39 English Wordlist
		* Path: m/44'/637'/0'/0'/0'
		* Elliptic Algorithm: EEC 25519
*/

////
//
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
import { BIP_39_English_String_is_legit_2 } from "$lib/PTO/Accounts/Mnemonic/BIP_39_English/is_legit.js"
import Problem_Alert from '$lib/trinkets/Alerts/Problem.svelte'
import { assert_is_natural_numeral_string } from '$lib/taverns/numerals/natural/is_string'
//
////

// 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9
// let mnemonic = "9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9"

let alert_numeral_field_problem = "";
let alert_numeral_phrase_problem = "";

let numeral_field = "";
let legit = "no";

let permitted_numeral_24 = "";
let permitted_numeral_24_status = ""

//
//	Numerals from the component
//
//
let choosen = [];
$: {
	let _choosen = choosen;
	on_change_to_choosen ();
}

let choosen_numeral_string = "";
let choosen_BIP_39_English_string = "";

let directory_name = "Aptos Estate 1"

let worker = new Worker (
	new URL ("$lib/PTO/Accounts/Mnemonic/numerals/search_for_last/from_twenty_three_ww.js", import.meta.url), 
	{ type: 'module' }
);
worker.onmessage = function (event) {
	console.log ("onmessage", event);
	
	const { twenty_three, legit_numerals } = event.data;
	if (legit_numerals.length === 0) {
		zero_permitted_numerals_for_24 = "yup"
	};
	
	if (choosen_numeral_string === twenty_three) {
		permitted_numeral_24 = legit_numerals;
	}
};



const search_for_permitted_numeral_24 = async () => {
	permitted_numeral_24 = "";
	permitted_numeral_24_status = ""
	
	try {
		permitted_numeral_24_status = "searching"
		worker.postMessage (choosen_numeral_string);
	}
	catch (imperfection) {
		console.error (imperfection);
	}
}


const on_change_to_choosen = async () => {
	legit = "no"
	permitted_numeral_24 = "";
	
	choosen_numeral_string = choosen.map (entry => { return entry.numeral }).join (" ");
	choosen_BIP_39_English_string = choosen.map (entry => { return entry.word }).join (" ");
	
	if (choosen.length === 23) {
		await search_for_permitted_numeral_24 ();
	}
	else if (choosen.length === 24) {
		console.info ("24:", await BIP_39_English_String_is_legit_2 (choosen_BIP_39_English_string));
		
		if (await BIP_39_English_String_is_legit_2 (choosen_BIP_39_English_string) === "yup") {
			legit = "yes"
		}
		else {
			legit = "no"
		}
		
		return;
	}
}




const on_keyup_to_numeral_field = async (event) => {
	console.info ("on_keydown_to_numeral_field", event.key, numeral_field);
	
	alert_numeral_field_problem = "";
	
	//
	//	Guarantees:
	//		* isn't length 0
	//		* is a natural numeral
	//		* 1 <= numeral <= 2048
	//
	if (numeral_field.length === 0) {
		return;
	}
	
	try {
		assert_is_natural_numeral_string (numeral_field);
	}
	catch (imperfection) {
		alert_numeral_field_problem = imperfection.message;
	}
	
	const numeral_as_integer = parseInt (numeral_field);
	
	if (numeral_as_integer < 1 || numeral_as_integer > 2048) {
		alert_numeral_field_problem = "The numeral entered needs to be >= 1 and <= 2048";
		return;
	}
	
	

	if (event.key === 'Enter') {
		if (choosen.length === 24) {
			alert_numeral_field_problem = "The mnemonic sequence is already 24 numerals.";
			return;
		}
		
		choosen.push ({
			word: wordlist [ numeral_as_integer - 1 ],
			numeral: numeral_as_integer
		});
		choosen = [ ...choosen ];
		
		numeral_field = "";
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
		
		<div 
			style="
				display: flex;
				gap: 0.25cm;
			"
			class="card p-2"
		>
			<span class="badge variant-filled-surface">numeral</span>
			<span>{ choosen.length }</span>
		</div>
		
		<div 
			style="
				display: flex;
				gap: 0.25cm;
			"
			class="card p-2"
		>
			<span class="badge variant-filled-surface">numeral string</span>
			<span>{ choosen_numeral_string }</span>
		</div>
		
		<div 
			style="
				display: flex;
				gap: 0.25cm;
			"
			class="card p-2"
		>
			<span class="badge variant-filled-surface">BIP 39 English word string</span>
			<span>{ choosen_BIP_39_English_string }</span>
		</div>
		
		<div 
			style="
				display: flex;
				gap: 0.25cm;
			"
			class="card p-2"
		>
			<span class="badge variant-filled-surface">legit</span>
			{#if legit === "yes" }
			<span class="badge variant-filled-success">{ legit }</span> 
			{:else}
			<span class="badge variant-filled-error">{ legit }</span> 
			{/if}
		</div>
		
		
		
		
		<div 
			style="
				display: flex;
				gap: 0.25cm;
			"
			class="card p-2"
		>
			<span class="badge variant-filled-surface">permitted numeral 24</span>
			{#if permitted_numeral_24.length > 0 }
			<span>{ permitted_numeral_24.join (", ") }</span>
			{:else}
			<span>none</span>
			{/if}
		</div>

		
		
		<div style="height: 0.25cm"></div>
		
		<div
			style="
				display: grid;
				gap: 0.1cm;
				grid-template-columns: repeat(auto-fit, minmax(5cm, 1fr));
			"
			class="card variant-soft-primary p-2"
		>
			<div class="card p-2">Directory Name</div>
			<input 
				style="
					padding: 0.25cm;
				"
				class="input" 
				type="search" 
				name="demo" 
				bind:value={ directory_name }
			/>
		</div>
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
				
				bind:value={ numeral_field }
				on:keyup={ on_keyup_to_numeral_field } 
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
	</div>
	
	{#if alert_numeral_phrase_problem.length >= 1 }
	<Problem_Alert text={ alert_numeral_phrase_problem } />
	{/if}
	
	{#if alert_numeral_field_problem.length >= 1 }
	<Problem_Alert text={ alert_numeral_field_problem } />
	{/if}
	
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
			disabled={ legit === "yes" ? false : true }
			on:click={ send_to_OS_please }
			
			style=""
			class="btn variant-filled-primary"
		>
			Send to the OS
		</button>
	</div>


</div>