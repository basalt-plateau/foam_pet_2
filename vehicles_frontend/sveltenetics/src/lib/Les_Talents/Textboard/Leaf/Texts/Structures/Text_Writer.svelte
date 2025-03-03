




<script>

////
//
import { onMount, onDestroy } from 'svelte'
//
//
import * as Textboard_Truck from "$lib/Les_Talents/Textboard/Truck/index.js"
import Petition_APT_Button from "$lib/Singles/Extension_Winch/Petition/APT_Button.svelte"
import Textboard_Truck_Ride from '$lib/Les_Talents/Textboard/Truck/Ride.svelte'
import { SlideToggle } from '@skeletonlabs/skeleton';
//
////

import Textboard_Rules_Frontier from "$lib/Les_Talents/Textboard_Rules/Frontier/Tome.svelte"

let TF = "";
let petition_APT_button = "";

let on_send = async () => {
	TF.fonctions.guests_plays.text.send_text ();
}

let accepted_the_rules = "";
$: {
	let _accepted_the_rules = accepted_the_rules;
	if (typeof petition_APT_button === "object") {
		if (_accepted_the_rules === "I consent.") {
			petition_APT_button.mode ("off");
		}
		
		petition_APT_button.mode ("on");
	}
}

let slide_toggle_checked = false

let TT_Monitor;
let TT_Freight;
onMount (async () => {
	TT_Freight = Textboard_Truck.retrieve ().pro_freight; 
	
	TT_Monitor = Textboard_Truck.monitor (async ({
		original_freight,
		pro_freight, 
		//
		target,
		//
		property, 
		value
	}) => {
		try {
			if (target === original_freight.info && property === "text") {
				console.info ("text changed", pro_freight.info.text);
				if (pro_freight.info.text.length >= 1) {
					petition_APT_button.mode ("on");
				}
				else {
					petition_APT_button.mode ("off");
				}
			}
		}
		catch (imperfection) {
			console.error (imperfection);
		}
	});
});

onDestroy (() => { TT_Monitor.stop () });


</script>



<div
	monitor="text writer"
	style="
		position: relative;
	
		display: flex;
		border-radius: 4px;
		justify-content: right;
		flex-direction: column;
		
		gap: 0.1cm;
	"
>
	<Textboard_Truck_Ride on_change={ ({ pro_freight }) => { TF = pro_freight; } } />
	{#if typeof TF === "object" }
	<textarea
		bind:value={ TF.info.text }
		style="
			width: 100%;
		"
		class="textarea p-1"
	></textarea>
	
	<div
		style="
			display: flex;
			align-items: center;
			gap: 0.1cm;
			justify-content: space-between;
		"
	>	
		<div
			style="
				display: flex;
				align-items: center;
				gap: 0.25cm;
			"
		>
			<div class="card p-1">
				<p>Please write "I accept." to indicate that you accept these rules:</p>
			</div>
			<Textboard_Rules_Frontier />
		</div>
		<input 
			bind:value={ accepted_the_rules }
			style="
				width: 4cm;
				padding: 0.1cm;
			"
			class="input"
		/>
	</div>
	
	<div
		style="
			border-radius: 4px;
			width: 100%;
		"
	>	
		<Petition_APT_Button
			bind:this={ petition_APT_button }
			onMount={() => { 
				if (TF.info.platform_name.length >= 1) {
					petition_APT_button.mode ("on"); 
				}
				else {
					petition_APT_button.mode ("off"); 
				}
			}}
			
			button_text={ `Send to "${ TF.info.platform_name }"` }
			APT="1"
			clicked={ on_send }
		/>
	</div>
	
	{#if false}
	<label class="label">
		<span>Input</span>
		<input class="input" type="text" placeholder="Input" />
	</label>
	{/if}
	
	
	
	{/if}
</div>
