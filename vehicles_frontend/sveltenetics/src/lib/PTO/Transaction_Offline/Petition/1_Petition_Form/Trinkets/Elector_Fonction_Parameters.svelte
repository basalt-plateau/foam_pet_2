

<script>

import Slang from '$lib/trinkets/Slang/Trinket.svelte'

export let header_size = ""

export let fonction_parameters = []
export let on_change = () => {}

const fonction_parameters_changed = ({ index, contents }) => {
	console.log ({ index, contents });
	
	on_change ();
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
		<Slang text="Function" /> Parameters
	</div>
	
	
	{#each fonction_parameters as parameter, index }
	<div 
		style="
			text-align: left;
		"
		class="card p-1"
	>
		<div style="height: 0.25cm;"></div>
	
		<div>
			<span 
				style="
					padding: 0.25cm 0.5cm;
					font-size: 1.5em;
				"
				class="badge variant-soft-primary"
			>{ parameter.name }</span>
		</div>
		
		<div style="height: 0.1cm;"></div>
		
		<textarea 
			style="
				padding: 0.25cm;
			"
			class="textarea"  
			
			on:keyup={(event) => {
				const contents = event.target.value;
				fonction_parameters_changed ({
					index,
					contents
				})
			}}
		/>
	</div>
	{/each}
	
	{#if Array.isArray (fonction_parameters) && fonction_parameters.length === 0}
	<p
		style="
			text-align: center;
		"
	>0 Parameters</p>
	{/if}
</div>