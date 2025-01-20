

<script>

import { RadioGroup, RadioItem } from '@skeletonlabs/skeleton';

import Game from './Stadium/Game.svelte'
import Teams from './Stadium/Teams.svelte'
import Play from './Stadium/Play.svelte'

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
			<RadioItem bind:group={ shirt } name="justify" value={ "Play" }>Play</RadioItem>
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
		{:else if shirt === "Play" }
		<Play />
		{/if}
	</div>
</div>