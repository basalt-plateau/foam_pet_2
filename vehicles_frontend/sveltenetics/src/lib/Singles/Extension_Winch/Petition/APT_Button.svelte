


<script>

/*
	import Petition_APT_Button from "$lib/Singles/Extension_Winch/Petition/APT_Button.svelte"
	<Petition_APT_Button
		button_text="Buy 1 Membership Pass"
		
		APT="0"
		clicked={}
	
		permitted={ "yes" }
	/>
*/

////
//
import { parse_styles } from '$lib/trinkets/styles/parse'
import Extension_Winch_Ride from '$lib/Singles/Extension_Winch/Ride.svelte'
//
////

let Extension_Winch_Freight = false

export let button_text = ""
export let APT = ""
export let clicked = () => {}

export let permitted = "no"



</script>


<div
	style="
		position: relative;
	"
>
	<Extension_Winch_Ride on_change={ ({ pro_freight }) => { Extension_Winch_Freight = pro_freight; } } />
	{#if typeof Extension_Winch_Freight === "object"}

	{#if permitted === "yes" }
	<button 
		type="button" 
		on:click={ clicked }

		style={ parse_styles (Object.assign ({}, {
			padding: "0.2cm 0.25cm 0.2cm 0.5cm",
			position: "relative"
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
				<span
					style="
						font-size: 1.2em;		
						transform: translateY(2px);
					"
				>Gas</span>
			</div>
		</span>
	</button>
	{:else}
	<div
		style="
			position: relative;
			top: 0;
			left: 0;
			height: 100%;
			
			display: inline-flex;
			justify-content: center;
			align-items: center;
			
			padding: 0.1cm 1cm;
		"
		class="card"
	>
		<span
			style="
				font-size: 1.2em;
				font-weight: bold;
				text-decoration: line-through;
			"	
		>{ button_text }</span>
	</div>
	{/if}
	{/if}
</div>