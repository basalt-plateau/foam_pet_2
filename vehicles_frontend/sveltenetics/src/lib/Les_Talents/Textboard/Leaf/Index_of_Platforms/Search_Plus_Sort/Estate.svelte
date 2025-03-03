

<script>

////
//
import Textboard_Truck_Ride from '$lib/Les_Talents/Textboard/Truck/Ride.svelte'
//
////

let TF = false;


</script>

<Textboard_Truck_Ride on_change={ ({ pro_freight }) => { TF = pro_freight; } } />
{#if typeof TF === "object" }
<div 
	monitor="search + sort platforms"
	style="
		display: flex;
		flex-direction: row;
		gap: 0.1cm;
	"
	class="card p-1 variant-soft-surface"
>
	<label 
		style="
			width: 100%;
		"
		class="label"
	>
		<input 
			bind:value={ TF.info.platform_name }
			style="
				padding: 0.25cm;
			"
			class="input" 
			type="text" 
		/>
	</label>
	

	<select class="select">
		<option value="1">Sort by Name</option>
		<option value="2">Sort by Texts</option>
	</select>
</div>
{/if}