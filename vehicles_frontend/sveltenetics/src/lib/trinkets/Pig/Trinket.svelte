

<script>

/*
	import Pig from "$lib/trinkets/Pig/Trinket.svelte"
*/

import { fade } from 'svelte/transition';
import Sound_Gem from '$lib/trinkets/Sound/Gem.svelte'
import Versies_Truck from '$lib/Versies/Trucks.svelte'
let Versies_Freight = false
	
	

let sound_gem = ""

const Pig = '/pictures/Pig.svg';

let show_dialogue = "no"
let chat_timeout;

let cow_clicked = () => {
	return;
	console.log ("cow_clicked");
	show_dialogue = "yes"
	sound_gem.playa ();
	
	// Versies_Freight.shrink ();
	
	clearTimeout (chat_timeout);
	chat_timeout = setTimeout (() => {
		show_dialogue = "no"
	}, 5000);
}


</script>




<div
	style="
		position: relative;
		border-radius: 50%;
	"
>
	<Versies_Truck on_change={ ({ freight }) => { Versies_Freight = freight } } />
	{#if typeof Versies_Freight === "object"}
	
	<Sound_Gem 
		bind:this={ sound_gem }
		source="/sonors/Beep/Beep.ogg"
	/>

	{#if show_dialogue === "yes" }
	<div
		transition:fade
		style="
			position: absolute;
			bottom: 80px;
			left: 10px;

			box-sizing: border-box;
			height: 3cm;
			width: 7cm;
			padding: 0.25cm;

			// background: rgba(var(--color-primary-500));
			// border: 4px solid rgba(var(--color-primary-100));
			
			border-radius: 15px;
			
			overflow-y: scroll;
		"
	>
		<div
			class="card p-4 variant-filled-primary"
			style="
				position: relative;
				
				background: rgba(var(--color-primary-500));
				border: 4px solid rgba(var(--color-primary-100));
				border-radius: 15px;
				
				
				padding: 0.25cm;
			"
		>
			Cluck
		</div>
	</div>
	{/if}

	<div
		style="
			position: relative;
			bottom: 0.125cm;
			left: 0.5cm;
			
			height: 3cm;
			width: 3cm;

			background: rgba(var(--color-primary-500));
			border: 4px solid rgba(var(--color-primary-100));
			
			border-radius: 50%;
		"
	>
		<div
			style="
				position: relative;
				top: 0%;
				left: 0%;
				
				height: 100%;
				width: 100%;

				border-radius: 50%;
				
				font-size: 2em;
				
				overflow-y: hidden;
			"
		>
			<img 
				src={ Pig } 
				alt="pig"
				
				style=""
			/>
		</div>
		
		<div 
			style="
				position: absolute;
				bottom: -0.25cm;
				left: 50%;
				transform: translateX(-50%);
				
				
				padding: 0cm 0.75cm;
				border: 2px solid rgba(var(--color-primary-100));
			"
			class="card p-1 variant-filled-surface"
		>
			<p>Mutualism</p>
		</div>
	</div>
	
	{/if}
</div>