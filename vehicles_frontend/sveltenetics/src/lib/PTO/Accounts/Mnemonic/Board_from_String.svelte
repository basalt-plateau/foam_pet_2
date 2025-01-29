




<script>

/*
	Keystone:
		* BIP 39 English Wordlist
		* Path: m/44'/637'/0'/0'/0'
		* Elliptic Algorithm: EEC 25519
*/

/*
	legit:
		nation sorry clock vacant whisper visual art topic scene where decade sweet excess usage tuna close search behind theory barely sorry guitar badge frame
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

//
////


////
//
let directory_name = "Aptos Estate 1"

let legit = "no";

let BIP_39_English_Word_String = "";
let BIP_39_English_Word_String_Length = "";
//
////

const retrieve_size = () => {
	try {
		BIP_39_English_Word_String_Length = BIP_39_English_Word_String.split (" ").length;
		return;
	}
	catch (imperfection) {
		console.error (imperfection);
	}
	
	BIP_39_English_Word_String_Length = "?"
}

const guarantee_is_legit = async () => {
	console.info ("guarantee_is_legit");
	
	if (await BIP_39_English_String_is_legit_2 (BIP_39_English_Word_String) === "yup") {
		legit = "yes"
	}
	else {
		legit = "no"
	}
}


const on_input_change = async () => {
	retrieve_size ();
	guarantee_is_legit ();
}


let from_form_type = "from_numerals";
const mnemonic_from_elector_changed = (value) => {
	from_form_type = event.target.value;
	
}

const send_to_OS_please = async () => {
	let mnemonic_numerals = "";	
	mnemonic_numerals = BIP_39_English_String_to_Numerals_String ( 
		BIP_39_English_Word_String
	)
	
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
		
		<div class="card p-2">size: { BIP_39_English_Word_String_Length }</div>
		<div class="card p-2">legit: { legit }</div>
		
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
				monitor="directory name"
			
				style="
					padding: 0.25cm;
				"
				class="input" 
				type="search" 
				name="demo" 
				bind:value={ directory_name }
			/>
		</div>
		
		
		<div style="height: 0.25cm"></div>
		
		<div
			style="
				display: flex;
				gap: 0.1cm;
				grid-template-columns: repeat(auto-fit, minmax(5cm, 1fr));
			"
			class="card variant-soft-primary p-2"
		>
			<div class="card p-2">BIP 39 English Word String</div>
			<textarea 
				monitor="numeral field"
			
				style="
					padding: 0.25cm;
				"
				class="input" 
				type="search" 
				
				bind:value={ BIP_39_English_Word_String }
				on:keyup={ on_input_change }
			/>
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
			disabled={ legit === "yes" ? false : true }
			
			
			class="btn variant-filled-primary"
		>
			Send to the OS
		</button>
	</div>


</div>