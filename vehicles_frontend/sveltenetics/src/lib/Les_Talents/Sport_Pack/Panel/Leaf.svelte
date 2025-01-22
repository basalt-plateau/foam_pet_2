

<script>

////
//
import { RadioGroup, RadioItem } from '@skeletonlabs/skeleton';
import { onMount, onDestroy } from 'svelte'
//
//
import * as Truck_1 from '$lib/Les_Talents/Sport_Pack/Panel/Truck/index.js'
//
//
import Game from './Stadium/Game.svelte'
import Teams from './Stadium/Teams.svelte'
import Planet_IV from './Stadium/Planet_IV.svelte'
//
////

let shirt = "Game";

let made = "no"
onMount (async () => {
	await Truck_1.make ()
	made = "yup"
});
onDestroy (() => {
	Truck_1.destroy ()
});

</script>



{#if made === "yup" }
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
{/if}