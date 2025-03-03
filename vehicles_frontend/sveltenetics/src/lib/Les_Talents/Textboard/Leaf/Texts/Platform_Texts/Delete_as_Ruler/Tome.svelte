
<script>

import Amount_Tome from '$lib/trinkets/Amount/Tome.svelte'
import Petition_APT_Button from "$lib/Singles/Extension_Winch/Petition/APT_Button.svelte"
import Textboard_Truck_Ride from '$lib/Les_Talents/Textboard/Truck/Ride.svelte'

export let text = {}
export let platform_name = "";

let amount_field = "";
let TF = {}


let amount_of_octas = "100000000";

</script>



<Textboard_Truck_Ride on_change={ ({ pro_freight }) => { TF = pro_freight; } } />
{#if typeof TF === "object" }
<div
	style="
		display: grid;
		grid-template-columns: 1fr 1fr;
		gap: 0.1cm;
		align-content: center;
		justify-content: center;
	"
	class="card p-2 variant-filled-surface"
>
	<Amount_Tome 
		bind:this={ amount_field }
		on_change={({ 
			effects,
			actual_amount_of_Octas
		}) => {
			if (effects.problems === "") {
				return;
			}
			
			amount_of_octas = actual_amount_of_Octas;
		}}
		on_prepare={() => {
			amount_field.modify_octas ({ Octas: "100000000" });
		}}
	/>
	
	<Petition_APT_Button
		onMount={({ mode }) => {
			mode ("on");
		}}
		button_text="Delete Text as Ruler"
		APT="0"
		clicked={() => {
			TF.fonctions.ruler.text.delete_with_refund_with_index ({
				text,
				platform_name: TF.info.platform_name,
				amount_of_octas
			})
		}}
	/>
</div>
{/if}