
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


let allowed_modules = [];
const parse_allowed_modules = () => {
	console.log ({ address, allow });
	
	allowed_modules = "zero"
	
	try {
		const modules_of_address = allow [ address ];
		console.log ({ modules_of_address }, modules_of_address === "every");
		
		if (modules_of_address === "every") {
			allowed_modules = "every"
			return;
		}
		
		const module_names = Object.keys (modules_of_address);
		console.log ({ module_names });
		
		if (Array.isArray (module_names)) {
			allowed_modules = module_names
			return;
		}
	}
	catch (anomaly) {
		console.error (anomaly);
	}
}


export let net_path = ""
export let address = ""
$: {
	let _address = address;
	console.info ({ address });
	
	parse_allowed_modules ();
	address_changed ();
}

export let allow = ""
$: {
	parse_allowed_modules ();
}

export let module_name_choosen = () => {}



let les_modules = []

const address_changed = async () => {
	console.log ("address changed:", { allowed_modules });
	
	les_modules = [];
	
	const { les_modules: _les_modules } = await retrieve_modules_for_address ({
		net_path,
		address_hexadecimal_string: address
	});
	_les_modules.sort ((a, b) => {
		if (a.abi.name < b.abi.name) {
			return -1;
		}
		if (a.abi.name > b.abi.name) {
			return 1;
		}
		return 0;
	});
	
	if (allowed_modules === "every") {
		les_modules = _les_modules;
		return;
	}
	
	
	
	if (Array.isArray (allowed_modules)) {
		if (Array.isArray (_les_modules)) {
			console.log ({ _les_modules, allowed_modules });
			
			les_modules = _les_modules.filter (le_module => {
				// console.log ("name:", le_module.abi.name, allowed_modules.includes (le_module.abi.name));
				
				if (allowed_modules.includes (le_module.abi.name)) {
					console.log ("name:", le_module.abi.name, allowed_modules.includes (le_module.abi.name));
					return true;
				} 
				
				return false;
			});
			
			console.log ({ les_modules, _les_modules });
		}
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


