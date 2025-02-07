

<script>

//\\
//
//
import Milieus_Button from '$lib/Milieus/Button/Trinket.svelte'
import Milieus_Truck from '$lib/Milieus/Truck/Trinket.svelte'
import Versies_Truck from '$lib/Versies/Trucks.svelte'
//
////
import Greetings_Frontier from "$lib/Les_Talents/Greetings/Frontier/Board.svelte"

let Milieus_Freight = "";
let Versies_Freight = "";

</script>

<div
	style="
		padding: 1cm 1cm;
		
		background: rgba(var(--color-surface-400));
	"
>
	<Milieus_Truck on_change={ ({ freight }) => { Milieus_Freight = freight; } } />
	<Versies_Truck on_change={ ({ freight }) => { Versies_Freight = freight } } />
	{#if typeof Milieus_Freight === "object" && typeof Versies_Freight === "object" }
	<div
		style="
			display: flex;
			gap: 0.5cm;
			flex-direction: row;
			justify-content: center;
		"
	>
		<Milieus_Button
			monitor="Vows"
		
			name={ "Vows" }
			location={[ "Vows", "Leaf" ]}
			is_open_location={[ "Vows" ]}
			
			style="
				padding: 0.25cm 1cm;
			"
		/>

		<Greetings_Frontier />

		{#if Versies_Freight.mode === "nurture" }
		<Milieus_Button
			monitor={ "Bourgeoisie" }
			name={ "Bourgeoisie" }
			location={[ "Bourgeoisie" ]}
			is_open_location={[ "Bourgeoisie" ]}
		/>
		{/if}
	</div>
	{/if}
</div>