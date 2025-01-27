




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
import { create_account_from_mnemonic } from "./../../from_mnemonic.js"


let mnemonic = ""


let input_demo = "";
let input_demo_2 = "";
let inputChipList = [];

const flavorOptions = [
	{ label: 'Vanilla', value: 'vanilla', keywords: 'plain, basic', meta: { healthy: false } },
	{ label: 'Chocolate', value: 'chocolate', keywords: 'dark, white', meta: { healthy: false } },
	{ label: 'Strawberry', value: 'strawberry', keywords: 'fruit', meta: { healthy: true } },
	{ label: 'Neapolitan', value: 'neapolitan', keywords: 'mix, strawberry, chocolate, vanilla', meta: { healthy: false } },
	{ label: 'Pineapple', value: 'pineapple', keywords: 'fruit', meta: { healthy: true } },
	{ label: 'Peach', value: 'peach', keywords: 'fruit', meta: { healthy: true } }
];
for (let i1 = 0; i1 <= 2048; i1++) {
	flavorOptions.push ({
		label: i1
	})
}

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
		
		choosen.push ({
			word: wordlist [ input_demo - 1 ],
			numeral: word_numeral
		});
		choosen = [ ...choosen ];
		
		input_demo = "";
	}
}

/*
Aptos Single Key:
  format: EEC 25519
  
  mnemonic:
    numerals: 
    BIP 39 English Wordlist: nation sorry clock vacant whisper visual art topic scene where decade sweet excess usage tuna close search behind theory barely sorry guitar badge frame
  
  accounts:
    account_1:
      derivation path: m/44'/637'/0'/0'/0'
      private key: 87D81840D5A1184EE4C0E278D37E23932DEB509F51EA54A2DF2E54F437A95982
      public key: C65B24FF1FE0F0DC23333912BE4BB4D921A93CDF113744BD7BE56031A23AAFEC
      legacy address: 886CF9F5F098372D5602EE9603DF2662B33753A464C45342990A698F677F5194
      address: E7DC4EC2C838DDB14FDB88B9F62C5E328974F3FCEC38AE463E388DDE805F6D9C
    
    
*/

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
			class="input" 
			type="search" 
			name="demo" 
			bind:value={ input_demo }
			on:keydown={ on_choose } 
		/>
		
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


</div>