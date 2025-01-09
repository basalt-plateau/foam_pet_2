

<script>

import { RadioGroup, RadioItem } from '@skeletonlabs/skeleton';

import Sport from './Shirts/Sport.svelte'
import Players from './Shirts/Players.svelte'
import Buy from './Shirts/Buy.svelte'
import Throw from './Shirts/Throw.svelte'

let shirt = "Game";



</script>


<div>
	<div
		style="
			text-align: center;
		"
		class="card p-4"
	>
		<RadioGroup>
			<RadioItem bind:group={ shirt } name="justify" value={ "Game" }>Game</RadioItem>		
			<RadioItem bind:group={ shirt } name="justify" value={ "Players" }>Players</RadioItem>
			<RadioItem bind:group={ shirt } name="justify" value={ "Buy" }>Buy</RadioItem>
			<RadioItem bind:group={ shirt } name="justify" value={ "Throw" }>Throw</RadioItem>
		</RadioGroup>
	</div>
	
	<div style="height: 1cm" />
	
	<div
		style="
			text-align: center;
		"
		class="card p-4"
	>
		{#if shirt === "Sport" }
		<Sport />
		{:else if shirt === "Players" }
		<Players />
		{:else if shirt === "Buy" }
		<Buy />
		{:else if shirt === "Throw" }
		<Throw />
		{/if}
	</div>
</div>