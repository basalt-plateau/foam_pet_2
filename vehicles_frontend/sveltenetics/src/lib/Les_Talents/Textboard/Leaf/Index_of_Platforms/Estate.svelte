


<script>

////
//
import { onMount, onDestroy } from 'svelte'
//
//
import Textboard_Truck_Ride from '$lib/Les_Talents/Textboard/Truck/Ride.svelte'
import Petition_APT_Button from "$lib/Singles/Extension_Winch/Petition/APT_Button.svelte"
import * as Textboard_Truck from "$lib/Les_Talents/Textboard/Truck/index.js"
//
////

let TF = false;

const on_click = ({ name }) => {
	TF.fonctions.platform.show ({ name });
}

onMount (() => {
	Textboard_Truck.freight ().fonctions.retrieve_hulls ();
}); 

</script>


<div 
	style="
		height: 100%;
	"
	class="card p-2 variant-soft-surface"
>
	<Textboard_Truck_Ride on_change={ ({ pro_freight }) => { TF = pro_freight; } } />
	{#if typeof TF === "object" }
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
			padding: 0.25cm 0;
		
			display: flex;
			flex-direction: column;
			gap: 0.1cm;
		"
	>
		{#each TF.info.hulls as hull }
		<div
			style="
				padding: 0.25cm;
				width: 100%;
			"
			class="card p-4"
		>
			<button
				on:click={() => { 
					on_click ({ name: hull.name });
				}}
				class="card p-2 variant-filled-primary"
				style="
					min-height: 20px;
					min-width: 50px;
				"
			>
				<span>"{ hull.name }"</span>
				<span class="badge variant-filled-surface">{ hull.count_of_texts } { hull.button_text }</span>
			</button>
			
			{#if TF.info.is_producer === "yup" }
			<div
				style="
					margin-top: 0.1cm;
					
					display: flex;
					flex-direction: row;
					gap: 0.1cm;
				"
			>
				<Petition_APT_Button
					onMount={({ mode }) => {
						mode ("on");
					}}
					button_text={ `Delete "${ hull.name }" as Producer` }
					APT="0"
					clicked={() => {
						
					}}
				/>
				<Petition_APT_Button
					onMount={({ mode }) => {
						mode ("on");
					}}
					button_text={ `Pause "${ hull.name }" as Producer` }
					APT="0"
					clicked={() => {}}
				/>
			</div>
			{/if}
		</div>
		{/each}
	</div>
	{/if}
</div>