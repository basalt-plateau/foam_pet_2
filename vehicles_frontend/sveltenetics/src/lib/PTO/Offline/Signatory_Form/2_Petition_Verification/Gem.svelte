
<script>


import Petition2_Bracket from '$lib/PTO/Offline/Petition/Bracket/Gem.svelte'
import Petition2_Bracket_Details from '$lib/PTO/Offline/Petition/Bracket/Details.svelte'
		
import Signatory_Truck from '$lib/PTO/Offline/Signatory_Form/Truck/Ride.svelte'
let ST_Freight = false




</script>

<div
	style="
		display: flex;
		gap: 0.25cm;
		
		flex-direction: column;
		
		padding: 0.25cm 0.25cm 5cm; 
	"
>
	<Signatory_Truck on_change={ ({ pro_freight }) => { ST_Freight = pro_freight; } } />
		
	{#if typeof ST_Freight === "object"}
	<Petition2_Bracket_Details />
	<Petition2_Bracket 
		petition_AO_fiberized={ ST_Freight.petition_fiberized }
	/>
	{/if}
</div>


