


<script>

import { onMount, onDestroy } from 'svelte'
import Textboard_Truck_Ride from '$lib/Les_Talents/Textboard/Truck/Ride.svelte'
let TF = false;



</script>


<div 
	style="
		height: 100%;
	"
	class="card p-2 variant-soft-surface"
>
	<Textboard_Truck_Ride on_change={ ({ pro_freight }) => { TF = pro_freight; } } />
	{#if typeof TF === "object" }
	<div>
	
	
	</div>
	
	
	
	
	{/if}
</div>