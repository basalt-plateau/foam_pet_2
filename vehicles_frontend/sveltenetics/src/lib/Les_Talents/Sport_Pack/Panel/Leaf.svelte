

<script>

import { RadioGroup, RadioItem } from '@skeletonlabs/skeleton';

import Game from './Shirts/Game.svelte'
import Teams from './Shirts/Teams.svelte'
import Play from './Shirts/Play.svelte'

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
	
	<div style="height: 1cm" />
	
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