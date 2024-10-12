



<script>


/*
	import Problem_Alert from '$lib/trinkets/Alerts/Problem.svelte'
	<Problem_Alert 
		text={}
		text_2={}
	/>
*/

/*
	TODO:

	import Problem_Alert from '$lib/trinkets/Alerts/Problem.svelte'
	<Problem_Alert show="yes">	
		
	</Problem_Alert>
*/


import { onMount } from 'svelte'
import { ConicGradient } from '@skeletonlabs/skeleton';
import Eternal_1_Progress from '$lib/trinkets/Progress/Eternal_1/Trinket.svelte'

export let text = "";
export let text_2 = "";
export let show = "no"

export let size = "regular"

const conicStops = [
	{ color: 'transparent', start: 0, end: 25 },
	{ color: 'rgb(var(--color-primary-500))', start: 75, end: 100 }
];

onMount (() => {})

// let wait_color = document.documentElement.classList.contains ("dark") ? "#000000" : "#FF0000";
// let wait_color = document.documentElement.classList.contains ("dark") ? "#000000" : "#FFFFFF";
let wait_color = "#000000";

let show_the_alert = (
	(typeof text === "string" && text.length >= 1) ||
	show === "yes"
)

let aside_styles = `
	display: flex; 
	flex-direction: row;
	align-items: center;
	
	padding: 12px; 
`
let progress_styles = ``
if (size === "small") {
	aside_styles = `
		display: flex; 
		flex-direction: row;
		align-items: center;
		
		padding: 4px; 
	`	
	
	progress_styles = `
		transform: scale(0.7)
	`
}


</script>

{#if show_the_alert === true }
<aside 
	monitor="problem alert"
	class="alert variant-filled-error" 
	style={ aside_styles }
>	
	<div
		style={ progress_styles }
	>
		<Eternal_1_Progress 
			width={ "50px" } 
			height={ "35px" }
			color={ wait_color }
		/>
	</div>
	
	<div 
		style="
			padding: 0 0 0 10px; 
			margin: 0; 
			text-align: center;
			
		"
		class="alert-message" 
	>
		<slot></slot>
	
		{#if text.length >= 1}
		<p
			style="
				font-weight: bold;
			"
		>{ text }</p>
		{/if}
		
		{#if text_2.length >= 1}
		<p>{ text_2 }</p>
		{/if}
	</div>
</aside>
{/if}