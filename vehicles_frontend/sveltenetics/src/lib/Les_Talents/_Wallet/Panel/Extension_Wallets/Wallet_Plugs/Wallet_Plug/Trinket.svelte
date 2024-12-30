


<script>

import * as Extension_Winch from "$lib/Singles/Extension_Winch"

export let stage = {}
export let stage_name = ""

let Extension_Winch_Freight = Extension_Winch.freight ();

const obtain_wallet = ({ stage }) => {
	console.log ("obtain_wallet:", { stage });
	window.open (stage.url, '_blank');
}

</script>

<div
	style="
		display: flex;
		flex-direction: row;
		align-items: center;
		justify-content: space-between;
		gap: 10px;
		
		width: 100%;
		min-width: 200px;
	"
	class="card p-2"
>
	<div
		style="
			display: flex;
			flex-direction: row;
			align-items: center;
			justify-content: left;
			gap: 10px;
			
			width: 100%;
		"
	>
		{#if stage.icon.length >= 1}
		<img 
			src={ stage.icon } 
			style="
				height: 0.75cm;
				width: 0.75cm;
				
				display: flex;
				flex-direction: row;
				align-items: center;
				justify-content: space-between;
				gap: 10px;
			"
		/>
		{/if}
		<p>{ stage.name }</p>
	</div>


	<div>
		{#if stage.installed === "yes" }
		<button 
			type="button" 
			class="btn btn-sm variant-filled"
			on:click={() => {
				Extension_Winch_Freight.connect ({ stage_name: stage.name });
			}}
		>Connect</button>						
		
		{:else if stage.installed === "no" }
		<button 
			type="button" 
			class="btn btn-sm variant-filled"
			on:click={() => {
				obtain_wallet ({ stage });
			}}
		>Obtain</button>
		{/if}
	</div>
</div>