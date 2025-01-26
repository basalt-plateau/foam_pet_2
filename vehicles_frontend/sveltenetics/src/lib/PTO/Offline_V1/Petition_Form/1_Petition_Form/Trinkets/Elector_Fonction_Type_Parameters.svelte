

<script>

import Slang from '$lib/trinkets/Slang/Trinket.svelte'

export let header_size = ""

export let on_change = () => {}
export let fonction_type_parameters = []
export let fonction_type_parameters_changed = () => {
	
}

</script>

<div class="card p-4">	
	<div
		style={ `
			text-align: center;
			font-size: ${ header_size };
			padding: 0.25cm 0;
		` }
	>
		<Slang text="Function" /> Type Parameters
	</div>
	
	{#each fonction_type_parameters as type_parameter, index }
	<div 
		style="
			text-align: center;
		"
		class="card p-1"
	>				
		<textarea 
			bind:value={ fonction_type_parameters [index] }
		
			style="
				padding: 0.25cm;
			"
			class="textarea"  
			on:change={ fonction_type_parameters_changed }
		/>
	</div>
	{/each}
	
	{#if Array.isArray (fonction_type_parameters) && fonction_type_parameters.length === 0}
	<p
		style="
			text-align: center;
		"
	>0 Type Parameters</p>
	{/if}
</div>

