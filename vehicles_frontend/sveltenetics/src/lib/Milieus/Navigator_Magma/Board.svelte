

<script>

//\\
//
//
import Milieus_Button from '$lib/Milieus/Button/Trinket.svelte'
import Milieus_Truck from '$lib/Milieus/Truck/Trinket.svelte'
//
////

let Milieus_Freight = "";

</script>

<div
	style="
		padding: 2cm 1cm;
	"
>
	<Milieus_Truck on_change={ ({ freight }) => { Milieus_Freight = freight; } } />
	{#if typeof Milieus_Freight === "object" }
	<Milieus_Button
		monitor="Vows"
	
		name={ Milieus_Freight.nav_linguistics === "yes" ? Milieus_Freight.linguistics ["Vows"] : "Vows" }
		location={[ "Vows", "Leaf" ]}
		is_open_location={[ "Vows" ]}
		
		style="
			padding: 0.25cm 1cm;
		"
	/>
	<Milieus_Button
		monitor="Greetings"
	
		name={ Milieus_Freight.nav_linguistics === "yes" ? Milieus_Freight.linguistics ["Greetings"] : "Greetings" }
		location={[ "Greetings" ]}
		is_open_location={[ "Greetings" ]}
		
		style="
			padding: 0.25cm 1cm;
		"
	/>
	{/if}
</div>