

<script>

import Textboard_Truck_Ride from '$lib/Les_Talents/Textboard/Truck/Ride.svelte'
let TF = "";

let le_text = "";
let le_textboard = "";

let petition_APT_button = "";

let on_send = () => {}

</script>


<Textboard_Truck_Ride on_change={ ({ pro_freight }) => { TF = pro_freight; } } />
{#if typeof TF === "object" }
<div
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
			
			onMount={() => {
				petition_APT_button.mode ("off");
			}}
		
			button_text={
				`Write or overwrite on "${ TF.info.platform_name }"` 
			}
			
			APT="1"
			clicked={ on_send }
		/>
	</div>
</div>
{/if}