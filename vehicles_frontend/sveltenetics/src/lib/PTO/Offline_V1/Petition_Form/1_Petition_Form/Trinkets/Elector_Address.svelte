
<script>


import { Autocomplete } from '@skeletonlabs/skeleton';
import { ListBox, ListBoxItem } from '@skeletonlabs/skeleton';

////
//
//	Exports
//
export let address_chosen = () => {}
export let endorsed = ""
$: {
	let _endorsed = endorsed;
	parse_endorsed_address ();
}
//
////


let endorsed_addresses = "zero"
const parse_endorsed_address = () => {
	console.log ("parse_endorsed_address");
	
	endorsed_addresses = "zero"
	
	try {
		if (typeof endorsed === "object" && endorsed !== null) {
			endorsed_addresses = Object.keys (endorsed) 
			return;
		}
		
		if (endorsed === "every") {
			endorsed_addresses = "every"
		}
	}
	catch (imperfection) {
		console.error ("parse_endorsed_address:", imperfection);
	}		
}


let previous_address = ""
let address = ""
$: {
	let _address = address;
	
	if (previous_address !== address) {
		previous_address = address;
		
		if (endorsed_addresses.includes (address)) {
			address_chosen ({ address });
		}
		else if (endorsed_addresses === "every") {
			address_chosen ({ address });
		}
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
		{#if true }
		{#if endorsed_addresses === "every" }			
		<input 
			bind:value={ address }
		
			style="
				padding: 0.25cm;
			"
			class="input" 
			
			type="search" 
			name="demo" 
		/>
		{:else if Array.isArray (endorsed_addresses) }			
		<select
			bind:value={ address }
			placeholder=""
			
			style="
				width: 100%;
				height: 100%;
				
				border-width: var(--theme-border-base);
				border-color: rgb(var(--color-surface-400));
				
				border-radius: 50px;
			"
			class="card p-3"
		>
			{#each endorsed_addresses as endorsed_address }
			{#if endorsed_address.includes (address) }
			<option 
				on:click={ on_blur }
				name={ endorsed_address }
				value={ endorsed_address }
			>{ endorsed_address }</option>
			{/if}
			{/each}
		</select>
		{/if}
		{/if}
			
			
		{#if false }
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
			{#if Array.isArray (endorsed_addresses) }			
			<ListBox>
				{#each endorsed_addresses as endorsed_address }
				{#if endorsed_address.includes (address) }
				<ListBoxItem 
					on:click={ on_blur }
				
					bind:group={ address } 
					name={ endorsed_address }
					value={ endorsed_address }
				>{ endorsed_address }</ListBoxItem>
				{/if}
				{/each}
			</ListBox>
			{/if}
		</div>
		{/if}
	</div>
</div>


