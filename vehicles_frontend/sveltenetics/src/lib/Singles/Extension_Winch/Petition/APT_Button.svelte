


<script>

/*
	import { APT_Button_Press } from "$lib/Singles/Extension_Winch/Petition/APT_Button_Press.js"
	import Petition_APT_Button from "$lib/Singles/Extension_Winch/Petition/APT_Button.svelte"
	let petition_APT_button = "";
	
	<Petition_APT_Button
		bind:this={ petition_APT_button }
		
		onMount={() => {
			petition_APT_button.mode ("on");
		}}
	
		button_text="Buy 1 Membership Pass"
		
		APT="0"
		clicked={
			APT_Button_Press ()
		}
	/>
*/

/*
	petition_APT_button.mode ("on");

	petition_APT_button.mode ("progress");

	petition_APT_button.mode ("success", {
		note: "was successful"
	});

	petition_APT_button.mode ("imperfection", {
		note: "imperfection"
	});
*/

/*
	modes:
		on
		off
		progress
		
		imperfection
		success
*/

////
//
import { onMount as _onMount } from 'svelte'
//
//
import { parse_styles } from '$lib/trinkets/styles/parse'
//
import Extension_Winch_Ride from '$lib/Singles/Extension_Winch/Ride.svelte'
import Radial_Progress from '$lib/trinkets/Progress/Radial/Trinket.svelte'
import Alert_Success from '$lib/trinkets/Alerts/Success.svelte'
import Problem_Alert from '$lib/trinkets/Alerts/Problem.svelte'
//
////

		

let Extension_Winch_Freight = false

export let button_text = ""
export let APT = ""
export let clicked = () => {}
export let onMount = () => {}


const _clicked = (event) => {
	clicked (event);
}


let details = ""
let the_mode = "off"
export const mode = (next_the_mode, next_details) => {
	console.log (next_the_mode, next_details);
	
	if (next_details && next_details.note) {
		details = next_details.note;
	}
	the_mode = next_the_mode;
}

const EWR_Change = ({ pro_freight }) => {
	Extension_Winch_Freight = pro_freight;
	
	if (typeof Extension_Winch_Freight === "object") {
		
	}
}

_onMount (() => {
	onMount (() => {
		
	});
});

/*

*/
</script>


<Extension_Winch_Ride on_change={ EWR_Change } />
{#if typeof Extension_Winch_Freight === "object"}
<div
	style="
		position: relative;
		display: inline-block;
	"
>
	
	<button 
		type="button" 
		on:click={ clicked }

		style={ parse_styles (Object.assign ({}, {
			padding: "0.1cm 0.15cm 0.1cm 0.25cm",
			position: "relative",
			overflow: 'hidden',
			background: 'linear-gradient(22deg, rgb(var(--color-surface-500)), rgb(var(--color-primary-500)), rgb(var(--color-success-300)))',
			border: '2px solid rgb(var(--color-surface-300))',
			
			
		})) }
		
		class="btn variant-filled-primary"
	>
		<span 
			style="
				display: flex;
				
				justify-content: center;
				align-items: stretch;
			
				flex-direction: row;
			"
		>
			<span
				style="
					font-size: 1.2em;
					font-weight: bold;
					
					height: 100%;
					padding: 0 0.5cm;
				"	
			>{ button_text }</span>
		</span>

		<span 
			style="
				display: flex;
				
				justify-content: center;
				align-items: stretch;
			
				flex-direction: row;
			"
		>
			<div
				style="
					display: flex;
					
					justify-content: center;
					align-items: center;
				
					flex-direction: row;
					gap: 0.0cm;
					
					background: linear-gradient(22deg, rgb(var(--color-success-500)), rgb(var(--color-surface-500)), rgb(var(--color-primary-300)));
					border: 2px solid rgb(var(--color-surface-500) / 0.4);
					
					padding: 0.1cm 0.4cm;
				"
				class="badge variant-filled-surface"
			>
				
				<img 
					src="/_Licensed/Aptos/aptos.png" 
					style="
						width: 0.5cm;
						height: 0.5cm;
					"
				/>
				
				<span
					style="
						font-size: 1.2em;	
						transform: translateY(2px);
					"
				>{ APT }</span>
				<span
					style="
						font-size: 1.2em;		
						transform: translateY(2px);
					"
				>+</span>
				
				{#if APT !== "0" }
				{/if}
				
				<span
					style="
						font-size: 1.2em;		
						transform: translateY(2px);
					"
				>Gas</span>
			</div>
		</span>		
	</button>

	{#if [ "off", "progress" ].includes (the_mode) }
	<div
		style="
			position: absolute;
			top: 0;
			left: 0;
			
			width: 100%;
			height: 100%;
			
			display: flex;
			justify-content: center;
			align-items: center;
		
			background: white;
			opacity: 0.7;
			
			cursor: not-allowed;
		"
	>		
		{#if [ "progress" ].includes (the_mode) }
		<Radial_Progress />
		{/if}
	</div>
	{/if}
	
	{#if [ "success" ].includes (the_mode) }
	<Alert_Success 
		text={ details }
	/>	
	{/if}
	
	{#if [ "imperfection" ].includes (the_mode) }
	<Problem_Alert 
		text={ details }
	/>
	{/if}
	
</div>
{/if}