
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
	monitor="hulls ruler navigation"
	style="
		display: flex;
		gap: 0.25cm;
		flex-direction: column;
	"
>
	<header>Ruler Regulators</header>

	<div 
		style=""
		class="card p-1 variant-soft-surface"
	>
		<Petition_APT_Button
			onMount={({ mode }) => {
				mode ("on");
			}}
			button_text={ `Begin Platforms as Ruler` }
			APT="0"
			clicked={() => {
				TF.fonctions.ruler.hulls.begin ();
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
			button_text={ `Pause Platforms as Ruler` }
			APT="0"
			clicked={() => {
				TF.fonctions.ruler.hulls.status_pause ();
			}}
		/>
		<Petition_APT_Button
			onMount={({ mode }) => {
				mode ("on");
			}}
			button_text={ `Play Platforms as Ruler` }
			APT="0"
			clicked={() => {
				TF.fonctions.ruler.hulls.status_play ();
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
			button_text={ `[Caution!] Delete Entire TextVitrine` }
			APT="0"
			clicked={() => {
				TF.fonctions.ruler.hulls.delete_textboard ();
			}}
		/>
	</div>
</div>
{/if}