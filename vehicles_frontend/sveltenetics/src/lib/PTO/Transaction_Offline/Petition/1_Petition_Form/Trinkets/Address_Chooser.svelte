
<script>


import { Autocomplete } from '@skeletonlabs/skeleton';
import { ListBox, ListBoxItem } from '@skeletonlabs/skeleton';

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

export let address_chosen = () => {}

const allowed_addresses = [
	"0x1",
	"0x3",
	"0x4"
];

let address = ""
$: {
	let _address = address;
	if (allowed_addresses.includes (address)) {
		address_chosen ({ address });
	}
}





function on_choose (event) {
	address = event.detail.label;
}

let auto_complete_style_preset = `
	position: absolute;
	z-index: 1;
`
let auto_complete_style = auto_complete_style_preset  + `
	display: none;
`;
const on_click = () => {
	auto_complete_style = auto_complete_style_preset + `
		display: block;
	`
}
const on_blur = () => {
	auto_complete_style = auto_complete_style_preset + `
		display: none;
	`
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
		>Address</span>
	</div>

	<div
		style="
			width: 5px;
		"
	/>
	
	<div
		style="
			width: 100%;
		"
	>
		<input 
			bind:value={ address }
		
			on:click={ on_click }
		
			style="
				padding: 0.25cm;
			"
			class="input" 
			type="search" 
			name="demo" 
		/>
	
		<div 
			style={ auto_complete_style }
			class="card w-full max-w-sm max-h-48 p-4 overflow-y-auto" 
			tabindex="-1"
		>
			<ListBox>
				{#each allowed_addresses as allowed_address }
				{#if allowed_address.includes (address) }
				
				<ListBoxItem 
					on:click={ on_blur }
				
					bind:group={ address } 
					name={ allowed_address }
					value={ allowed_address }
				>{ allowed_address }</ListBoxItem>
				
				{/if}
				{/each}
			</ListBox>
		</div>
	
	</div>
</div>


