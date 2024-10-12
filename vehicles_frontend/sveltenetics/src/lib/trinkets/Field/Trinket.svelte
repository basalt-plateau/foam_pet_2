

<script>

/*
	import Field from '$lib/trinkets/Field/Trinket.svelte'

	const field_on_change = ({ packet }) => {
		return {
			problem: ""
		}
	}
	
	const field_on_prepare = () => {
		field.modify_packet ("600")
	}
	
	// monitor is the input monitor
	<Field 
		monitor="max gas amount"
		
		logo="Max Gas Amount, in Octas"
		
		packet={ }
		
		bind:this={ field }
		on_change={ field_on_change }
		on_prepare={ field_on_prepare }
	/>
*/

/*
	grid-template-columns:
		repeat(auto-fit, minmax(200px, 1fr))
*/

import { onMount } from 'svelte'
import { has_field } from '$lib/taverns/procedures/object/has_field'

import Problem_Alert from '$lib/trinkets/Alerts/Problem.svelte'

export let logo = ""
export let monitor = "field"
export let packet_type = "number"
export let on_change = () => {}
export let on_prepare = () => {}

//
//
export let packet = ""
$: {
	let _packet = packet;
	verify_is_great ()
}
//
//

let problem_alert = "";

const is_bracket = (might) => {
	return might !== null && typeof might === 'object';
}

const verify_is_great = () => {
	const proceeds = on_change ({ packet })
	
	if (is_bracket (proceeds) && has_field (proceeds, "problem")) {
		if (proceeds.problem.length >= 1) {
			problem_alert = proceeds.problem
			return;on_prepare
		}
	}
	
	problem_alert = ""
}

export const modify_packet = (fresh_packet) => {
	packet = fresh_packet;
}



function typeAction(node) {
	node.type = packet_type;
}

onMount (() => {
	on_prepare ()
})

</script>



<div 
	class="card variant-soft-primary p-1" 
	style="
		color: inherit
	"
>	
	<div
		style="
			display: grid;
			grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
			grid-template-rows: auto;
			gap: 0.1cm;
			
			color: inherit
		"
	>
		<span 
			class="badge variant-soft-primary"
			style="
				word-wrap: revert-layer;
				white-space: preserve;
			"
		>{ logo }</span>
		
		<label 
			class="label"
			style="display: flex; align-items: center;"
		>
			<input 
				monitor={ monitor }
			
				bind:value={ packet }
				use:typeAction
				
				on:keyup={ verify_is_great }
				
				class="input"
				style="
					text-indent: 10px; 
					padding: 0.1cm;
					padding-right: 0.3cm;
				" 
				
				placeholder="" 
			/>
		</label>
	</div>
	<div>
		<slot />
	</div>
	<div>
		{#if problem_alert.length >= 1 }
		<div style="height: 8px"></div>
		
		<Problem_Alert 
			size="small"
		
			text={ problem_alert }
		/>
		{/if}
	</div>
</div>