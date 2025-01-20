

<script>

import { RadioGroup, RadioItem } from '@skeletonlabs/skeleton';

import Game from './Stadium/Game.svelte'
import Teams from './Stadium/Teams.svelte'
import Passes from './Stadium/Passes.svelte'

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
			<RadioItem bind:group={ shirt } name="justify" value={ "Teams" }>Teams</RadioItem>
			<RadioItem bind:group={ shirt } name="justify" value={ "Passes" }>Passes</RadioItem>
		</RadioGroup>
	</div>
	
	<div style="height: 0.25cm" />
	
	<div
		style="
			text-align: center;
		"
	>
		{#if shirt === "Game" }
		<Game />
		{:else if shirt === "Teams" }
		<Teams />
		{:else if shirt === "Passes" }
		<Passes />
		{/if}
	</div>
</div>