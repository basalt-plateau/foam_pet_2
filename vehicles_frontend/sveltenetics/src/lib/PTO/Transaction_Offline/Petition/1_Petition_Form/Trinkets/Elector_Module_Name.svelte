
<script>

import { onMount, onDestroy } from 'svelte'

import { Autocomplete } from '@skeletonlabs/skeleton';
import { ListBox, ListBoxItem } from '@skeletonlabs/skeleton';
import { popup } from '@skeletonlabs/skeleton';

import { retrieve_modules_for_address } from './../screenplays/retrieve_modules_for_address'


/*
	Allowed Addresses:
		Allow Every: Address::__::__
		
		0x1 Framework
		
		0x3 Legacy Token
		0x4 Digital Assets

		
	Allowed Modules:
		Allow Every: Address::module::___

	Allowed Fonctions:
		Allow Every: Address::module::function
*/

const allowed_mods_tree = Object.freeze ({
	"0x1": "every",
	"0x3": "every",
	"0x4": "every"
});

export let net_path = ""
export let address = ""
$: {
	let _address = address;
	console.info ({ address });
	address_changed ();
}

export let module_name_choosen = () => {}


let les_modules = []

const address_changed = async () => {
	if (allowed_mods_tree [ address ] === "every") {
		const { les_modules: _les_modules } = await retrieve_modules_for_address ({
			net_path,
			address_hexadecimal_string: address
		});
		
		_les_modules.sort((a, b) => {
			if (a.abi.name < b.abi.name) {
				return -1;
			}
			if (a.abi.name > b.abi.name) {
				return 1;
			}
			return 0;
		});
		
		les_modules = _les_modules;
	}
}





let mod_name = "";
$: {
	let _mod_name = mod_name;
	console.log ("module name changed", mod_name)
	
	module_name_choosen ({ module_name: mod_name });
}




</script>

<div
	style="
		display: flex;
	"
>
	<div>
		<span 
			style="
				padding: 0.4cm;
			"
			class="badge variant-ringed-surface"
		>Module</span>
	</div>

	<div
		style="
			width: 5px;
		"
	/>
	
	
	<div
		style="
			width: 100%;
			height: 100%;
		"
		
	>
		<select
			bind:value={ mod_name }
		
			placeholder="module name"
			
			style="
				width: 100%;
				height: 100%;
				
				border-width: var(--theme-border-base);
				border-color: rgb(var(--color-surface-400));
				
				border-radius: 50px;
			"
			class="card p-3"
		>
			{#each les_modules as le_module }
			<option value={ le_module.abi.name }>{ le_module.abi.name }</option>
			{/each}
			
			{#if les_modules.length === 0 }
			<option value="" disabled>Zero modules found</option>
			{/if}
		</select>
	</div>

</div>


