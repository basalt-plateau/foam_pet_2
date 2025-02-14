




<script>

////
//
import { onMount, onDestroy } from 'svelte'
//
//
import * as Textboard_Truck from "$lib/Les_Talents/Textboard/Truck/index.js"
import Petition_APT_Button from "$lib/Singles/Extension_Winch/Petition/APT_Button.svelte"
import Textboard_Truck_Ride from '$lib/Les_Talents/Textboard/Truck/Ride.svelte'
//
////

let TF = "";
let petition_APT_button = "";

let on_send = async () => {
	TF.fonctions.send_text ();
}


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

onDestroy (() => {
	TT_Monitor.stop ()
});


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
	class="card p-4 variant-soft-surface"
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
			border-radius: 4px;
			width: 100%;
		"
	>	
		<Petition_APT_Button
			bind:this={ petition_APT_button }
			onMount={() => { petition_APT_button.mode ("off"); }}
			button_text={ `Write or overwrite on "${ TF.info.platform_name }"` }
			APT="1"
			clicked={ on_send }
		/>
	</div>
	{/if}
</div>
