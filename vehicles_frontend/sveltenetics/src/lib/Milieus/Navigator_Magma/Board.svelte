

<script>

//\\
//
//
import Milieus_Button from '$lib/Milieus/Button/Trinket.svelte'
import Milieus_Truck from '$lib/Milieus/Truck/Trinket.svelte'
//
////
import Greetings_Frontier from "$lib/Les_Talents/Greetings/Frontier/Board.svelte"

let Milieus_Freight = "";

</script>

<div
	style="
		padding: 2cm 1cm;
		
		display: flex;
		gap: 1cm;
		flex-direction: column;
	"
>
	<Milieus_Truck on_change={ ({ freight }) => { Milieus_Freight = freight; } } />
	{#if typeof Milieus_Freight === "object" }
	<div
		style="
			display: flex;
			gap: 1cm;
			flex-direction: row;
		"
	>
		<Milieus_Button
			monitor="Vows"
		
			name={ Milieus_Freight.nav_linguistics === "yes" ? Milieus_Freight.linguistics ["Vows"] : "Vows" }
			location={[ "Vows", "Leaf" ]}
			is_open_location={[ "Vows" ]}
			
			style="
				padding: 0.25cm 1cm;
			"
		/>

		<Greetings_Frontier />
	</div>

	{/if}
</div>