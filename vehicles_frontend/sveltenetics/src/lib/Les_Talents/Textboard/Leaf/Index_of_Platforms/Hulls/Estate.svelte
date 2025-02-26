
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
import { parse_styles } from '$lib/trinkets/styles/parse'
//
////

let TF = false;
onMount (() => {
	Textboard_Truck.freight ().fonctions.guests.hulls.status ();
}); 



</script>


<Textboard_Truck_Ride on_change={ ({ pro_freight }) => { TF = pro_freight; } } />
{#if typeof TF === "object" }
<div
	monitor="hulls producer navigation"
>
	{#if TF.info.is_producer === "yup" }
	<div 
		style="
			overflow-y: scroll;
			min-height: 100px;
		"
		class="card p-1 variant-soft-surface"
	>
		status: { TF.info.hulls_status }
	
		<Petition_APT_Button
			onMount={({ mode }) => {
				mode ("on");
			}}
			button_text={ `Pause Platforms as Producer` }
			APT="0"
			clicked={() => {
				TF.fonctions.producer.hulls.status_pause ();
			}}
		/>
		<Petition_APT_Button
			onMount={({ mode }) => {
				mode ("on");
			}}
			button_text={ `Play Platforms as Producer` }
			APT="0"
			clicked={() => {
				TF.fonctions.producer.hulls.status_play ();
			}}
		/>
	</div>
	{/if}
</div>
{/if}