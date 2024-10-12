




<script>


import { goto } from '$app/navigation';
import { has_field } from '$lib/taverns/procedures/object/has_field'
import { onMount, onDestroy } from 'svelte';

/*
	[{
		"name": "",
		"link": ""
	},{
		"component": "",
		"link": ""
	}]
*/

export let changed = () => {}
export let change = () => {
	console.log ('change buttons panel')
}

export let pads = []
export let button_open = ""

const find_pad = (pad_name) => {
	for (let E = 0; E < pads.length; E++) {
		const pad = pads [E]
		if (pad_name === pad.name) {
			return pad;
		}		
	}
	
	throw new Error (`Pad not found: "${ pad_name }"`)
}

const goto_link_if_link = ({ pad }) => {
	return;
	
	if (has_field (pad, "link")) {
		const link = pad.link;
		if (typeof link === 'string' && link.length >= 1) {
			goto (link)
			return;
		}
	}
	
	console.info ("This pad does not have a link", { pad })
}

let button_tapped = (label) => {
	return () => {
		button_open = label;
		const pad = find_pad (label)
		goto_link_if_link ({ pad })
		changed ({ pad })
	}
}

let tapped = "variant-filled"
// let untapped = "bg-gradient-to-br variant-gradient-primary-secondary"
let untapped = "variant-filled-primary"

onMount (() => {
	const label = button_open;
	const pad = find_pad (label)
	goto_link_if_link ({ pad })
	changed ({ pad })
})

</script>

<style>

@media (max-width: 800px) {
	.navigator-button {
		padding: 0.1cm 0.25cm;
		margin: 0 0.05cm;
	}
}

</style>

<div
	monitor="navigator"
	style="
		display: flex;
		justify-content: center;
		gap: 5%;
		width: 100%;
	"
>
	{#each pads as pad }
	<div
		style="
			padding: 0.05cm;
			border-radius: 12px; 
		"
		class="card variant-filled"
	>
		<button 
			monitor={ pad.name }
		
			on:click={ button_tapped (pad.name) }
			type="button" 
			
			style="
				padding: 0.1cm 0.25cm;
			"
			class={
				`navigator-button btn ${ 
					button_open === pad.name ? tapped : untapped
				}`
			}
		>
			{#if has_field (pad, "component") }
			<svelte:component this={ pad.component } />
			{:else}
			{ pad.name }
			{/if}
		</button>
	</div>
	{/each}
</div>