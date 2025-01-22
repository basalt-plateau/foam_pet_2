

<script>

import Petition_APT_Button from "$lib/Singles/Extension_Winch/Petition/APT_Button.svelte"

import * as Truck_1 from '$lib/Les_Talents/Sport_Pack/Panel/Truck/index.js'
import Truck_1_Ride from '$lib/Les_Talents/Sport_Pack/Panel/Truck/Ride.svelte'
let Truck_1_Freight = false



const begin = () => {
	
}

const end = () => {
	
}

</script>

<Truck_1_Ride on_change={ ({ pro_freight }) => { Truck_1_Freight = pro_freight; } } />
{#if typeof Truck_1_Freight === "object"}
<div
	style="
		display: flex;
		gap: 0.1cm;
		flex-direction: column;
	"
>
	<div class="card p-4"
		style="
			width: 100%;
			text-align: center;
			
			display: flex;
			justify-content: space-around;
		"
	>
		<Petition_APT_Button
			button_text="Begin"
			APT="0"
			clicked={ begin }
			
			permitted={ "yes" }
		/>
		
		<Petition_APT_Button
			button_text="End"
			APT="0"
			clicked={ end }
			
			permitted={ "yes" }
		/>
	</div>
	
	<div class="card p-4"
		style="
			width: 100%;
			text-align: center;
		"
	>

	</div>
</div>
{/if}
