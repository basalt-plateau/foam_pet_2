
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
	style="
		display: flex;
		gap: 0.25cm;
		flex-direction: column;
	"
>
	{#if TF.info.is_producer === "yup" }
	<div 
		style=""
		class="card p-1 variant-soft-surface"
	>
		<Petition_APT_Button
			onMount={({ mode }) => {
				mode ("on");
			}}
			button_text={ `Begin Platforms as Producer` }
			APT="0"
			clicked={() => {
				TF.fonctions.producer.hulls.status_pause ();
			}}
		/>
	</div>
	<div 
		style=""
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
	<div 
		style=""
		class="card p-1 variant-soft-surface"
	>
		<Petition_APT_Button
			onMount={({ mode }) => {
				mode ("on");
			}}
			button_text={ `[Caution!] Delete Textboard` }
			APT="0"
			clicked={() => {
				TF.fonctions.producer.hulls.delete_textboard ();
			}}
		/>
	</div>
	{/if}
</div>
{/if}