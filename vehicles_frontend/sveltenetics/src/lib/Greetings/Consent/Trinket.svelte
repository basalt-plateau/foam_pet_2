


<script>




////
//
import { onMount } from 'svelte'
import { RadioGroup, RadioItem } from '@skeletonlabs/skeleton';
//
//
import Leaf from '$lib/trinkets/Layout/Leaf/Trinket.svelte'
//
////

import School from "./School/Tome.svelte"
import Panels from "./Panels/Tome.svelte"

// Enzymes, Flourishes
let leaf = "Panels";

</script>



<Leaf monitor="signatures leaf">
	<div
		style="
			position: relative;
			top: 0;
			left: 0;
			
			width: 100%;
			
			text-align: center;
			
			display: flex;
			justify-content: center;
			align-items: center;
			flex-direction: column;
		"
	>
		<div>
			<RadioGroup>
				<RadioItem bind:group={ leaf } name="justify" value={ "Panels" }>Panels</RadioItem>
				<RadioItem bind:group={ leaf } name="justify" value={ "School" }>School</RadioItem>		
			</RadioGroup>
		</div>
	</div>

	<div style="height: 0.5cm" />
	
	{#if leaf === "School"}
	<School />
	{:else if leaf === "Panels" }
	<Panels />
	{/if}
</Leaf>

