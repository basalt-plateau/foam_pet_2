

<script>

import { RadioGroup, RadioItem } from '@skeletonlabs/skeleton';

import Venue from './Shirts/Venue.svelte'
import Mascots from './Shirts/Mascots.svelte'
import Vote from './Shirts/Vote.svelte'

let shirt = "Venue";


</script>


<div>
	<div
		style="
			text-align: center;
		"
		class="card p-4"
	>
		<RadioGroup>
			<RadioItem bind:group={ shirt } name="justify" value={ "Venue" }>Venue</RadioItem>		
			<RadioItem bind:group={ shirt } name="justify" value={ "Mascots" }>Mascots</RadioItem>
			<RadioItem bind:group={ shirt } name="justify" value={ "Vote" }>Vote</RadioItem>
		</RadioGroup>
	</div>
	
	<div style="height: 1cm" />
	
	<div
		style="
			text-align: center;
		"
	>
		{#if shirt === "Venue" }
		<Venue />
		{:else if shirt === "Mascots" }
		<Mascots />
		{:else if shirt === "Vote" }
		<Vote />
		{/if}
	</div>
</div>