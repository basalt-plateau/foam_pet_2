

<script>

import { RadioGroup, RadioItem } from '@skeletonlabs/skeleton';

import Game from './Stadium/Game.svelte'
import Teams from './Stadium/Teams.svelte'
import Planet_IV from './Stadium/Planet_IV.svelte'

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
			<RadioItem bind:group={ shirt } name="justify" value={ "Planet IV" }>Planet IV</RadioItem>
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
		{:else if shirt === "Planet IV" }
		<Planet_IV />
		{/if}
	</div>
</div>