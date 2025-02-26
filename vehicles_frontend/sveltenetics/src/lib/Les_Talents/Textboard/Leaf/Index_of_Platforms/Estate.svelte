


<script>



////
//
import { onMount, onDestroy } from 'svelte'
//
//
import { parse_styles } from '$lib/trinkets/styles/parse'
import Textboard_Truck_Ride from '$lib/Les_Talents/Textboard/Truck/Ride.svelte'
import Petition_APT_Button from "$lib/Singles/Extension_Winch/Petition/APT_Button.svelte"
import * as Textboard_Truck from "$lib/Les_Talents/Textboard/Truck/index.js"
//
////

let TF = false;

const on_click = ({ name }) => {
	TF.fonctions.guests.hull.show ({ name });
}

onMount (() => {
	Textboard_Truck.freight ().fonctions.guests.hulls.retrieve_hulls ();
}); 

</script>



<Textboard_Truck_Ride on_change={ ({ pro_freight }) => { TF = pro_freight; } } />
{#if typeof TF === "object" }
<div 
	style="
		display: flex;
		flex-direction: column;
		gap: 0.1cm;
	"
	class="card p-1 variant-soft-surface"
>
	<label class="label">
		<input 
			bind:value={ TF.info.platform_name }
			style="
				padding: 0.25cm;
			"
			class="input" 
			type="text" 
		/>
	</label>
	
	<div
		style="
			width: 100%;
			max-width: 5cm;
		"
	>
		<select class="select">
			<option value="1">Option 1</option>
			<option value="2">Option 2</option>
		</select>
	</div>
</div>

<div 
	style="
		height: 100%;
		overflow-y: scroll;
	"
>
	{#if TF.info.is_producer === "yup" }
	<div 
		style="
			overflow-y: scroll;
			min-height: 100px;
		"
		class="card p-1 variant-soft-surface"
	>
		<Petition_APT_Button
			onMount={({ mode }) => {
				mode ("on");
			}}
			button_text={ `Pause Platforms as Producer` }
			APT="0"
			clicked={() => {
				TF.fonctions.producer.hull.delete_platform ({
					platform_name: hull.name
				});
			}}
		/>
		<Petition_APT_Button
			onMount={({ mode }) => {
				mode ("on");
			}}
			button_text={ `Play Platforms as Producer` }
			APT="0"
			clicked={() => {
				TF.fonctions.producer.hull.delete_platform ({
					platform_name: hull.name
				});
			}}
		/>
	</div>
	{/if}
	
	<div style="height: 0.25cm" />
	
	<div
		style="
			padding: 0.1cm;
		
			display: flex;
			flex-direction: column;
			gap: 0.1cm;
		"
		class="card p-1 variant-soft-surface"
	>
		{#each TF.info.hulls as hull }
		<div
			style="
				padding: 0.1cm;
				width: 100%;
			"
			class="card"
		>
			<div
				style="
					display: flex;
					flex-direction: row;
					justify-content: space-between;
					gap: 0.1cm;
				"
			>
				<button
					on:click={() => { 
						on_click ({ name: hull.name });
					}}
					style={
						parse_styles ({
							"min-height": "20px",
							"min-width": "50px"
						})
					}
					class="card p-1 variant-filled-primary"
				>
					<span class="badge variant-filled-surface">{ hull.count_of_texts } { hull.button_text }</span>
					<span>"{ hull.name }"</span>
				</button>
				
				{#if hull.status !== "playing" }
				<span class="badge variant-filled-surface">{ hull.status }</span>
				{/if}
			</div>
			
			{#if TF.info.is_producer === "yup" }
			<div
				style="
					margin-top: 0.1cm;
					
					display: grid;
					flex-direction: row;
					gap: 0.1cm;
				"
			>
				<Petition_APT_Button
					onMount={({ mode }) => {
						mode ("on");
					}}
					button_text={ `Delete Platform "${ hull.name }" as Producer` }
					APT="0"
					clicked={() => {
						TF.fonctions.producer.hull.delete_platform ({
							platform_name: hull.name
						});
					}}
				/>
				<Petition_APT_Button
					onMount={({ mode }) => {
						mode ("on");
					}}
					button_text={ `Delete Every Text of Platform "${ hull.name }" as Producer` }
					APT="0"
					clicked={() => {
						TF.fonctions.producer.hull.delete_every_text ({
							platform_name: hull.name
						});
					}}
				/>
				
				
				<div style="height: 0.25cm" />
				<header>Status</header>
				<Petition_APT_Button
					onMount={({ mode }) => {
						mode ("on");
					}}
					button_text={ `Pause Platform "${ hull.name }" as Producer` }
					APT="0"
					clicked={() => {
						TF.fonctions.producer.hull.status.pause ({ platform_name: hull.name });
					}}
				/>
				<Petition_APT_Button
					onMount={({ mode }) => {
						mode ("on");
					}}
					button_text={ `Play Platform "${ hull.name }" as Producer` }
					APT="0"
					clicked={() => {
						TF.fonctions.producer.hull.status.play ({ platform_name: hull.name });
					}}
				/>
			</div>
			{/if}
		</div>
		{/each}
	</div>
</div>
{/if}