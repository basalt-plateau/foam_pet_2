

<script>

import { RadioGroup, RadioItem } from '@skeletonlabs/skeleton';

import Hulls_Estate from "./Hulls/Estate.svelte"

let leaf = "drums";

</script>


<div
	style="
		position: relative;
		height: 100%;
		overflow: hidden;
		
		display: flex;
		flex-direction: column;
		gap: 0.1cm;
	"
>
	<div 
		style="
			position: relative;
			
			display: flex;
			flex-direction: column;
			gap: 0.1cm;
		"
		class="card p-2 variant-soft-surface"
	>
		<RadioGroup>
			<RadioItem bind:group={ leaf } name="justify" value={ "drums" }>Drums</RadioItem>
			<RadioItem bind:group={ leaf } name="justify" value={ "logs" }>Logs</RadioItem>
		</RadioGroup>
	</div>
	<div 
		style="
			position: relative;
			height: 100%;
			overflow: hidden;
			
			display: flex;
			flex-direction: column;
			gap: 0.1cm;
		"
		class="card p-4 variant-soft-surface"
	>
		{#if leaf === "drums" }	
		<Hulls_Estate />
		{/if}
	</div>
</div>